//University of Missouri has the right to use this code for educational purposes

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class adminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url;
        HttpSession session = request.getSession(); //get the session
        String sessionID = (String) session.getAttribute("sessionID");
        System.out.println(sessionID);
        String task = request.getParameter("name");

        if(task.equals("logout")){

            url = forwardRequest(request, response);

            final Object lock = request.getSession().getId().intern();

            synchronized (lock){
                getServletContext().getRequestDispatcher(url).forward(request, response);
                session.removeAttribute("sessionID");
                session.invalidate();
            }
        }
    }

    private static String forwardRequest(HttpServletRequest request, HttpServletResponse response){
        String url = new String("");
        String name = request.getParameter("name");

        switch(name){ //switch statement to determine which url is appropriate
            case "logout":
                url = "/login.jsp";
                break;
            case "debugging":
                url = "/Debugging.jsp";
                break;
        }

        return url;
    }
}
