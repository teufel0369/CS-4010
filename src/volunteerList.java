//University of Missouri has the right to use this code for educational purposes

import victoriousBrewing.Volunteer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import victoriousBrewing.Volunteer;
import victoriousBrewing.VolunteerDB;
import org.json.simple.*;


public class volunteerList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String url = new String("");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String status = request.getParameter("status");

        Volunteer volunteer = new Volunteer(firstName, lastName, email, status);

        try{
            VolunteerDB.insertUser(volunteer); //insert the user
        }
        catch(Exception e){
            e.printStackTrace();
        }

        url = "/index.jsp";
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }


}
