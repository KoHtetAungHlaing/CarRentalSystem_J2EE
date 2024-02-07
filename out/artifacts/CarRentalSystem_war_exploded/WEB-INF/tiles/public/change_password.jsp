<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="container my-3">
    <h3 class="text-info text-center">Change Password</h3>
    <div class="col-md-6 offset-md-3">
        <form:form method="post" modelAttribute="user" action="/change_password" id="myForm">
            <div class="form-group">
                <label for="confirm_password">New Password</label>
                <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Enter Password"/>
            </div>
            <div class="form-group">
                <label for="password">Confirm Password</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Enter Confirm Password"/>
                <span id="span_password" style="color: #ff0000;" hidden>Password do not match! Try Again!!</span>
            </div>
            <button type="button" class="btn btn-secondary btn-sm float-right" onclick="changePassword()">Change Password</button>
            <form:input type="hidden" path="enabled" value="${user.enabled}" name="${user.enabled}" id="${user.enabled}"/>
            <form:input type="hidden" path="user_id" id="user_id" value="${user.user_id}"/>
            <form:input type="hidden" path="renting" id="renting" value="${user.renting}"/>
            <form:input type="hidden" path="username" id="username" value="${user.username}"/>
            <form:input type="hidden" path="nrc" id="nrc" value="${user.nrc}"/>
            <form:input type="hidden" path="email" id="email" value="${user.email}"/>
            <form:input type="hidden" path="phone" id="phone" value="${user.phone}"/>
            <form:input type="hidden" path="address" id="address" value="${user.address}"/>
        </form:form>
    </div>
    <div style="height:250px">
        <p hidden>Something</p>
    </div>
</div>
<script>
    function changePassword() {
        var isError = false;
        document.getElementById("span_password").hidden=true
        var confirm_password = document.getElementById("confirm_password").value
        var password = document.getElementById("password").value
        var myForm = document.getElementById("myForm")
        if (confirm_password === null || confirm_password === undefined || confirm_password==''){
            alert("New Password can't be empty")
            isError = true
        }
        if (password === null || password === undefined || password==''){
            alert("Confirm Password can't be empty")
            isError = true
        }
        if (confirm_password != password){
            document.getElementById("span_password").hidden=false
            isError = true
        }
        if (!isError){
            myForm.submit();
        }
    }
</script>
