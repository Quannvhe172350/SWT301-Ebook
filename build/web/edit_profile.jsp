<%-- 
    Document   : register
    Created on : Oct 12, 2023, 4:00:09 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp"%>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp"%>
        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-primary">Edit Profile</h4>
                            <form action="register" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Your Name</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="fname"
                                           value="${userobj.name}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Email address</label>
                                    <input type="email" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="email"
                                           value="${userobj.email}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Phone Number</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="phno"
                                           value="${userobj.phonenumber}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        New password</label>
                                    <input type="password" class="form-control" 
                                           id="exampleInputPassword1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="password">
                                </div>
                                <button type="submit" class="btn btn-primary btn-sm btn-block">
                                    Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
