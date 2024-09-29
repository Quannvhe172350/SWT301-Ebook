<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.DAOOrderItem,java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <%@ include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@ include file="all_component/navbar.jsp" %>
        <div class="container p-1">
            <h3 class="text-center text-primary">Order Details</h3>
            <table class="table table-striped mt-5">
                <thead class="bg-primary text-white">
                    <tr>
                        <th scope="col">Item ID</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">List Price</th>
                        <th scope="col">Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Get the order ID from the request parameter
                        int orderId = Integer.parseInt(request.getParameter("id"));
                            // Define your SQL query to fetch order items
                            String sql = "SELECT oi.itemid, b.bookName, b.author, oi.listprice, oi.quantity " +
                                         "FROM orderitem oi " +
                                         "INNER JOIN books b ON oi.bookid = b.bookId " +
                                         "WHERE oi.orderid = " + orderId;
                            DAOOrderItem dao = new DAOOrderItem();
                            // Execute the query
                            ResultSet rs = dao.getResultSet(sql);
                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("itemid") %></td>
                        <td><%= rs.getString("bookName") %></td>
                        <td><%= rs.getString("author") %></td>
                        <td><%= rs.getDouble("listprice") %></td>
                        <td><%= rs.getInt("quantity") %></td>
                    </tr>
                    <%
                            }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
