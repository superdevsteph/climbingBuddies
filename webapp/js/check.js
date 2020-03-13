function checkRegisterUser() {
    let isOK = true;
    /*$('#errorpasswordconfirm').remove('class','d-none');*/
    $('#errorpasswordconfirm').attr('class', 'd-none');
    $('#errorpassword').attr('class', 'd-none');
    if ($('#password').val().length < 4 || $('#password').val() != $('#passwordconfirm').val()) {
        /*alert('les password ne vont pas');*/
        /*$('#errorpasswordconfirm').css('visibility', 'visible');*/
        /*$('#errorpasswordconfirm').remove('class','d-none').attr('class','d-block');*/
        $('#errorpasswordconfirm').removeClass('d-none');
        $('#errorpassword').removeClass('d-none');
        isOK = false;
    }
    $('#errorfirstname').attr('class', 'd-none');
    if ($('#firstname').val().length < 1) {
        $('#errorfirstname').removeClass('d-none');
        isOK = false;
    }
    $('#errorlastname').attr('class', 'd-none');
    if ($('#lastname').val().length < 1) {
        $('#errorlastname').removeClass('d-none');
        isOK = false;
    }
    $('#erroremail').attr('class', 'd-none');
    if (!validateEmail($('#email').val().toLowerCase())) {
        $('#erroremail').removeClass('d-none');
        isOK = false;
    }
    return isOK;
}

function validateEmail(email) {
    let regexp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return regexp.test(email);
}

function checkSearch() {
    let isOK = true;
    $('#errorFieldsSearch').attr('class', 'd-none');
    if ($('#lieu').val().length == 0 && $('#nombredesecteurs').val().length == 0 && $('#cotation').val().length == 0) {
        isOK = false;
        $('#errorFieldsSearch').removeClass('d-none');
    }
    return isOK;
}

function checkLogin() {
    let isOK = true;
    $('#erroremail').attr('class', 'd-none');
    if (!validateEmail($('#username').val().toLowerCase())) {
        isOK = false;
        $('#erroremail').removeClass('d-none');
    }
    $('#errorpassword').attr('class', 'd-none');
    if ($('#password').val().length < 4) {
        isOK = false;
        $('#errorpassword').removeClass('d-none');
    }
    return isOK;
}