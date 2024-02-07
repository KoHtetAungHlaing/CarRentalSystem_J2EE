<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--Navigation--%>

<div class="container-fluid bg-dark">
    <nav class="container navbar navbar-expand-sm navbar-light">
        <a class="navbar-brand" href="/">
            <img src="/assets/imgs/logo.jpg" alt="" width="40px" height="40px" class="rounded">
            <span class="text-white ml-3">Car Rental System</span>
        </a>
        <button class="navbar-toggler bg-white" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link text-white" href="/">Home<span class="sr-only">(current)</span></a>
                </li>
                <sec:authorize access="hasRole('ROLE_USER')">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" href="#"
                           data-toggle="dropdown">
                            Brands
                        </a>
                        <ul class="dropdown-menu">
                            <c:forEach var="brand" items="${brands}">
                                <a class="dropdown-item" href="/showByBrand/${brand.brand_id}">${brand.brand_name}</a>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/contact_us">Contact Us <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/profile">Profile<span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link text-white" href="/change_password">Change Password<span class="sr-only">(current)</span></a>
                    </li>
                </sec:authorize>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <c:if test="${pageContext.request.userPrincipal.authenticated}">
                            <sec:authorize access="hasRole('ROLE_USER')">
                                ${login_name}
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                Admin
                            </sec:authorize>
                        </c:if>
                        <c:if test="${!pageContext.request.userPrincipal.authenticated}">
                            More
                        </c:if>
                    </a>
                    <div class="dropdown-menu">
                        <c:if test="${!pageContext.request.userPrincipal.authenticated}">
                            <a class="dropdown-item" href="/login">Login</a>
                            <a class="dropdown-item" href="/register">Register</a>
                        </c:if>
                        <c:url var="logoutUrl" value="/logout"></c:url>
                        <c:if test="${pageContext.request.userPrincipal.authenticated}">
                            <form action="${logoutUrl}" method="post">
                                <input type="submit" value="logout" class="btn btn-default ml-2">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            </form>
                        </c:if>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</div>