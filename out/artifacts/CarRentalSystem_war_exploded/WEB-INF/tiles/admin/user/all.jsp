<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--All Users List Form--%>

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
                <h3 class="text-info text-center mb-5">User Lists</h3>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="user_table">
                        <thead>
                        <tr class="bg-dark text-white text-center">
                            <th scope="col" style="width: 3%">No</th>
                            <th scope="col" style="width: 15%">Name</th>
                            <th scope="col" style="width: 15%">Nrc</th>
                            <th scope="col" style="width: 15%">Email</th>
                            <th scope="col" style="width: 15%">Address</th>
                            <th scope="col" style="width: 15%">Phone</th>
                            <th scope="col" style="width: 3%">Renting</th>
                            <th scope="col" style="width: 4%">Enabled</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="id" value="0"/>
                        <c:forEach var="user" items="${users}">
                            <c:set var="id" value="${id+1}"/>
                            <tr class="text-center">
                                <td><c:out value="${id}"/></td>
                                <td>${user.username}</td>
                                <td>${user.nrc}</td>
                                <td>${user.email}</td>
                                <td>${user.address}</td>
                                <td>${user.phone}</td>
                                <td>${user.renting}</td>
                                <td>
                                    <c:if test="${!user.renting}">
                                        <c:if test="${user.user_id!=9}">
                                            <c:if test="${user.enabled}">
                                                <a href="/admin/user/toggle/${user.user_id}"
                                                   class="btn btn-danger btn-sm">Ban</a>
                                            </c:if>
                                            <c:if test="${!user.enabled}">
                                                <a href="/admin/user/toggle/${user.user_id}"
                                                   class="btn btn-dark btn-sm">Active</a>
                                            </c:if>
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
        $('#user_table').DataTable();
    });
</script>