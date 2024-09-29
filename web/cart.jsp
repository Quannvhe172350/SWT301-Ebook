<%-- 
    Document   : cart
    Created on : Oct 28, 2023, 9:30:14 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
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
                    }, 2000)
                }
            </script>
            <c:remove var="addCart" scope="session"/>
        </c:if>
        <br><div class="container">
            <div class="row">
                <form action="quantity" method="post">
                    <div class="col-md-6">
                        <h3 class="text-center text-success">
                            Your Selected Item
                        </h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope}" var="entry">
                                    <c:if test="${entry.key ne 'userobj' and entry.key ne 'admin'}">
                                        <tr>
                                            <td>${entry.value.bookName}</td>
                                            <td>${entry.value.author}</td>
                                            <td>${entry.value.list_price}</td>
                                            <td> 
                                                <input style="width: 60px" type="number" name="quantity" value="${entry.value.quantity}">
                                            </td>
                                            <td><a href="remove?bid=${entry.key}" class="btn btn-sm btn-danger">Remove</a></td>
                                        </tr>
                                        <c:set var="subtotal" value="${entry.value.list_price * entry.value.quantity}" />
                                        <c:set var="totalPrice" value="${totalPrice + subtotal}" />
                                    </c:if>
                                </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${totalPrice > 0}">
                            <h3>Total Price: $<c:out value="${totalPrice}" /></h3>
                        </c:if>
                        <input type="submit" value="Update" class="btn btn-sm btn-danger">
                        <a href="clearcart" class="btn btn-sm btn-danger">Clear</a>
                    </div>
                </form>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center text-success">
                                Your Detail For Orders
                            </h3>
                            <form action="order" method="post">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">
                                            Name</label>
                                        <input type="text" class="form-control" 
                                               id="exampleInputEmail1" 
                                               name="fname"
                                               value="${userobj.name}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">
                                            Email</label>
                                        <input type="email" class="form-control" 
                                               id="exampleInputEmail1" 
                                               name="email"
                                               value="${userobj.email}">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">
                                            Phone Number</label>
                                        <input type="text" class="form-control" 
                                               id="exampleInputEmail1" 
                                               aria-describedby="emailHelp"
                                               name="phone"
                                               value="${userobj.phonenumber}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">
                                            Address</label>
                                        <input type="text" class="form-control" 
                                               id="exampleInputEmail1" 
                                               aria-describedby="emailHelp"
                                               name="address"
                                               value="${userobj.address}">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">
                                            Land Mark</label>
                                        <input type="text" class="form-control" 
                                               id="exampleInputEmail1" 
                                               name="landmark"
                                               value="${userobj.landmark}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">
                                            City</label>
                                        <input type="text" class="form-control" 
                                               id="exampleInputEmail1" 
                                               name="city"
                                               value="${userobj.city}">
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">
                                            State</label>
                                        <input type="text" class="form-control" 
                                               id="exampleInputEmail1" 
                                               name="state"
                                               value="${userobj.state}">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">
                                            Zip Code</label>
                                        <input type="text" class="form-control" 
                                               id="exampleInputEmail1" 
                                               name="pincode"
                                               value="${userobj.pincode}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Payment Method</label>
                                    <select class="form-control" name="payment">
                                        <option value="noselect">--Select--</option>
                                        <option value="Cod">Cash On Delivery</option>
                                        <option value="Visa">Pay Visa</option>
                                    </select>
                                </div>
                                <div class="text-center">
                                    <button class="btn btn-warning">Order Now</button>
                                    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br>
        <%@include file="all_component/footer.jsp"%>
    </body>
</html>
