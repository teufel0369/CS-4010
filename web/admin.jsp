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
            <jsp:include page="/WEB-INF/includes/admin.css"/>
            <jsp:include page="/WEB-INF/includes/adminNavBarStyleSheet.css"/>
            <jsp:include page="/WEB-INF/includes/footer.css"/>
        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/includes/adminNavBar.html"/>

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">

        <c:forEach var="item" items="${sessionScope.list}">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="invoice-title">
                            <h2>Invoice</h2><h3 class="pull-right">${item.getSessionID()}</h3>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-xs-6">
                                <address>
                                    <strong>Billed To:</strong><br>
                                    ${item.getFirstName()} ${item.getLastName()}<br>
                                    ${item.getAddress()}<br>
                                    ${item.getCity()}, ${item.getState()} ${item.getZip()}
                                </address>
                            </div>
                            <div class="col-xs-6 text-right">
                                <address>
                                    <strong>Shipped To:</strong><br>
                                        ${item.getFirstName()} ${item.getLastName()}<br>
                                        ${item.getAddress()}<br>
                                        ${item.getCity()}, ${item.getState()} ${item.getZip()}
                                </address>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6">
                                <address>
                                    <strong>Payment Method:</strong><br>
                                    ${item.getCardType()} ${item.getCardNumber()}<br>
                                    Exp: ${item.getExpirationMonth()} / ${item.getExpirationYear()}<br>
                                    CVV: ${item.getCode()}<br>
                                    ${item.getEmail()}
                                </address>
                            </div>
                            <div class="col-xs-6 text-right">
                                <address>
                                    <strong>Order Date:</strong><br>
                                    March 7, 2014<br><br>
                                </address>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><strong>Order summary</strong></h3>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-condensed">
                                        <thead>
                                        <tr>
                                            <td><strong>Item</strong></td>
                                            <td class="text-center"><strong>Price</strong></td>
                                            <td class="text-center"><strong>Quantity</strong></td>
                                            <td class="text-right"><strong>Totals</strong></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <!-- foreach ($order->lineItems as $line) or some such thing here -->
                                        <c:forEach var="subItem" items="${item.getItemList()}">
                                            <tr>
                                                <td>${subItem.getProduct().getProductCode()}</td>
                                                <td class="text-center">${subItem.getProduct().getPriceCurrencyFormat()}</td>
                                                <td class="text-center">${subItem.getQuantity()}</td>
                                                <td class="text-right">${subItem.getTotalCurrency()}</td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td class="no-line"></td>
                                            <td class="no-line"></td>
                                            <td class="no-line text-center"><strong>Total</strong></td>
                                            <td class="no-line text-right">${item.getTotal()}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <br><br><br><br><br><br><br><br><br><br><br>
    </body>
        <jsp:include page="/WEB-INF/includes/footer.html"/>
</html>
