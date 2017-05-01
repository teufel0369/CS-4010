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
            <jsp:include page="/WEB-INF/includes/store.css"/>
            <jsp:include page="/WEB-INF/includes/navBarStyleSheet.css"/>
            <jsp:include page="/WEB-INF/includes/footer.css"/>
        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/includes/navBar.html"/>

        <div class="product-flex-container">
            <div class="product-container-item">
                <img src="/vicBrewing.png" class="img-rounded" style="height: 272px; width: 200px;">
                <div class="container-sub-items">
                    <span class="product-description">.50 Cal Bottle Opener</span>
                    <div class="sub-1">
                        <span class="product-price"> $ 20.00 </span>
                    </div>
                    <div class="sub-2">
                        <form method="get" action="cartServlet">
                            <input type="submit" class="btn btn-danger" value="Add to Cart">
                            <input type="hidden" name="productCode" value="50cal1">
                            <input type="hidden" name="task" value="addCart">
                            <input type="hidden" name="sessionID" value="${sessionScope.sessionID}">
                        </form>
                    </div>
                </div>
            </div>
            <div class="product-container-item">
                <img src="/pint.jpeg" class="img-rounded" style="height: 250px; width: 200px;">
                <div class="container-sub-items">
                    <span class="product-description">Pint Beer Glass</span>
                    <div class="sub-1">
                        <span class="product-price"> $ 7.00 </span>
                    </div>
                    <div class="sub-2">
                        <form method="get" action="cartServlet">
                            <input type="submit" class="btn btn-danger" value="Add to Cart">
                            <input type="hidden" name="productCode" value="pintGlass1">
                            <input type="hidden" name="task" value="addCart">
                            <input type="hidden" name="sessionID" value="${sessionScope.sessionID}">
                        </form>
                    </div>
                </div>
            </div>
            <div class="product-container-item">
                <img src="/tulip.jpeg" class="img-rounded" style="height: 220px; width: 200px;">
                <div class="container-sub-items">
                    <span class="product-description">Tulip Beer Glass</span>
                    <div class="sub-1">
                        <span class="product-price"> $ 8.00 </span>
                    </div>
                    <div class="sub-2">
                        <form method="get" action="cartServlet">
                            <input type="submit" class="btn btn-danger" value="Add to Cart">
                            <input type="hidden" name="productCode" value="tulipGlass1">
                            <input type="hidden" name="task" value="addCart">
                            <input type="hidden" name="sessionID" value="${sessionScope.sessionID}">
                        </form>
                    </div>
                </div>
            </div>
            <div class="product-container-item">
                <img src="/beerSampler.jpeg" class="img-rounded" style="height: 200px; width: 200px;">
                <div class="container-sub-items">
                    <span class="product-description">Beer Sampler Platter</span>
                    <div class="sub-1">
                        <span class="product-price"> $ 40.00 </span>
                    </div>
                    <div class="sub-2">
                        <form method="get" action="cartServlet">
                            <input type="submit" class="btn btn-danger" value="Add to Cart">
                            <input type="hidden" name="productCode" value="beerSampler1">
                            <input type="hidden" name="task" value="addCart">
                            <input type="hidden" name="sessionID" value="${sessionScope.sessionID}">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="product-flex-container">
            <div class="product-container-item">
                <img src="/whiteShirt.jpg" class="img-rounded" style="height: 272px; width: 200px;">
                <div class="container-sub-items">
                    <span class="product-description">Men's Victorious Brewing Co.<br>White T-Shirt</span>
                    <div class="sub-1">
                        <span class="product-price"> $ 25.00 </span>
                    </div>
                    <div class="sub-2">
                        <form method="get" action="cartServlet">
                            <input type="submit" class="btn btn-danger" value="Add to Cart">
                            <input type="hidden" name="productCode" value="whiteShirt1">
                            <input type="hidden" name="task" value="addCart">
                            <input type="hidden" name="sessionID" value="${sessionScope.sessionID}">
                        </form>
                    </div>
                </div>
            </div>
            <div class="product-container-item">
                <img src="/blackShirt.JPG" class="img-rounded" style="height: 272px; width: 200px;">
                <div class="container-sub-items">
                    <span class="product-description">Men's Victorious Brewing Co.<br>Black T-Shirt</span>
                    <div class="sub-1">
                        <span class="product-price"> $ 25.00 </span>
                    </div>
                    <div class="sub-2">
                        <form method="get" action="cartServlet">
                            <input type="submit" class="btn btn-danger" value="Add to Cart">
                            <input type="hidden" name="productCode" value="blackShirt1">
                            <input type="hidden" name="task" value="addCart">
                            <input type="hidden" name="sessionID" value="${sessionScope.sessionID}">
                        </form>
                    </div>
                </div>
            </div>
            <div class="product-container-item">
                <img src="/BrewKit.png" class="img-rounded" style="height: 272px; width: 300px;">
                <div class="container-sub-items">
                    <span class="product-description">All-In-One Home Brewing Kit</span>
                    <div class="sub-1">
                        <span class="product-price"> $ 499.00 </span>
                        <form method="get" action="cartServlet">
                            <input type="submit" class="btn btn-danger" value="Add to Cart">
                            <input type="hidden" name="productCode" value="brewKit1">
                            <input type="hidden" name="task" value="addCart">
                            <input type="hidden" name="sessionID" value="${sessionScope.sessionID}">
                        </form>
                    </div>
                    <div class="sub-2">
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br>
    </body>
        <jsp:include page="/WEB-INF/includes/footer.html"/>
</html>
>