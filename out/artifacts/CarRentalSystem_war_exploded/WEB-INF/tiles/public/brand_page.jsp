<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 class="text-info text-center my-3">Car Rental System</h1>
<c:if test="${!empty login_success}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>${login_success}</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<c:if test="${!empty update_success}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>${update_success}</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<c:import url="/WEB-INF/tiles/includes/slideshow.jsp"/>
<div class="container my-2">
    <div class="row">
        <c:forEach var="carModel" items="${carModels}">
            <div class="col-md-3 mb-2">
                <div class="card">
                    <img src="/assets/imgs/${carModel.image}" class="card-img-top">
                    <div class="card-body">
                        <h6 class="card-title">Brand &nbsp;&nbsp; :&nbsp; ${carModel.brand.brand_name}</h6>
                        <p class="card-text">Model &nbsp;&nbsp; :&nbsp; ${carModel.model}</p>
                        <p class="card-text">Seats &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp; ${carModel.seat}</p>
                        <p class="card-text">Price &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;${carModel.price}</p>
                        <a href="/detail/${carModel.model_id}" class="btn btn-secondary btn-sm float-right">Detail</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>