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
        <%@include file="allCss.jsp"%>
        <%@page import="model.DAOUser,entity.User" %>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <%int id = Integer.parseInt(request.getParameter("id"));
                    DAOUser dao = new DAOUser();
                    User u = dao.getUserById(id);%>
                    <div class="card">
                        <div class="card-body">
                            <form action="../edituser" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" value="<%=u.getId()%>"> 
                                    <label for="exampleInputEmail1">
                                        Enter Full Name</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           name="fname"
                                           value="<%=u.getName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Email address</label>
                                    <input type="email" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           name="email"
                                           value="<%=u.getEmail()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Phone Number</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           name="phno"
                                           value="<%=u.getPhonenumber()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        Enter Password</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputPassword1" 
                                           aria-describedby="emailHelp"
                                           name="password"
                                           value="<%=u.getPassword()%>">
                                </div>
                                <div class="form-group ">
                                    <label for="inputPassword4">Address</label>
                                    <input type="text" id="inputPassword4" class="form-control" name="address" value="<%=u.getAddress()%>">
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword4">Landmark</label>
                                    <input type="text" id="inputPassword4" class="form-control" name="landmark" value="<%=u.getLandmark()%>">
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword4">City</label>
                                    <input type="text" id="inputPassword4" class="form-control" name="city" value="<%=u.getCity()%>">
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword4">State</label>
                                    <input type="text" id="inputPassword4" class="form-control" name="state" value="<%=u.getState()%>">
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword4">Pin Code</label>
                                    <input type="text" id="inputPassword4" class="form-control" name="pincode" value="<%=u.getPincode()%>">
                                </div>
                                <input type="submit" class="btn btn-primary" name="Submit" value="Change">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
