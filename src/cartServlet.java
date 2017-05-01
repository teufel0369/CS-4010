//University of Missouri has the right to use this code for educational purposes

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import org.json.simple.parser.ParseException;
import victoriousBrewing.*;
import org.json.simple.*;


public class cartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(); //get the session
        String task = request.getParameter("task"); //get the task
        String url = new String("");
        String sessionID = (String) session.getAttribute("sessionID");

        if(task.equals("placeOrder")){ //if the task equals placeOrder
            Cart cart;

            final Object lock = request.getSession().getId().intern();
            synchronized (lock){
                cart = (Cart) session.getAttribute("cart"); //get the cart from the session
            }


            ArrayList<LineItem> items = cart.getItems(); //get the items from the cart

            //get all the parameters
            String country = request.getParameter("country");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zip = request.getParameter("zip");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String cardType = request.getParameter("cardType");
            String cardNumber = request.getParameter("cardNumber");
            String code = request.getParameter("cardCode");
            String expirationMonth = request.getParameter("expirationMonth");
            String expirationYear = request.getParameter("expirationYear");
            String total = cart.getFinalTotal();

            //instantiate an invoice object
            Invoice invoice = new Invoice(sessionID, country,firstName,lastName,address,city,state, zip,phone,
                                email,cardType,cardNumber,code,expirationMonth,expirationYear,total,items);

            try {
                InvoiceDB.insertInvoice(invoice, cart); //
            } catch (ParseException e) {
                e.printStackTrace();
            }

            url = "/index.jsp";

            getServletContext().getRequestDispatcher(url).forward(request, response);

            synchronized (lock){
                session.invalidate();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = null;
        ServletContext servletContext = getServletContext(); //get the servlet context object
        HttpSession session = request.getSession(); //session
        String url = new String("");
        String task = request.getParameter("task"); //get the action that the user performed
        String sessionID = (String) session.getAttribute("sessionID"); //get the sessionID

        if(task.equals("addCart")){ //if the task equals addCart
            Cart cart;

            final Object lock = request.getSession().getId().intern();
            synchronized (lock){
                cart = (Cart) session.getAttribute("cart"); //get the cart from the session
            }

            if(cart == null){ //if the cart is null or doesn't exist
                cart = new Cart(); //create a new cart
            }

            int quantity = 1; //because the user can click the "Add to Cart" button multiple times
            String productCode = request.getParameter("productCode"); //get the product code from the request


            try {
                product = ProductDB.getProduct(productCode); //grab the product from the database
            } catch (ParseException e) {
                e.printStackTrace();
            }

            LineItem lineItem = new LineItem(); //create a new line item

            synchronized (lock){
                lineItem.setProduct(product); //set the product in the line item
                lineItem.setQuantity(quantity); //set the quantity *** it's one b/c they can click multiple times
                cart.addItem(lineItem); //add the item to the cart
                session.setAttribute("cart", cart); //add the updated cart back to the session
            }

            System.out.println("The count is: " + cart.getCount()); //**** debugging only so that I can see the count update
            url = "/store.jsp"; //set the url to navigate back to the store
            servletContext.getRequestDispatcher(url).forward(request, response); //forward back to the store
        }
        else if(task.equals("removeItem")){
            Cart cart;

            final Object lock = request.getSession().getId().intern();
            synchronized (lock){
                cart = (Cart) session.getAttribute("cart"); //get the cart from the session
            }


            String productCode = request.getParameter("productCode"); //get the passed in product code


            synchronized (lock){
                cart.removeItem(productCode); //remove that item from the cart
                session.setAttribute("cart", cart); //add the updated cart back to the session
            }

            url = "/cart.jsp"; //set the url to navigate back to the cart
            servletContext.getRequestDispatcher(url).forward(request, response); //forward it
        }
        else if(task.equals("updateCart")){
            Cart cart;
            final Object lock = request.getSession().getAttribute("sessionID");
            synchronized (lock){
                cart = (Cart) session.getAttribute("cart"); //get the cart from the session
            }

            String productCode = request.getParameter("productCode");
            String q = request.getParameter("quantity");
            //ArrayList<LineItem> items = cart.getItems();

            int quantity = Integer.parseInt(q);

            if(quantity == 0){ //if the quantity equals 0
                cart.removeItem(productCode); //remove that item
            }

            cart.updateCart(productCode, quantity); //update the cart
            System.out.println(cart.getCartTotal());

            synchronized (lock){
                session.setAttribute("cart", cart); //add the updated cart back to the session
            }

            url = "/cart.jsp";
            servletContext.getRequestDispatcher(url).forward(request, response); //navigate back to the cart
        }
    }
}
