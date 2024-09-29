<%--
    Document   : infor
    Created on : Oct 31, 2023, 9:15:56 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.DAOBook,entity.Book,java.util.Vector,entity.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Information</title>
    <%@include file="all_component/allCss.jsp" %>
    <style type="text/css">
        .user-info {
            border: 3px solid black;
            margin-top: 100px;
            padding: 20px;
            text-align: center;
        }
        .user-info p {
            margin: 10px 0;
        }
        .change-password-btn {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    <% User u = (User) session.getAttribute("userobj"); %>
    <div class="user-info">
        <p>Full Name: <%= u.getName() %></p>
        <p>Email: <%= u.getEmail() %></p>
        <p>Phone: <%= u.getPhonenumber() %></p>
        <p>Address: <%= u.getAddress() %>, <%= u.getLandmark() %>, <%= u.getCity() %>, <%= u.getState() %></p>
        <a href="changepassword.jsp?id=<%= u.getId() %>" class="btn btn-primary change-password-btn">Change Password</a>
    </div>
</body>
</html>
