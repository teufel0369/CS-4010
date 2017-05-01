<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Victorious Brewing Co.</title>
        <style type="text/css">
            <jsp:include page="/WEB-INF/includes/admin.css"/>
            <jsp:include page="/WEB-INF/includes/navBarStyleSheet.css"/>
            <jsp:include page="/WEB-INF/includes/footer.css"/>
        </style>
    </head>
    <body>
    <jsp:include page="/WEB-INF/includes/navBar.html"/>
    <br/><br/><br/><br/><br/><br/>
   <h1>${sessionScope.sessionID}</h1> <br><br><br>
    <h1><a href="http://github.com/teufel0369/CS-4010">Link to my code</a></h1>
    <br><br>

    <h3>Webapp: The web app was built for a new micro-brewery. It's features include a store, appropriate admin page <br>
        so that the admin
    </h3>
    <h3>Admin Servlet: Manages the logout procedures and session invalidation for the admin page</h3>
    <h3>
        Cart Servlet: Responsible for managing items in the cart, as well as checkout procedures to include writing and <br>
        reading from the Invoice Database.
    </h3>
    <h3>Email Servlet: Responsible for writing accounts to User DB so that people can sign up to be notified about <br>
        future events.
    </h3>
    <h3>SessionTracker Servlet: This servlet is responsible for managing the sessions. It assigns the appropriate <br>
        sessionID to the user based on what they do (shop or login as the admin). If the user logs in as admin, all the <br>
        invoices are set as a session attribute and iterated on the admin main page if the Invoice DB contains invoices.<br>
        Anytime the navbar is clicked and there isn't a session, the session will automatically be started then.
    </h3>
    <br><br><br><br><br><br>


    </body>
    <jsp:include page="/WEB-INF/includes/footer.html"/>
</html>
