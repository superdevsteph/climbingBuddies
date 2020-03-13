$(document).ready(function () {
    $("#userlistnumpage").keyup(function (e) {
        if (e.keyCode === 13) {
            if (isNaN($("#userlistnumpage").val())) {return;}
            let numpage = $("#userlistnumpage").val() - 1;
            if(numpage >= $("#userpagetotalpages").val()) {
                numpage = $("#userpagetotalpages").val() -1;
            }
            if (numpage < 0) {
                numpage = 0;
            }
            let url = myContextPath + "/user/listpage?num=" + numpage;
            window.location = url;
        }
    });
    for (let i = 1; i <= $("#pagesize").val(); i++) {
        $("#username" + i).mouseover(function(e){
            let user = new Object();
            user.id = $("#userid" +i).val();
            user.firstName = $("#username" + i).html();
            $.ajax({
                type: "POST",
                url: myContextPath + "/user/info",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(user),
                /*data: markers,*/
                dataType: "json",
            }).done(function(data){
                /*$("#tooltipmessage").html($("#username" + i).html());*/
                $("#tooltipmessage").html(' ' + data.introOfName + ': ' + data.firstName + ' ' + data.lastName + ' ');
                let bottomuser = document.querySelector('#username' + i).getBoundingClientRect().bottom;
                $("#tooltipmessage").css({left: e.pageX , top: bottomuser/*e.pageY*/}).show();
            });
        });
        $("#username" + i).mouseout(function () {
            $("#tooltipmessage").hide();
        });
    }
});