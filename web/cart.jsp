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

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

        <div class="container">
            <table id="cart" class="table table-hover table-condensed">
                <tr>
                    <th style="width:50%">Product</th>
                    <th style="width:10%">Price</th>
                    <th style="width:8%">Quantity</th>
                    <th style="width:10%"></th>
                    <th style="width:22%" class="text-center">Subtotal</th>
                </tr>
                <c:forEach var="item" items="${sessionScope.cart.items}">
                    <tr>
                        <td>
                            <c:choose>
                                <c:when test="${item.product.getProductCode() == '50cal1'}">
                                    <img src="http://hoare.cs.umsl.edu/servlet/j-thompson/vicBrewing.png" style="height: 172px; width: 100px">
                                </c:when>
                                <c:when test="${item.product.getProductCode() == 'pintGlass1'}">
                                    <img src="http://hoare.cs.umsl.edu/servlet/j-thompson/pint.jpeg" style="height: 150px; width: 100px">
                                </c:when>
                                <c:when test="${item.product.getProductCode() == 'tulipGlass1'}">
                                    <img src="http://hoare.cs.umsl.edu/servlet/j-thompson/tulip.jpeg" style="height: 120px; width: 100px">
                                </c:when>
                                <c:when test="${item.product.getProductCode() == 'beerSampler1'}">
                                    <img src="http://hoare.cs.umsl.edu/servlet/j-thompson/beerSampler.jpeg" style="height: 100px; width: 100px">
                                </c:when>
                                <c:when test="${item.product.getProductCode() == 'whiteShirt1'}">
                                    <img src="http://hoare.cs.umsl.edu/servlet/j-thompson/whiteShirt.jpg" style="height: 172px; width: 120px">
                                </c:when>
                                <c:when test="${item.product.getProductCode() == 'blackShirt1'}">
                                    <img src="http://hoare.cs.umsl.edu/servlet/j-thompson/blackShirt.JPG" style="height: 172px; width: 120px">
                                </c:when>
                                <c:when test="${item.product.getProductCode() == 'brewKit1'}">
                                    <img src="http://hoare.cs.umsl.edu/servlet/j-thompson/BrewKit.png" style="height: 172px; width: 200px">
                                </c:when>
                            </c:choose>
                                ${item.product.getProductDescription()}
                        </td>
                        <td>${item.product.getPriceCurrencyFormat()}</td>
                        <td>
                            <form method="get" action="./cartServlet">
                                <input type="number" class="form-control text-center" name="quantity" value="<c:out value="${item.getQuantity()}"/>" min="0">
                                <button type="submit" class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                                <input type="hidden" name="task" value="updateCart">
                                <input type="hidden" name="productCode" value="<c:out value="${item.product.getProductCode()}"/>">
                                <input type="hidden" name="sessionID" value="<c:out value="${sessionScope.sessionID}"/>">
                            </form>
                            <form method="get" action="./cartServlet">
                                <button type="submit" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
                                <input type="hidden" name="task" value="removeItem">
                                <input type="hidden" name="productCode" value="<c:out value="${item.product.getProductCode()}"/>">
                                <input type="hidden" name="sessionID" value="<c:out value="${sessionScope.sessionID}"/>">
                            </form>
                        </td>
                        <td></td>
                        <td class="text-center"><c:out value="${item.getTotalCurrency()}"></c:out></td>
                    </tr>
                </c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><strong>Total: <c:out value="${cart.getCartTotal()}"></c:out></strong></td></td>
                    </tr>
            </table>
           <div class="wrapper1">
               <a href="./SessionTracker?name=store" class="btn btn-warning btn-med"><i class="fa fa-angle-left"></i> Continue Shopping</a>
           </div>
           <div class="wrapper3">
               <a href="./SessionTracker?name=checkout" class="btn btn-success btn-med" name="sessionID" value="<c:out value="${sessionScope.sessionID}"/>">Checkout <i class="fa fa-angle-right"></i></a>
           </div>
        </div>
        <br><br><br><br><br><br><br>
    </body>
        <jsp:include page="/WEB-INF/includes/footer.html"/>
</html>
