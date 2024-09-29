<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
    #searchForm {
        text-align: center;
        margin: 20px auto;
        padding: 10px;
        background-color: #f4f4f4;
        border: 1px solid #ddd;
        border-radius: 5px;
        max-width: 300px;
        box-shadow: 0px 0px 5px #ddd;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 10px;
    }

    select {
        width: 100%;
        padding: 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    input[type="submit"] {
        display: block;
        width: 100%;
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>
<div class="container-fluid p-5">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3><a href="index.jsp" class="fa-solid fa-book"></a> E-Book </h3>
        </div>
        <div class="col-md-6">
            <form class="d-flex" action="search.jsp" method="get">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="query">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
            <form action="searchprice.jsp" method="get" class="text-center" id="searchForm">
                <label for="priceRange">Select Price Range:</label>
                <select name="priceRange" id="priceRange">
                    <option value="0-100">$0 - $100</option>
                    <option value="100-200">$100 - $200</option>
                    <option value="200-300">$200 - $300</option>
                    <option value="300+">$300 and above</option>
                </select>
                <input type="submit" value="Search">
            </form>
        </div>
        <c:if test="${not empty userobj}">
            <div class="col-md-3">
                <a href="cart.jsp"><i class="fa-solid fa-cart-shopping fa-2x"></i></a>
                <a href="infor.jsp?id=${userobj.id}" class="btn btn-success">${userobj.name}</a>
                <a href="logout" class="btn btn-primary text-white">Log out</a>
            </div>
        </c:if>
        <c:if test="${empty userobj}">
            <div class="col-md-3">
                <a href="login.jsp" class="btn btn-success">Login</a>
                <a href="register.jsp" class="btn btn-primary text-white">Register</a>
            </div>
        </c:if>   
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp"><i class="fas fa-home"></i> Home </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link active" href="all_recent_books.jsp"><i class="fa-solid fa-book-open"></i> Recent Book </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link active" href="all_new_books.jsp"><i class="fa-solid fa-book-open"></i> New Book </a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link active" href="all_old_books.jsp"><i class="fa-solid fa-book-open"></i> Old Book </a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <c:if test="${not empty userobj}">
                <a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i> Option </a>
                </c:if>
                <a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1"><i class="fa-solid fa-phone"></i> Contact </a>                
            </form>
        </div>
    </div>
</nav>
