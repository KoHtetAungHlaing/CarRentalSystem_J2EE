<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--Car Models List Form--%>

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
                <h3 class="text-info text-center mb-3">Car Model Lists</h3>
                <a href="/admin/car_model/create" class="btn btn-secondary btn-sm mb-4">Create<i
                        class="fa fa-plus"></i></a>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="model_table">
                        <thead>
                        <tr class="bg-dark text-white text-center">
                            <th scope="col">No</th>
                            <th scope="col">Brand</th>
                            <th scope="col">Model</th>
                            <th scope="col">Reg No</th>
                            <th scope="col">Image</th>
                            <th scope="col">Seat</th>
                            <th scope="col">Price</th>
                            <th scope="col">Available</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="id" value="0"/>
                        <c:forEach var="carModel" items="${carModels}">
                            <c:set var="id" value="${id+1}"/>
                            <tr class="text-center">
                                <td><c:out value="${id}"/></td>
                                <td>${carModel.brand.brand_name}</td>
                                <td>${carModel.model}</td>
                                <td>${carModel.reg_no}</td>
                                <td>
                                    <img src="/assets/imgs/${carModel.image}" width="50" height="50"
                                         style="max-width: 100%;height: auto;">
                                </td>
                                <td>${carModel.seat}</td>
                                <td>${carModel.price}</td>
                                <td>${carModel.available}</td>
                                <td>
                                    <c:if test="${carModel.available}">
                                        <a href="/admin/car_model/edit/${carModel.model_id}"
                                           class="btn btn-outline-secondary btn-sm"><i
                                                class="fa fa-edit"></i></a>
                                        <a href="/admin/car_model/delete/${carModel.model_id}"
                                           class="btn btn-outline-secondary btn-sm"
                                           onclick="return confirm('Are You Sure You Want To Delete?');"><i
                                                class="fa fa-trash"></i></a>
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
        $('#model_table').DataTable();
    });
</script>
