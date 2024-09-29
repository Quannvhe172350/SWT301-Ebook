<%-- 
    Document   : setting
    Created on : Oct 28, 2023, 8:39:14 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp"%>
        <div class="container">
            <c:if test="${not empty userobj }">
                <h3 class="text-center">Hello, ${userobj.name}</h3>
            </c:if>
            <div class="row p-5">
                <div class="col-md-4">
                    <a href="sell_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-book-open fa-3x"></i>
                                </div>
                                <h4>
                                    Pass Book For Shop
                                </h4>
                                <p>Wanna pass book for shop</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="old_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-book-open fa-3x"></i>
                                </div>
                                <h4>
                                    Old Book
                                </h4>
                                <p>Book you have passed to the shop</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="edit_profile.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-edit fa-3x"></i>
                                </div>
                                <h4>
                                    Login & Security
                                </h4>
                                <p>Edit Profile</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-3">
                    <a href="user_address.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-warning">
                                    <i class="fas fa-map-marker-alt fa-3x"></i>
                                </div>
                                <h4>
                                    Your Address
                                </h4>
                                <p>Edit Address</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-3">
                    <a href="displayorder.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-danger">
                                    <i class="fas fa-box-open fa-3x"></i>
                                </div>
                                <h4>
                                    My Order
                                </h4>
                                <p>Track Your Order</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mt-3">
                    <a href="helpline.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <div class="text-primary">
                                    <i class="fas fa-user-circle fa-3x"></i>
                                </div>
                                <h4>
                                    Help Center
                                </h4>
                                <p>24/7 Service</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
