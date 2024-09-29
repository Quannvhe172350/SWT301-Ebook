<%-- 
    Document   : index
    Created on : Oct 10, 2023, 2:13:47 PM
    Author     : acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.DAOBook,entity.Book,java.util.Vector,entity.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="all_component/allCss.jsp" %>
        <title>JSP Page</title>
        <style type="text/css">
            #toast {
                min-width: 300px;
                position: fixed;
                bottom: 30px;
                left: 50%;
                margin-left: -125px;
                background: #333;
                padding: 10px;
                color: white;
                text-align: center;
                z-index: 1;
                font-size: 18px;
                visibility: hidden;
                box-shadow: 0px 0px 100px #000;
            }

            #toast.display {
                visibility: visible;
                animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
            }

            @keyframes fadeIn {
                from {
                    bottom:0;
                    opacity: 0;
                }

                to {
                    bottom: 30px;
                    opacity: 1;
                }

            }
            @keyframes fadeOut {
                form {
                    bottom:30px;
                    opacity: 1;
                }

                to {
                    bottom: 0;
                    opacity: 0;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <%User  u = (User) session.getAttribute("userobj");%>
        <c:if test="${not empty addCart}">
            <div id="toast">${addCart}</div>

            <script type="text/javascript">
                showToast();
                function showToast(content)
                {
                    $('#toast').addClass("display");
                    $('#toast').html(content);
                    setTimeout(() => {
                        $("#toast").removeClass("display");
                    }, 2000);
                }
            </script>
            <c:remove var="addCart" scope="session"/>
        </c:if>
        <div class="container">
            <br><br>
            <h2 class="text-center" style="background-color: greenyellow">New Book</h2>
            <div class="row">
                <%
                    DAOBook dao = new DAOBook();
                    Vector<Book> vector = dao.getAllNewBook(); 
                    for(Book b: vector) {
                %>
                <div class="col-md-3 mt-3">
                    <div class="card">
                        <div class="card-body text-center ">
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
        </div>
        <%@include file="all_component/footer.jsp"%>
    </body>
</html>
