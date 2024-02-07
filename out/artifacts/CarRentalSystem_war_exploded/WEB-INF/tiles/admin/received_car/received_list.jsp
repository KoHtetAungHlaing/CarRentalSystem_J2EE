<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--Received Car List Form--%>

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
                <h3 class="text-info text-center mb-5">Received Car Lists</h3>
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr class="bg-dark text-white text-center">
                        <th scope="col" style="width: 10%;">received_id</th>
                        <th scope="col" style="width: 10%;">rent_id</th>
                    </tr>
                    </thead>
                    <c:if test="${!empty receivedCars}">
                        <tbody>
                        <c:set var="id" value="0"/>
                        <c:forEach var="receivedCar" items="${receivedCars}">
                            <c:set var="id" value="${id+1}"/>
                            <tr class="text-center">
                                <td><c:out value="${id}"/></td>
                                <td>${receivedCar.rent_id}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </c:if>
                </table>
            </div> <!-- Content -->
            <c:if test="${empty receivedCars}">
                <h3 class="text-center">There is no data!</h3>
            </c:if>
        </main> <!-- Main (Nav & Content) -->
    </div>
</div>
