<%-- 
    Document   : home
    Created on : Oct 14, 2023, 11:39:38 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp"%>
    </head>
    <style>
        a
        {
            text-decoration: none;
            color: black;
        }
        a:hover
        {
            text-decoration: none;
            color: black;
        }
    </style>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="addbooks.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-plus-square fa-3x text-primary"></i><br>
                                <h4>Add Books</h4>
                                ----------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="allbooks.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-book-open fa-3x text-danger"></i><br>
                                <h4>All Books</h4>
                                ----------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="order.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-box-open fa-3x text-success"></i><br>
                                <h4>Orders</h4>
                                ----------
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-3">
                    <a href="../logout">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-sign-out-alt fa-3x text-warning"></i><br>
                            <h4>Log out</h4>
                            ----------
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
