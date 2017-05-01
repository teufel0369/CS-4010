<!-- University of Missouri has the right to use this code for educational purposes -->

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
            <jsp:include page="/WEB-INF/includes/volunteerList.css"/>
            <jsp:include page="/WEB-INF/includes/navBarStyleSheet.css"/>
            <jsp:include page="/WEB-INF/includes/footer.css"/>
        </style>
    </head>
    <body>
    <jsp:include page="/WEB-INF/includes/navBar.html"/>

    <br><br><h1>Sign up to get involved</h1><br>
    <h2>We are always looking for volunteers.</h2><br>

    <div class="conatainer">
        <form action="/volunteerList" method="post">
            <label class="padTop">Email: </label>
            <input type="email" name="email" value="${volunteer.email}" required><br>
            <label class="padTop">First Name: </label>
            <input type="text" name="firstName" value="${volunteer.firstName}" required><br>
            <label class="padTop">Last Name: </label>
            <input type="text" name="lastName" value="${volunteer.lastName}" margin: 20px required><br>
            <div class="radioLeft">
                <input type="radio" name="status" value="Veteran" required>  Veteran<br>
                <input type="radio" name="status" value="Brewer" required>  Brewer<br>
                <input type="radio" name="status" value="Brewery" required>  Brewery Owners & Managers <br>
            </div>
            <label>&nbsp;</label>
            <input type="submit" value="Submit" class="marginLeft">
        </form>
    </div>

    </body>
    <jsp:include page="/WEB-INF/includes/footer.html"/>
</html>
