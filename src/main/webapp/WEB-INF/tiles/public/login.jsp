<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container my-5">
    <h3 class="text-info text-center">Login Form</h3>
    <c:if test="${!empty error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>${error}</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <c:if test="${!empty logout}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>${logout}</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <c:if test="${!empty register}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>${register}</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <c:if test="${!empty ban}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>${ban}</strong>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    <div class="col-md-6 offset-md-3">
        <form action="<c:url value="/j_spring_security_check"/>" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="Enter Email">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password">
            </div>
            <span class="psw"> <a href="/register">Don't Have Account?, Please Register!</a></span>
            <input type="submit" value="Login" class="btn btn-secondary btn-sm float-right">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>
    </div>
    <div style="height:200px">
        <p hidden>Something</p>
    </div>
</div>
