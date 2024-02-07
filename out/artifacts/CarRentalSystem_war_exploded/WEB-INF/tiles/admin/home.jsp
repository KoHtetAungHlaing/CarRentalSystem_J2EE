<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--User Home Page--%>

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
                <h3 class="text-info text-center mb-3">Car Brand Lists</h3>
                <a href="/admin/brand/create" class="btn btn btn-secondary btn-sm mb-4">Create<i class="fa fa-plus"></i></a>
                <table class="table table-bordered table-hover" id="admin_home_table">
                    <thead>
                    <tr class="bg-dark text-white text-center">
                        <th scope="col" style="width: 10%">No</th>
                        <th scope="col" style="width: 20%">Name</th>
                        <th scope="col" style="width: 10%">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="id" value="0"/>
                    <c:forEach var="brand" items="${brands}">
                        <c:set var="id" value="${id+1}"/>
                        <tr class="text-center">
                            <td><c:out value="${id}"/></td>
                            <td>${brand.brand_name}</td>
                            <td>
                                <a href="/admin/brand/edit/${brand.brand_id}" class="btn btn-outline-secondary btn-sm"><i
                                        class="fa fa-edit"></i></a>
                                <a href="/admin/brand/delete/${brand.brand_id}" class="btn btn-outline-secondary btn-sm" onclick="return confirm('Are You Sure You Want To Delete?');"><i
                                        class="fa fa-trash"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div> <!-- Content -->
        </main> <!-- Main (Nav & Content) -->
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#admin_home_table').DataTable();
    });
</script>
