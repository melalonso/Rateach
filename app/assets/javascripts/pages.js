// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function back(){
    //window.location.reload(history.go(-1));
    document.write(document.referrer);
    window.location.href = history.go(-1);//document.referrer;
    location.reload();
    history.go(0);
}

var ready = function() {
    $('.dropdown-toggle').dropdown();

    $('#manage-teachers').click(function () {
        var id = $(this).attr("href");

        $.ajax({
            method: "get",
            url: "/admin/teachers",
            async:false,
            data:{}
        }).done(function(data){
            $(id).html(data);
        });
    });

    $('#manage-courses').click(function () {

        var id = $(this).attr("href");

        $.ajax({
            method: "get",
            url: "/admin/courses",
            async:false,
            data:{}
        }).done(function(data){
            $(id).html(data);
        });
    });

    $('#manage-teachers').click(function () {

        var id = $(this).attr("href");

        $.ajax({
            method: "get",
            url: "/admin/teachers",
            async:false,
            data:{}
        }).done(function(data){
            $(id).html(data);
        });
    });


    $("body").on('click',
        'a.manage-course'
        ,function(){
            var actionType = $(this).attr("action");
            var courseID = $(this).attr("value");
            $.ajax({
                method: "put",
                url: "/courses/"+courseID,
                async:false,
                data:{state: actionType}
            }).done(function(data){
                alert("success");
                $("#"+courseID).parentsUntil( ".until-here ").remove();
            }).fail(function(){
                alert("mal");
            });
    });


}


$(document).on('page:load', ready);
$(document).ready(ready);