<%-- 
    Document   : addbooks
    Created on : Oct 14, 2023, 4:14:34 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp"%>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h4>Sell Old Book</h4>
                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg}</p>
                                <c:remove var="successMsg" scope="session"/>
                            </c:if>
                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                            <form action="add_old_books"  method="post"
                                  enctype="multipart/form-data">
                                <input type="text" value="${userobj.email}" 
                                       name="email">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Book Name</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           name="bname">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">
                                        Author Name</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputEmail1" 
                                           aria-describedby="emailHelp"
                                           name="author">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">
                                        Price</label>
                                    <input type="text" class="form-control" 
                                           id="exampleInputPassword1" 
                                           name="price">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">
                                        Upload Photo
                                    </label>
                                    <input name="bimg" type="file" 
                                           class="form-control-file"
                                           id="exampleFormControlFile1">
                                </div>
                                <button type="submit" class="btn btn-primary ">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
