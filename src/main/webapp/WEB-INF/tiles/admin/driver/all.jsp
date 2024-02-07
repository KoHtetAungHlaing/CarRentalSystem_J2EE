<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--All Drivers List Form--%>

<div class="container-fluid">
    <div class="row g-0">
        <nav class="col-2 bg-light pe-3 border-right py-3">
            <div class="list-group text-start text-lg-start flex-fill">
                    <span class="list-group-item disabled d-none d-lg-block">
                        <h3>Dashboard</h3>
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
                <h3 class="text-info text-center mb-3">Driver Lists</h3>
                <a href="/admin/driver/create" class="btn btn-secondary btn-sm mb-4">Create<i
                        class="fa fa-plus"></i></a>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="driver_table">
                        <thead>
                        <tr class="bg-dark text-white text-center">
                            <th scope="col" style="width: 5%">No</th>
                            <th scope="col" style="width: 20%">Name</th>
                            <th scope="col" style="width: 20%">Nrc</th>
                            <th scope="col" style="width: 20%">Phone</th>
                            <th scope="col" style="width: 20%">Address</th>
                            <th scope="col" style="width: 5%">Available</th>
                            <th scope=" col" style="width: 10%">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="id" value="0"/>
                        <c:forEach var="driver" items="${drivers}">
                            <c:set var="id" value="${id+1}"/>
                            <tr class="text-center">
                                <td><c:out value="${id}"/></td>
                                <td>${driver.name}</td>
                                <td>${driver.nrc}</td>
                                <td>${driver.phone}</td>
                                <td>${driver.address}</td>
                                <td>${driver.available}</td>
                                <td>
                                    <c:if test="${driver.available}">
                                        <c:if test="${driver.driver_id != 1}">
                                            <a href="/admin/driver/edit/${driver.driver_id}"
                                               class="btn btn-outline-secondary btn-sm"><i class="fa fa-edit"></i></a>
                                            <a href="/admin/driver/delete/${driver.driver_id}"
                                               class="btn btn-outline-secondary btn-sm"
                                               onclick="return confirm('Are You Sure You Want To Delete?');"><i
                                                    class="fa fa-trash" id="icon_delete"></i></a>
                                        </c:if>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div> <!-- Content -->
        </main> <!-- Main (Nav & Content) -->
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#driver_table').DataTable();
    });
</script>