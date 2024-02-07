$('document').ready(function () {
    var password = document.getElementById("password")
    var confirm_password = document.getElementById("confirm_password")
    function validatePassword() {
        if (password.value != confirm_password.value){
            confirm_password.setCustomValidity("Password Don't Match, Try Again!")
        }else {
            confirm_password.setCustomValidity("")
        }
    }
    password.onchange = validatePassword
    confirm_password.onkeyup = validatePassword
});