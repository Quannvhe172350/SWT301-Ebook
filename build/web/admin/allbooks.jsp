<%-- 
    Document   : allbooks
    Created on : Oct 17, 2023, 12:17:45 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.DAOBook,entity.Book,java.util.Vector" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="allCss.jsp"%>
    </head>
    <body>
        <%@include file="navbar.jsp"%>
        <%  DAOBook dao = new DAOBook();
            Vector<Book> bookList = dao.getAllBooks("select * from books");%>
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
                <th scope="col">Image</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Categories</th>
                <th scope="col">Status</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <% for(Book b: bookList) {%>
            <tr>
                <th scope="row"><%=b.getBookId()%></th>
                <td><img src="../book/<%=b.getPhoto()%>" style="width: 50px;height: 50px"></td>
                <td><%=b.getBookName()%></td>
                <td><%=b.getAuthor()%></td>
                <td><%=b.getPrice()%></td>
                <td><%=b.getBookCategory()%></td>
                <td><%=b.getStatus()%></td>
                <td >
                    <a href="editbooks.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary">Edit</a>
                    <a href="../delete_books?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Delete</a>
                </td>
            </tr
            <%}%>
        </tbody>
    </table>
</body>
</html>
