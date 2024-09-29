<%-- 
    Document   : index
    Created on : Oct 10, 2023, 2:13:47 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.DAOBook,entity.Book,java.util.Vector,entity.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <%User  u = (User) session.getAttribute("userobj");%>
        <div class="container">
            <br><br>
            <h2 class="text-center" style="background-color: greenyellow">Recent Book</h2>
            <div class="row">
                <%
                    DAOBook dao1 = new DAOBook();
                    Vector<Book> vector1 = dao1.getAllRecentBook(); 
                    for(Book b: vector1) {
                %>
                <div class="col-md-3 mt-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <p><%=b.getBookName()%></p>
                            <img src="book/<%=b.getPhoto()%>" alt="" width="150px" height="200px" class="img-thumblin"/>
                            <p><b>Price: <%=b.getPrice()%>$</b></p>
                            <p>Author: <%=b.getAuthor()%></p>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <%if(b.getBookCategory().equals("Old")) {%>
                            <div class="text-center">
                                <a href="" class="btn btn-success btn-sm ml-1">View Detail</a>
                            </div>
                            <%} else {%>
                            <div class="text-center">
                                <%if(u==null){%>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                                <%}
                                else{%>
                                <a href="cart?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                                <%}%>    
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Detail</a>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <%@include file="all_component/footer.jsp"%>
    </body>
</html>
