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
                alert("Exitoso");
                $("#"+courseID).parentsUntil( ".until-here ").remove();
            }).fail(function(){
                alert("Ocurrio algo malo");
            });
    });


    $("body").on('click',
        'a.manage-teacher'
        ,function(){
            var actionType = $(this).attr("action");
            var courseID = $(this).attr("value");
            $.ajax({
                method: "put",
                url: "/teachers/"+courseID,
                async:false,
                data:{state: actionType}
            }).done(function(data){
                alert("Exitoso");
                $("#"+courseID).parentsUntil( ".until-here ").remove();
            }).fail(function(){
                alert("Ocurrio algo malo");
            });
        });


    // Search

    $('#search-btn').click(function () {

        var search_key = $("#search-bar").val();

        if (search_key!=""){
            $.ajax({
                method: "get",
                url: "/search/results",
                data: { keywords: search_key },
                async:false
            }).done(function(data){
                $("#results").html(data);
            }).fail(function(){
                alert("Algo no anda bien");
            });
        }

    });


}


$(document).on('page:load', ready);
$(document).ready(ready);