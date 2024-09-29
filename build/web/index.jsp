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
        <style type="text/css">
            .background-img
            {
                background-image: url("book/nen.png");
                height: 55vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }

        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <%User  u = (User) session.getAttribute("userobj");%>
        <%@include file="all_component/navbar.jsp" %>
        <% if (u != null) { %>
            <h2 class="text-center text-danger"><i> Welcome, <b>${userobj.name}</b></i></h2>
           <% } %>
        <br><br>
        <div class="container">
            <h2 class="text-center" style="background-color: greenyellow">Recent Book</h2>
            <div class="row">
                <%
                    DAOBook dao1 = new DAOBook();
                    Vector<Book> vector1 = dao1.getRecentBook(); 
                    for(Book b: vector1) {
                %>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <p><%=b.getBookName()%></p>
                            <img src="book/<%=b.getPhoto()%>" alt="" width="150px" height="200px" class="img-thumblin"/>
                            <p><b>Price: <%=b.getPrice()%>$</b></p>
                            <p>Author: <%=b.getAuthor()%></p>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <%if(b.getBookCategory().equals("Old")) {%>
                            <div class="text-center">
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Detail</a>
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
            <div class="text-center mt-3">
                <a href="all_recent_books.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div><br><br>
        </div>
        <div class="container">
            <h2 class="text-center" style="background-color: greenyellow">New Book</h2>
            <div class="row">
                <%
                    DAOBook dao = new DAOBook();
                    Vector<Book> vector = dao.getNewBook(); 
                    for(Book b: vector) {
                %>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <p><%=b.getBookName()%></p>
                            <img src="book/<%=b.getPhoto()%>" alt="" width="150px" height="200px" class="img-thumblin"/>
                            <p><b>Price: <%=b.getPrice()%>$</b></p>
                            <p>Author: <%=b.getAuthor()%></p>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <div class="text-center">
                                <%if(u==null){%>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                                <%}
                                else{%>
                                <a href="cart?bid=<%=b.getBookId()%>" class="btn btn-danger btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                                <%}%>    
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Detail</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
            <div class="text-center mt-3">
                <a href="all_new_books.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div><br><br>
        </div>
        <div class="container">
            <h2 class="text-center" style="background-color: greenyellow">Old Book</h2>
            <div class="row">
                <%
                    DAOBook dao2 = new DAOBook();
                    Vector<Book> vector2 = dao2.getOldBook(); 
                    for(Book b: vector2) {
                %>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-body text-center">
                            <p><%=b.getBookName()%></p>
                            <img src="book/<%=b.getPhoto()%>" alt="" width="150px" height="200px" class="img-thumblin"/>
                            <p><b>Price: <%=b.getPrice()%>$</b></p>
                            <p>Author: <%=b.getAuthor()%></p>
                            <p>Categories:<%=b.getBookCategory()%></p>
                            <div class="text-center">
                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Detail</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
            <div class="text-center mt-3">
                <a href="all_old_books.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div><br><br>
        </div>
        <%@include file="all_component/footer.jsp"%>
    </body>
</html>
