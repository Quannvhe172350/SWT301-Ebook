<%-- 
    Document   : manageuser
    Created on : Oct 31, 2023, 10:22:16 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.DAOUser,entity.User,java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <%  DAOUser dao = new DAOUser();
            Vector<User> userList = dao.getAllUsers("select * from users");%>
    <c:if test="${not empty successMsg}">
        <p class="text-center text-success">${successMsg}</p>
        <c:remove var="successMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty failedMsg }">
        <p class="text-center text-danger">${failedMsg}</p>
        <c:remove var="failedMsg" scope="session"/>
    </c:if>
    <table class="table table-striped">
        <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Password</th>
                <th scope="col">Phone</th>
                <th scope="col">Address</th>
                <th scope="col">Landmark</th>
                <th scope="col">City</th>
                <th scope="col">State</th>
                <th scope="col">Zip Code</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <% for(User u: userList) {%>
            <tr>
                <th scope="row"><%=u.getId()%></th>
                <td><%=u.getName()%></td>
                <td><%=u.getEmail()%></td>
                <td><%=u.getPassword()%></td>
                <td><%=u.getPhonenumber()%></td>
                <td><%=u.getAddress()%></td>
                <td><%=u.getLandmark()%></td>
                <td><%=u.getCity()%></td>
                <td><%=u.getState()%></td>
                <td><%=u.getPincode()%></td>
                <td >
                    <a href="edituser.jsp?id=<%=u.getId()%>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="../deleteuser?id=<%=u.getId()%>" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr
            <%}%>
        </tbody>
    </table>
</body>
</html>

