//University of Missouri has the right to use this code for educational purposes

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import org.json.simple.parser.ParseException;
import victoriousBrewing.User;
import org.json.simple.*;
import victoriousBrewing.UserDB;

public class emailList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url =  new String("");
        String firstName = request.getParameter("firstName"); //get the name parameter
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        User user = new User(firstName, lastName, email); //instantiate a new user object
        String message = new String("");
        boolean flag = false;

        if(UserDB.verifyUser(user)){
            message = "This email already exists<br>" + "Please enter another email";
            url = "/mailingList.jsp";
        }
        else {
            message = "";
            url = "/store.jsp";

            try {
                UserDB.insertUser(user);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("message", message);
        request.setAttribute("user", user);

        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
