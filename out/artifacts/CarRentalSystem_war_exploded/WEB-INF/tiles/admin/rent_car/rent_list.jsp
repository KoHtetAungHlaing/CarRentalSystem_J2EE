<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--Active Rent List Form--%>

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
                <h3 class="text-info text-center mb-5">Active Rent Lists</h3>
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr class="bg-dark text-white text-center">
                            <th scope="col" style="width: 5%">No</th>
                            <th scope="col" style="width: 10%">Driver Id</th>
                            <th scope="col" style="width: 10%">User Id</th>
                            <th scope="col" style="width: 10%">Model Id</th>
                            <th scope="col" style="width: 10%">No: Of Day</th>
                            <th scope="col" style="width: 14%">Total Price</th>
                            <th scope="col" style="width: 14%">From Date</th>
                            <th scope="col" style="width: 14%">To Date</th>
                            <th scope="col" style="width: 13%">Add Received</th>
                        </tr>
                        </thead>
                        <c:if test="${!empty rents}">
                            <tbody>
                            <c:set var="id" value="0"/>
                            <c:forEach var="rent" items="${rents}">
                                <c:set var="id" value="${id+1}"/>
                                <tr class="text-center">
                                    <td><c:out value="${id}"/></td>
                                    <td>${rent.driver_id}</td>
                                    <td>${rent.user_id}</td>
                                    <td>${rent.model_id}</td>
                                    <td>${rent.no_of_day}</td>
                                    <td>${rent.total_price}</td>
                                    <td>${rent.from_date}</td>
                                    <td>${rent.to_date}</td>
                                    <td>
                                        <c:if test="${!rent.received_car}">
                                            <a href="/admin/rent_car/rent_list/${rent.rent_id}"
                                               class="btn btn-outline-secondary btn-sm">Add</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </c:if>
                    </table>
                </div>
            </div> <!-- Content -->
            <c:if test="${empty rents}">
                <h3 class="text-center">There is no data!</h3>
            </c:if>
        </main> <!-- Main (Nav & Content) -->
    </div>
</div>
