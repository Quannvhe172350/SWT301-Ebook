<%-- 
    Document   : index
    Created on : Oct 10, 2023, 2:13:47 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.DAOBook,entity.Book,entity.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <% int bid = Integer.parseInt(request.getParameter("bid"));
        DAOBook dao = new DAOBook();
        Book b = dao.getBookById(bid);
        User  u = (User) session.getAttribute("userobj");
        %>
        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border bg-white">
                    <img src="book/<%=b.getPhoto()%>" alt="" width="150px" height="200px" class="img-thumblin"/><br>
                    <h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookName()%></span></h4>
                    <h4 class="mt-3">Price:  <span class="text-success"><%=b.getPrice()%>$</span></h4>
                    <h4 class="mt-3">Category: <span class="text-success"><%=b.getBookCategory()%></span></h4>
                    <h4 class="mt-3">Author Name: <span class="text-success"><%=b.getAuthor()%></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border bg-white">
                    <h2><%=b.getBookName()%></h2>
                    <br><br>
                    <%
                        if("Old".equals(b.getBookCategory())) {
                    %>
                    <h5><a href="helpline.jsp" class="text-primary">Contact to Seller</h5></a>
                    <div class="col-md-12 text-danger text-center p-2">
                        <a href="index.jsp">
                            <i class="fas fa-undo-alt fa-3x"></i>
                            <p>Return Available</p>
                    </div>
                    <% } else { if(u==null){ %>
                    <div class="row">
                        <div class="col-md-4 text-danger text-center p-2">
                            <a href="login.jsp">
                                <i class="fas fa-money-bill-wave fa-3x"></i>
                                <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <a href="index.jsp">
                                <i class="fas fa-undo-alt fa-3x"></i>
                                <p>Return</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <a href="login.jsp">
                                <i class="fas fa-truck-moving fa-3x"></i>
                                <p>Free Shipping</p>
                        </div>
                    </div>
                    <% } else { %>
                    <div class="row">
                        <div class="col-md-4 text-danger text-center p-2">
                            <a href="cart?bid=<%=b.getBookId()%>">
                                <i class="fas fa-money-bill-wave fa-3x"></i>
                                <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <a href="index.jsp">
                                <i class="fas fa-undo-alt fa-3x"></i>
                                <p>Return</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <a href="cart?bid=<%=b.getBookId()%>">
                                <i class="fas fa-truck-moving fa-3x"></i>
                                <p>Free Shipping</p>
                        </div>
                    </div>
                    <% } } %>
                    <div class="text-center p-3">
                        <%
                            if("Old".equals(b.getBookCategory())) {
                        %>
                        <a href="index.jsp" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Continue to Shopping</a>
                        <% } else { if(u==null){%>
                        <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                        <% } else {%>
                        <a href="cart?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                        <% } } %>                            
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
