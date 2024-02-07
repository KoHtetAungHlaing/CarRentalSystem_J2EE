<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="container my-3">
    <h3 class="text-info text-center">Register Form</h3>
    <div class="col-md-6 offset-md-3">
        <form:form action="/register" method="post" modelAttribute="user">
            <div class="form-group">
                <label for="username">Username</label>
                <form:input type="text" path="username" name="username" id="username" class="form-control" placeholder="Enter Username"/>
                <form:errors path="username" cssClass="text-danger"></form:errors>
            </div>
            <div class="form-group">
                <label for="nrc">Nrc</label>
                <form:input type="text" path="nrc" name="nrc" id="nrc" class="form-control" placeholder="Enter Nrc"/>
                <form:errors path="nrc" cssClass="text-danger"></form:errors>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <form:input type="email" path="email" name="email" id="email" class="form-control" placeholder="Enter Email"/>
                <form:errors path="email" cssClass="text-danger"></form:errors>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <form:input type="password" path="password" name="password" id="password" class="form-control" placeholder="Enter Password"/>
                <form:errors path="password" cssClass="text-danger"></form:errors>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <form:input type="text"  path="address" name="address" id="address" class="form-control" placeholder="Enter Address"/>
                <form:errors path="address" cssClass="text-danger"></form:errors>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <form:input type="tel" path="phone" name="phone" id="phone" class="form-control" placeholder="Enter Phone"/>
                <form:errors path="phone" cssClass="text-danger"></form:errors>
            </div>
            <input type="submit" value="Register" class="btn btn-secondary btn-sm float-right">
            <span class="psw"> <a href="/login">Already Register?, Please Login!</a></span>
        </form:form>
    </div>
</div>