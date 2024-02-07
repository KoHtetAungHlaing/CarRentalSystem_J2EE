<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="container my-3">
    <h3 class="text-info text-center">Update Profile</h3>
    <div class="col-md-6 offset-md-3">
        <form:form method="post" modelAttribute="user" action="/profile">
            <div class="form-group">
                <label for="username">Name</label>
                <form:input type="text" class="form-control" id="username" name="username" path="username" value="${user.username}"/>
            </div>
            <div class="form-group">
                <label for="nrc">Nrc</label>
                <form:input type="text" class="form-control" id="nrc" name="nrc" path="nrc" value="${user.nrc}" readonly="true"/>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <form:input type="email" class="form-control" id="email" name="email" path="email" value="${user.email}" readonly="true"/>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <form:input type="text" class="form-control" id="phone" name="phone" path="phone"
                            value="${user.phone}"/>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <form:input type="text" class="form-control" id="address" name="address" path="address"
                            value="${user.address}"/>
            </div>
            <form:input type="hidden" path="user_id" id="user_id" value="${user.user_id}"/>
            <button type="submit" class="btn btn-secondary btn-sm float-right">Update</button>
            <form:input type="hidden" path="enabled" value="${user.enabled}" name="${user.enabled}"
                        id="${user.enabled}"/>
            <form:input type="hidden" path="renting" id="renting" value="${user.renting}"/>
            <form:input type="hidden" path="password" id="password" value="${user.password}"/>
        </form:form>
    </div>
    <div style="height:10px">
        <p hidden>Something</p>
    </div>
</div>
