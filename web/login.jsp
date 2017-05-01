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
        <jsp:include page="/WEB-INF/includes/cart.css"/>
        <jsp:include page="/WEB-INF/includes/navBarStyleSheet.css"/>
        <jsp:include page="/WEB-INF/includes/footer.css"/>
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/includes/navBar.html"/>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<form method="post" action="./SessionTracker">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-5 col-md-3">
                <div class="form-login">
                    <h4>Admin Login</h4>
                    <input type="text" id="userName" name="userName" class="form-control input-sm chat-input"
                           placeholder="username"/>
                    </br>
                    <input type="password" id="userPassword" name="userPass" class="form-control input-sm chat-input"
                           placeholder="password"/>
                    </br>
                    <div class="wrapper">
                        <span class="group-btn">
                            <button type="submit" class="btn btn-primary btn-md">login<i class="fa fa-sign-in"></i></button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<br><br><br><br><br><br><br>
</body>
<jsp:include page="/WEB-INF/includes/footer.html"/>
</html>
