//University of Missouri has the right to use this code for educational purposes

import victoriousBrewing.Invoice;
import victoriousBrewing.InvoiceDB;

import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.StringReader;
import java.util.*;

public class SessionTracker extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url;
        HttpSession session = request.getSession(); //get the session
        String userName = request.getParameter("userName");
        String userPass = request.getParameter("userPass");
        String sessionID = new String("admin");
        ArrayList<Invoice> list = InvoiceDB.getInvoices();

        if(userName.equalsIgnoreCase("vicbrewing") && userPass.equals("@dmin123")){

            System.out.println("correct user and pass");
            url = "/admin.jsp";
            session.setAttribute("sessionID", sessionID);
            session.setAttribute("list", list);
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }
        else{
            System.out.println("incorrect user and pass");
            url = "/login.jsp";
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url;
        HttpSession session = request.getSession(); //get the session
        String sessionID = (String) session.getAttribute("sessionID");
        System.out.println(sessionID);

        if(sessionID == null){ //if the session is new

            sessionID = session.getId(); //create a random string
            session.setAttribute("sessionID", sessionID); //set the sessionID to the attribute
            url = forwardRequest(request, response); //get the url
            getServletContext().getRequestDispatcher(url).forward(request, response); //forward to the page
        }
        else{ //if the session is pre-existing

            url = forwardRequest(request, response); //set the URL to the appropriate directory
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }

    }

    private static String forwardRequest(HttpServletRequest request, HttpServletResponse response){
        String url = new String("");
        String name = request.getParameter("name");

        switch(name){ //switch statement to determine which url is appropriate
            case "mission":
                url = "/missionStatement.jsp";
                break;
            case "pastEvents":
                url = "/pastEvents.jsp";
                break;
            case "futureEvents":
                url = "/futureEvents.jsp";
                break;
            case "involve":
                url = "/getInvolved.jsp";
                break;
            case "store":
                url = "/store.jsp";
                break;
            case "join":
                url = "/mailingList.jsp";
                break;
            case "cart":
                url = "/cart.jsp";
                break;
            case "checkout":
                url = "/checkout.jsp";
                break;
            case "login":
                url = "/login.jsp";
                break;
        }

        return url;
    }

    private static String getRandomString(){
        byte[] randbyte=new byte[10];
        Random rand  = new Random(System.currentTimeMillis());
        for (int idx = 0; idx <10; ++idx) {
            int randomInt = rand.nextInt(26); //0<=randomInt<26
            //System.out.println(randomInt);
            randbyte[idx]=(byte)(randomInt+65);
        }
        try {
            String rs=new String(randbyte, "UTF-8");
            //System.out.println(rs);
            return rs;
        } catch (Exception e) {
            //System.out.println("bad string");
            return "bad";
        }
    }
}
