
<div class="container-fluid p-5">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3><i class="fa-solid fa-book"></i> E-Book </h3>
        </div>
        <div class="col-md-6">
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        <c:if test="${not empty userobj}">
            <div class="col-md-3">
                <a href="manageuser.jsp" class="btn btn-success">${admin.name}</a>
                <a href="../logout" class="btn btn-primary text-white">Log out</a>
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
                    <a class="nav-link active" aria-current="page" href="home.jsp"><i class="fas fa-home"></i> Home </a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <a href="manageuser.jsp" class="btn btn-light my-2 my-sm-0"><i class="fa-solid fa-gear"></i> Manage User </a>                
            </form>
        </div>
    </div>
</nav>
