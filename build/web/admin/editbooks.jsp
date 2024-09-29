<%-- 
    Document   : addbooks
    Created on : Oct 14, 2023, 4:14:34 PM
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
        <% int id = Integer.parseInt(request.getParameter("id"));
           DAOBook dao = new DAOBook();
           Book b = dao.getBookById(id);
        %>  
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h4 style="background-color: greenyellow">Edit Book</h4>
                            <form action="../edit_books" method="post">
                                <input type="hidden" name="id" value="<%=b.getBookId()%>">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <u>Book Name</u></label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           name="bname"
                                           value="<%=b.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        <u>Author Name</u></label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           name="author"
                                           value="<%=b.getAuthor()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        <u>Price</u></label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputPassword1" 
                                           name="price"
                                           value="<%=b.getPrice()%>">
                                </div>
                                <div class="form-group">
                                    <label for="inputState">
                                        <u>Book Status</u>
                                    </label>
                                    <select id="inputState" name="bstatus" 
                                            class="form-control">
                                        <option selected>Select</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">InActive</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary ">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
