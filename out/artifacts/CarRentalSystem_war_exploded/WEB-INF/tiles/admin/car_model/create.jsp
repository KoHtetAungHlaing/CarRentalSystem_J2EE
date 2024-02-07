<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--Car Model Create Form--%>

<div class="container-fluid">
    <div class="row g-0">
        <nav class="col-2 bg-light pe-3 border-right py-3">
            <div class="list-group text-start text-lg-start flex-fill">
                    <span class="list-group-item disabled d-none d-lg-block">
                        <h5>Dashboard</h5>
                    </span>
                <a href="/admin/brand/all" class="list-group-item list-group-item-action">
                    <i class="fas fa-car-alt"></i>
                    <span class="d-none d-lg-inline">Car Brand</span>
                </a>
                <a href="/admin/car_model/all" class="list-group-item list-group-item-action">
                    <i class="fas fa-car-alt"></i>
                    <span class="d-none d-lg-inline">Car Model</span>
                </a>
                <a href="/admin/driver/all" class="list-group-item list-group-item-action">
                    <i class="fas fa-car-alt"></i>
                    <span class="d-none d-lg-inline">Driver</span>
                </a>
                <a href="/admin/user/all" class="list-group-item list-group-item-action">
                    <i class="fas fa-car-alt"></i>
                    <span class="d-none d-lg-inline">User</span>
                </a>
                <a href="/admin/rent_car/rent_list" class="list-group-item list-group-item-action">
                    <i class="fas fa-car-alt"></i>
                    <span class="d-none d-lg-inline">Rent Car List</span>
                </a>
                <a href="/admin/received_car/received_list" class="list-group-item list-group-item-action">
                    <i class="fas fa-car-alt"></i>
                    <span class="d-none d-lg-inline">Received Car List</span>
                </a>
                <a href="/admin/history/history_list" class="list-group-item list-group-item-action">
                    <i class="fas fa-car-alt"></i>
                    <span class="d-none d-lg-inline">History</span>
                </a>
            </div>
        </nav>
        <main class="col-10"> <!-- Main (Top Nav & Content) -->
            <div class="container-fluid mt-3 p-4"> <!-- Content -->
                <h3 class="text-info text-center mb-5">Create Car Model</h3>
                <div class="col-md-6 offset-md-3">
                <form:form method="post" modelAttribute="car_model" action="/admin/car_model/create" enctype="multipart/form-data" id="myForm">
                    <div class="form-group">
                        <label for="brand_id">Car Brand</label>
                        <form:select class="form-control" id="brand_id" name="brand_id" path="brand_id">
                            <c:forEach var="brand" items="${brands}">
                                <option value="${brand.brand_id}">${brand.brand_name}</option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="reg_no">Registration No</label>
                        <form:input type="text" class="form-control" id="reg_no" path="reg_no" name="reg_no" placeholder="Enter Registration Number"/>
                        <span id="span_reg_no" style="color: #ff0000;" hidden>Reg No: must be fill!</span>
                    </div>
                    <div class="form-group">
                        <label for="model">Car Model</label>
                        <form:input type="text" class="form-control" id="model" path="model" name="model" placeholder="Enter Car Model" />
                        <span id="span_car_model" style="color: #ff0000;" hidden>Car Model must be fill!</span>
                    </div>
                    <div class="form-group">
                        <label for="file">Car Model Image</label>
                        <form:input type="file" class="form-control-file" id="file" path="file" name="file"/>
                        <span id="span_image" style="color: #ff0000;" hidden>Image must be fill!</span>
                    </div>
                    <div class="form-group">
                        <label for="seat">No.of Seat</label>
                        <form:input type="number" class="form-control" id="seat" path="seat" name="seat" placeholder="Enter Seat"/>
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label>
                        <form:input type="number" class="form-control" id="price" path="price" name="price" placeholder="Enter Price"/>
                    </div>
                    <button type="button" class="btn btn-secondary btn-sm float-right" onclick="checkValid()">Create</button>
                    <form:input type="hidden" class="form-control" path="available"  name="available" id="available"/>
                </form:form>
                </div>
            </div> <!-- Content -->
        </main> <!-- Main (Nav & Content) -->
    </div>
</div>
<script>
    function checkValid() {
        var isError = false;
        document.getElementById("span_reg_no").hidden=true
        document.getElementById("span_car_model").hidden=true
        document.getElementById("span_image").hidden=true
        var reg_no = document.getElementById("reg_no").value
        var model = document.getElementById("model").value
        var file = document.getElementById("file").value
        var myForm = document.getElementById("myForm")
        if (reg_no === null || reg_no === undefined || reg_no==''){
            document.getElementById("span_reg_no").hidden=false
            isError = true
        }
        if (model === null || model === undefined || model==''){
            document.getElementById("span_car_model").hidden=false
            isError = true
        }
        if (file === null || file === undefined || file==''){
            document.getElementById("span_image").hidden=false
            isError = true
        }
        if (!isError){
            myForm.submit();
        }
    }
</script>
