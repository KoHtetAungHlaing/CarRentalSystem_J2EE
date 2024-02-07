<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--Update Driver Form--%>

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
                <h3 class="text-info text-center mb-5">Edit Driver</h3>
                <div class="col-md-6 offset-md-3">
                    <form:form method="post" modelAttribute="driver" action="/admin/driver/edit">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <form:input type="text" class="form-control" id="name" name="name" path="name" value="${driver.name}"/>
                        </div>
                        <div class="form-group">
                            <label for="nrc">Nrc</label>
                            <form:input type="text" class="form-control" id="nrc" name="nrc" path="nrc" value="${driver.nrc}" readonly="true"/>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <form:input type="text" class="form-control" id="phone" name="phone" path="phone" value="${driver.phone}"/>
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <form:input type="text" class="form-control" id="address" name="address" path="address" value="${driver.address}"/>
                        </div>
                        <form:input type="hidden" path="driver_id" id="driver_id" value="${driver.driver_id}"/>
                        <button type="submit" class="btn btn-secondary btn-sm float-right">Edit</button>
                        <form:input type="hidden" path="available"  value="${driver.available}" name="${driver.available}" id="${driver.available}"/>
                    </form:form>
                </div>
            </div> <!-- Content -->
        </main> <!-- Main (Nav & Content) -->
    </div>
</div>
