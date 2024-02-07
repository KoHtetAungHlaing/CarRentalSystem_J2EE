<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--Update Car Model Form--%>

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
                <h3 class="text-info text-center mb-5">Edit Car Model</h3>
                <div class="col-md-6 offset-md-3">
                <form:form method="post" modelAttribute="carModel" action="/admin/car_model/edit" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="brand_id">Car Brand</label>
                        <form:select class="form-control" id="brand_id" name="brand_id" path="brand_id">
                            <form:options items="${brands}" itemLabel= "brand_name" itemValue="brand_id" readonly="true"></form:options>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="reg_no">Registration No</label>
                        <form:input type="text" value="${carModel.reg_no}" class="form-control" id="reg_no" path="reg_no" name="reg_no" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="model">Car Model</label>
                        <form:input type="text" value="${carModel.model}" class="form-control" id="model" path="model" name="model" readonly="true"/>
                    </div>
                    <div class="form-group">
                        <label for="file">Car Model Image</label>
                        <form:input type="file" class="form-control-file" id="file" path="file" name="file"/>
                    </div>
                    <div class="form-group">
                        <label for="seat">No.of Seat</label>
                        <form:input type="number" value="${carModel.seat}" class="form-control" id="seat" path="seat" name="seat"/>
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label>
                        <form:input type="number" value="${carModel.price}" class="form-control" id="price" path="price" name="price"/>
                    </div>
                    <button type="submit" class="btn btn-secondary btn-sm float-right">Edit</button>
                    <form:input type="hidden" path="model_id"  value="${carModel.model_id}" name="${carModel.model_id}"/>
                    <form:input type="hidden" path="image"  value="${carModel.image}" name="${carModel.image}"/>
                    <form:input type="hidden" path="available"  value="${carModel.available}" name="${carModel.available}"/>
                </form:form>
                </div>
            </div> <!-- Content -->
        </main> <!-- Main (Nav & Content) -->
    </div>
</div>
