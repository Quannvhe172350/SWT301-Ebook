<%-- 
    Document   : displayorder
    Created on : Oct 30, 2023, 12:35:43 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.DAOOrder,java.util.Vector,entity.User,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp"%>
        <c:if test="${not empty successMsg}">
            <p class="text-center text-success">${successMsg}</p>
            <c:remove var="successMsg" scope="session"/>
        </c:if>
        <c:if test="${not empty failedMsg }">
            <p class="text-center text-danger">${failedMsg}</p>
            <c:remove var="failedMsg" scope="session"/>
        </c:if>
        <%
            User u = (User) session.getAttribute("userobj");
            DAOOrder dao = new DAOOrder();
            // Perform the database query
            String sql = "SELECT o.orderid, u.name, u.email, o.orderdate, o.fulladdress, o.paymentmethod,o.orderstatus " +
                         "FROM orders o " +
                         "INNER JOIN users u ON o.userid = u.id WHERE o.userid ="+u.getId();
         
            ResultSet rs = dao.getResultSet(sql);
        %>
        <p class="text-center text-success">${param.message}</p>
        <div class="container p-1">
            <h3 class="text-center text-primary ">
                Your Order
            </h3>
            <table class="table table-striped mt-5">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Order ID</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Order Date</th>
                        <th scope="col">Address</th>
                        <th scope="col">Payment Method</th>
                        <th scope="col">Status</th>
                        <th scope="col">Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                       while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("orderid") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getDate("orderdate") %></td>
                        <td><%= rs.getString("fulladdress") %></td>
                        <%if(rs.getInt("orderstatus")==1) {%>
                        <td class="text-warning text-center">Wait</td>
                        <%}%>
                        <%if(rs.getInt("orderstatus")==2) {%>
                        <td class="text-primary text-center">Process</td>
                        <%}%>
                        <%if(rs.getInt("orderstatus")==3) {%>
                        <td class="text-success text-center">Done</td>
                        <%}%>
                        <%if(rs.getInt("orderstatus")==4) {%>
                        <td class="text-danger text-center">Cancel</td>
                        <%}%>
                        <td><%= rs.getString("paymentmethod") %></td>
                        <td class="row">
                            <a class="col-md-6 btn btn-sm btn-primary" href="orderdetail.jsp?id=<%= rs.getInt("orderid") %>" class="btn btn-sm btn-primary">Detail</a>
                            <a class="col-md-6 btn btn-sm btn-danger" href="status?id=<%= rs.getInt("orderid")%>&&status=4 " class="btn btn-sm btn-primary">Cancel</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
