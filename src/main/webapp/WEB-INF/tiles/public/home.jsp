<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row mt-3">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <form class="d-flex" role="search">
            <c:set var = "car_model" scope = "session" value = "${carModels}"/>
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="tags">
            <a href="" id="text_link"><button class="btn btn-outline-info" type="button" id="btnSearch">Search</button></a>
        </form>
    </div>
    <div class="col-md-3"></div>
</div>

<c:if test="${!empty login && isLogin && flag}">
    <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
        <strong>${login}</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>

<c:if test="${!empty update_profile}">
    <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
        <strong>${update_profile }</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<c:if test="${!empty rent}">
    <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
        <strong>${rent}</strong>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
</c:if>
<c:if test="${!empty change_password}">
    <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
        <strong>${change_password}</strong>
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
            <input type="hidden" class="itemSearch" value="${carModel.model}"/>
        </c:forEach>
    </div>

</div>
<script>
    $(function () {
        var availableTags = [];
        var item = document.querySelectorAll(".itemSearch");
        for (var i=0;i<item.length;i++){
            availableTags[i]=(item[i].value);
        }
        $("#tags").autocomplete({
            source: availableTags
        });
    });
    $(document).ready(function(){
        $( "#tags" ).keyup(function() {
                $("#text_link").attr("href", "/showByUserSearch/" + $(this).val());
        });

        // $("#tags").keydown(function (e){
        //     if(e.which == 13){
        //         $("#text_link").attr("href", "/showByUserSearch/" + $(this).val());
        //     }
        // });
    });

</script>