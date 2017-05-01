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
            <jsp:include page="/WEB-INF/includes/checkout.css"/>
            <jsp:include page="/WEB-INF/includes/navBarStyleSheet.css"/>
            <jsp:include page="/WEB-INF/includes/footer.css"/>
        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/includes/navBar.html"/>

        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
        <br><br><br>
        <div class="container wrapper">
            <div class="row cart-head">
                <div class="container">
                    <div class="row">
                        <p></p>
                    </div>
                    <div class="row">
                        <div style="display: table; margin: auto;">
                            <span class="step step_complete"> <a href="/SessionTracker?name=cart" class="check-bc">Cart</a> <span class="step_line step_complete"> </span> <span class="step_line backline"> </span> </span>
                            <span class="step step_complete"> <a href="/SessionTracker?name=checkout" class="check-bc">Checkout</a> <span class="step_line "> </span> <span class="step_line step_complete"> </span> </span>
                            <span class="step_thankyou check-bc step_complete">Thank you</span>
                        </div>
                    </div>
                    <div class="row">
                        <p></p>
                    </div>
                </div>
            </div>
            <div class="row cart-body">
                <form class="form-horizontal" method="post" action="cartServlet">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-push-6 col-sm-push-6">
                        <!--REVIEW ORDER-->
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Review Order <div class="pull-right"></div>
                            </div>
                            <div class="panel-body">
                                <c:forEach var="item" items="${sessionScope.cart.items}">
                                    <div class="form-group">
                                        <div class="col-sm-3 col-xs-3">
                                            <c:choose>
                                                <c:when test="${item.product.getProductCode() == '50cal1'}">
                                                    <img src="/vicBrewing.png" style="height: 172px; width: 100px">
                                                </c:when>
                                                <c:when test="${item.product.getProductCode() == 'pintGlass1'}">
                                                    <img src="/pint.jpeg" style="height: 150px; width: 100px">
                                                </c:when>
                                                <c:when test="${item.product.getProductCode() == 'tulipGlass1'}">
                                                    <img src="/tulip.jpeg" style="height: 120px; width: 100px">
                                                </c:when>
                                                <c:when test="${item.product.getProductCode() == 'beerSampler1'}">
                                                    <img src="/beerSampler.jpeg" style="height: 100px; width: 100px">
                                                </c:when>
                                                <c:when test="${item.product.getProductCode() == 'whiteShirt1'}">
                                                    <img src="/whiteShirt.jpg" style="height: 172px; width: 120px">
                                                </c:when>
                                                <c:when test="${item.product.getProductCode() == 'blackShirt1'}">
                                                    <img src="/blackShirt.JPG" style="height: 172px; width: 120px">
                                                </c:when>
                                                <c:when test="${item.product.getProductCode() == 'brewKit1'}">
                                                    <img src="/BrewKit.png" style="height: 72px; width: 100px">
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div class="col-sm-6 col-xs-6">
                                            <div class="col-xs-12"><c:out value="${item.product.getProductDescription()}"></c:out></div>
                                            <div class="col-xs-12"><small>Quantity:<span><c:out value="${item.getQuantity()}"></c:out></span></small></div>
                                        </div>
                                        <div class="col-sm-3 col-xs-3 text-right">
                                            <h6>${item.getTotalCurrency()}</h6>
                                        </div>
                                    </div>
                                    <div class="form-group"><hr /></div>
                                </c:forEach>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <strong>Subtotal</strong>
                                        <div class="pull-right"><span></span><span><c:out value="${cart.getCartTotal()}"></c:out></span></div>
                                    </div>
                                    <div class="col-xs-12">
                                        <small>Taxes</small>
                                        <div class="pull-right"><span><c:out value="${cart.getTaxTotal()}"></c:out></span></div>
                                    </div>
                                    <div class="col-xs-12">
                                        <small>Shipping</small>
                                        <div class="pull-right"><span><c:out value="${cart.getShippingTotal()}"></c:out></span></div>
                                    </div>
                                </div>
                                <div class="form-group"><hr /></div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <strong>Order Total</strong>
                                        <div class="pull-right"><span></span><span><c:out value="${cart.getFinalTotal()}"></c:out></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--REVIEW ORDER END-->
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-md-pull-6 col-sm-pull-6">
                        <!--SHIPPING METHOD-->
                        <div class="panel panel-info">
                            <div class="panel-heading">Address</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <h4>Shipping Address</h4>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Country:</strong></div>
                                    <div class="col-md-12">
                                        <input type="text" class="form-control" name="country" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6 col-xs-12">
                                        <strong>First Name:</strong>
                                        <input type="text" name="firstName" class="form-control" value="" />
                                    </div>
                                    <div class="span1"></div>
                                    <div class="col-md-6 col-xs-12">
                                        <strong>Last Name:</strong>
                                        <input type="text" name="lastName" class="form-control" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Address:</strong></div>
                                    <div class="col-md-12">
                                        <input type="text" name="address" class="form-control" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>City:</strong></div>
                                    <div class="col-md-12">
                                        <input type="text" name="city" class="form-control" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>State:</strong></div>
                                    <div class="col-md-12">
                                        <input type="text" name="state" class="form-control" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Zip / Postal Code:</strong></div>
                                    <div class="col-md-12">
                                        <input type="text" name="zip" class="form-control" value="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Phone Number:</strong></div>
                                    <div class="col-md-12"><input type="text" name="phone" class="form-control" value="" /></div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Email Address:</strong></div>
                                    <div class="col-md-12"><input type="text" name="email" class="form-control" value="" /></div>
                                </div>
                            </div>
                        </div>
                        <!--SHIPPING METHOD END-->
                        <!--CREDIT CART PAYMENT-->
                        <div class="panel panel-info">
                            <div class="panel-heading"><span><i class="glyphicon glyphicon-lock"></i></span> Secure Payment</div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Card Type:</strong></div>
                                    <div class="col-md-12">
                                        <select id="CreditCardType" name="cardType" class="form-control">
                                            <option value="visa">Visa</option>
                                            <option value="mastercard">MasterCard</option>
                                            <option value="amex">American Express</option>
                                            <option value="discover">Discover</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Credit Card Number:</strong></div>
                                    <div class="col-md-12"><input type="text" class="form-control" name="cardNumber" value="" required/></div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12"><strong>Card CVV:</strong></div>
                                    <div class="col-md-12"><input type="text" class="form-control" name="cardCode" value="" required/></div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <strong>Expiration Date</strong>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <select class="form-control" name="expirationMonth" required>
                                            <option value="">Month</option>
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                            <option value="07">07</option>
                                            <option value="08">08</option>
                                            <option value="09">09</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <select class="form-control" name="expirationYear">
                                            <option value="">Year</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
                                            <option value="2021">2021</option>
                                            <option value="2022">2022</option>
                                            <option value="2023">2023</option>
                                            <option value="2024">2024</option>
                                            <option value="2025">2025</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <span>Pay secure using your credit card.</span>
                                    </div>
                                    <div class="col-md-12">
                                        <ul class="cards">
                                            <li class="visa hand">Visa</li>
                                            <li class="mastercard hand">MasterCard</li>
                                            <li class="amex hand">Amex</li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <button type="submit" class="btn btn-primary btn-submit-fix" name="task" value="placeOrder">Place Order</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--CREDIT CART PAYMENT END-->
                    </div>

                </form>
            </div>
            <div class="row cart-footer">

            </div>
        </div>

        <br><br><br><br>
    </body>
        <jsp:include page="/WEB-INF/includes/footer.html"/>
</html>
