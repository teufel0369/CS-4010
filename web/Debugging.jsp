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
            <jsp:include page="/WEB-INF/includes/storyStyleSheet.css"/>
            <jsp:include page="/WEB-INF/includes/navBarStyleSheet.css"/>
            <jsp:include page="/WEB-INF/includes/footer.css"/>
        </style>
    </head>
    <body>
    <jsp:include page="/WEB-INF/includes/navBar.html"/>
    <br/><br/><br/><br/><br/><br/>
   <h1>${sessionScope.sessionID}</h1> <br><br><br>
    <h1><a href="http://github.com/teufel0369/CS-4010">Link to my code</a></h1>

    </body>
    <jsp:include page="/WEB-INF/includes/footer.html"/>
</html>
