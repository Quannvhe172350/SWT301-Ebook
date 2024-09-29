<%-- 
    Document   : login
    Created on : Oct 12, 2023, 4:27:45 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp"%>
        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="text-center">Login</h5>
                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg}</p>
                                <c:remove var="successMsg" scope="session"/>
                            </c:if>
                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                            <form action="login" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Email address</label>
                                    <input type="email" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        Enter Password</label>
                                    <input type="password" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           required="required"
                                           name="password">
                                </div>
                                <div class="text-center my-2">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                    <br>
                                    <a href="register.jsp">Create Account</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
