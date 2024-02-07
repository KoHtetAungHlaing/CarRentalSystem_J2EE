<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--Create Driver Form--%>

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
                <h3 class="text-info text-center mb-5">Create Driver</h3>
                <div class="col-md-6 offset-md-3">
                    <form:form method="post" modelAttribute="driver" action="/admin/driver/create">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <form:input type="text" class="form-control" id="name" brand_name="name" path="name" placeholder="Enter Name"/>
                            <form:errors path="name" cssClass="text-danger"></form:errors>
                        </div>
                        <div class="form-group">
                            <label for="nrc">Nrc</label>
                            <form:input type="text" class="form-control" id="nrc" brand_name="nrc" path="nrc" placeholder="Enter Nrc"/>
                            <form:errors path="nrc" cssClass="text-danger"></form:errors>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <form:input type="text" class="form-control" id="phone" brand_name="phone" path="phone" placeholder="Enter Phone"/>
                            <form:errors path="phone" cssClass="text-danger"></form:errors>
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <form:input type="text" class="form-control" id="c" brand_name="address" path="address" placeholder="Enter Address"/>
                            <form:errors path="address" cssClass="text-danger"></form:errors>
                        </div>
                        <button type="submit" class="btn btn-secondary btn-sm float-right">Create</button>
                        <form:input type="hidden" class="form-control" path="available"  name="available" id="available"/>
                    </form:form>
                </div>
            </div> <!-- Content -->
        </main> <!-- Main (Nav & Content) -->
    </div>
</div>
