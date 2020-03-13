$(document).ready(function(){
    $('#refreshenglish1').click(function(){
        $.ajax({url: myContextPath + "/language?lang=en", success: function(result){
                location.href = location.href;
            }});
    });
    $('#refreshenglish2').click(function(){
        $.ajax({url: myContextPath + "/language?lang=en", success: function(result){
                location.href = location.href;
            }});
    });
    $('#refreshfrench1').click(function(){
        $.ajax({url: myContextPath + "/language?lang=fr", success: function(result){
                location.href = location.href;
            }});
    });
    $('#refreshfrench2').click(function(){
        $.ajax({url: myContextPath + "/language?lang=fr", success: function(result){
                location.href = location.href;
            }});
    });
});