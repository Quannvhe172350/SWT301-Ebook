<%-- 
    Document   : user_address.jsp
    Created on : Oct 28, 2023, 9:14:53 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp"%>       
        <div class="container">
            <div class="row p-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">Add Address</h3>
                            <c:if test="${not empty successMsg}">
                                <p class="text-center text-success">${successMsg}</p>
                                <c:remove var="successMsg" scope="session"/>
                            </c:if>
                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                            <form action="address" method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Address</label>
                                        <input type="text" id="inputPassword4" class="form-control" name="address" value="${userobj.address}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="inputPassword4">Landmark</label>
                                        <input type="text" id="inputPassword4" class="form-control" name="landmark" value="${userobj.landmark}">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputPassword4">City</label>
                                        <input type="text" id="inputPassword4" class="form-control" name="city" value="${userobj.city}">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputPassword4">State</label>
                                        <input type="text" id="inputPassword4" class="form-control" name="state" value="${userobj.state}">
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label for="inputPassword4">Pin Code</label>
                                        <input type="text" id="inputPassword4" class="form-control" name="pincode" value="${userobj.pincode}">
                                    </div>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-warning text-white">Change Address</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
