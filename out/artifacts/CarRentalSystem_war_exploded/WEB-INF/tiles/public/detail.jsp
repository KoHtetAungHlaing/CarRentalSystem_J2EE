<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<div class="container my-3">
    <h2 class="text-info text-center mb-3">Rent Car</h2>
    <div class="col-md-8 offset-md-2">
        <div>
            <img src="/assets/imgs/${carModel.image}" alt="" width="700" height="300" class="mb-4 img-fluid" style="max-width: 100%;height: auto;">
        </div>
        <div>
            <form:form method="post" action="/detail" modelAttribute="rentDTO">
                <div class="form-group">
                    <input type="hidden" value="${rentDTO.carModel.model_id}" name="model_id"/>
                </div>
                <div class="form-group">
                    <input type="hidden" value="${rentDTO.user.user_id}" name="user_id"/>
                </div>
                <div class="form-group">
                    <input type="hidden" value="${rentDTO.user.renting}" name="renting" id="renting"/>
                </div>
                <div class="form-group">
                    <input type="hidden" value="${rentDTO.user.enabled}" name="enabled" id="enabled"/>
                </div>
                <div class="form-group">
                    <label for="model">Model</label>
                    <input type="text" value="${rentDTO.carModel.model}" class="form-control" id="model" name="model"/>
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" value="${rentDTO.carModel.price}" class="form-control" id="price" name="price"/>
                </div>
                <div class="form-group">
                    <label for="seat">No.of Seat</label>
                    <input type="number" value="${rentDTO.carModel.seat}" class="form-control" id="seat" name="seat"/>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <form:input type="text" value="${rentDTO.user.username}" class="form-control" id="username" name="username" path=""/>
                </div>
                <div class="form-group">
                    <label for="driver_id">Driver Name</label>
                    <form:select class="form-control" id="driver_id" name="driver_id" path="">
                        <form:options items="${drivers}" itemLabel="name" itemValue="driver_id"></form:options>
                    </form:select>
                </div>
                <div class="form-group">
                    <label for="from_date">From Date</label>
                    <input type="date" class="form-control" id="from_date" name="from_date" value=""/>
                </div>
                <div class="form-group">
                    <label for="to_date">To Date</label>
                    <input type="date" class="form-control" id="to_date" name="to_date" onclick="calculateTotalPrice()" value=""/>
                </div>

                <div class="form-group">
                    <label for="no_of_day">No.of Day</label>
                    <input type="number" value="no_of_day" class="form-control" id="no_of_day" name="no_of_day"/>
                </div>
                <div class="form-group">
                    <label for="total_price">Total Price</label>
                    <input type="number" value="total_price" class="form-control" id="total_price" name="total_price"/>
                </div>
                <button type="submit" id="submit" class="btn btn-secondary btn-sm float-right">Rent</button>
                <input type="hidden" value="${rentDTO.user.user_id}" name="${rentDTO.user.user_id}" id="user_id"/>
                <input type="hidden" value="${rentDTO.carModel.model_id}" name="${rentDTO.carModel.model_id}" id="model_id"/>
            </form:form>
        </div>
    </div>
    <div class="col-md-4"></div>
</div>

<script language="javascript">
    function calculateTotalPrice() {
        var rent_price;
        var rent_totalPrice;
        var driver_price;
        setTimeout(function () {
            var fromDate = new Date(document.getElementById('from_date').value);
            var toDate = new Date(document.getElementById('to_date').value);
            rent_price =  parseInt(document.getElementById('price').value)
            rent_totalPrice = parseInt(document.getElementById('total_price').value)
            var username = document.getElementById('username').value;
            var user_id = document.getElementById('user_id').value;
            var totalTimes = toDate.getTime() - fromDate.getTime()
            var days = Math.ceil(totalTimes / (1000 * 3600 * 24))
            var renting = document.getElementById('renting').value;
            var driver_id = document.getElementById('driver_id').value;
            if (driver_id == "1") {
                driver_price = 0;
            }else{
                driver_price = 20000;
            }
            if (fromDate.getTime() == toDate.getTime()) {
                document.getElementById('no_of_day').value = 1;
                document.getElementById('total_price').value = rent_price + driver_price;
            } else if (fromDate.getTime() > toDate.getTime()) {
                alert("From Date is greater than To Date, Please Choose Again!!")
                document.getElementById('no_of_day').value = 0;
                document.getElementById('total_price').value = 0;
            } else {
                document.getElementById('no_of_day').value = days;
                rent_totalPrice = days * rent_price;
                document.getElementById('total_price').value = rent_totalPrice + ((driver_price)*days);
            }
            if (renting == 'true'){
                alert(username + " is already renting! Can't rent right now!")
                document.getElementById("submit").disabled = true;
            } else{
                document.getElementById("submit").disabled = false;
                if (days > 10){
                    var text = "Admin bans for renting over 10 days \n Do you want to rent? ";
                    if (confirm(text) == true) {
                        document.getElementById('enabled').value = false;
                        window.location = '/login?ban_user';
                    } else {
                        document.getElementById('no_of_day').value = 0;
                        document.getElementById('total_price').value = 0;
                        document.getElementById("submit").disabled = true;
                    }
                    document.getElementById('enabled').value = false;
                }
            }
        }, 3000);
    }

    var today = new Date();
    var dd = String(today.getDate()).padStart(2, '0');
    var mm = String(today.getMonth() + 1).padStart(2, '0');
    var yyyy = today.getFullYear();

    today = yyyy + '-' + mm + '-' + dd;
    $('#from_date').attr('min', today);
    $('#to_date').attr('min', today);
</script>