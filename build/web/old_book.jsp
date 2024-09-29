<%-- 
    Document   : old_book
    Created on : Oct 29, 2023, 12:09:48 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.DAOBook,entity.Book,java.util.Vector,entity.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp"%>
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
        <div class="container p-5">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%User u = (User) session.getAttribute("userobj");
                      String email = u.getEmail();
                      DAOBook dao = new DAOBook();
                      Vector<Book> vector = dao.getOldBook(email,"Old");
                      for(Book b : vector){%>
                    <tr>
                        <td><%=b.getBookName()%></td>
                        <td><%=b.getAuthor()%></td>
                        <td><%=b.getPrice()%></td>
                        <td><a href="delete_old_books?em=<%=email%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger" >Delete</a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
