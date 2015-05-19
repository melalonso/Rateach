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

    $('.faculty-option').click(function (e) {
        var fac_id = $(this).attr("id");
        var uni_id = $("#uni-id").html();
        filterByFaculty(uni_id,fac_id);
    });


    function filterByFaculty(uni_id,fac_id){
        alert("tengo facultad: "+fac_id+" y uni: "+uni_id);
        $.ajax({
            method: "get",
            url: "/faculties/"+fac_id+"/teachers",
            async:false,
            data : { university_id : uni_id }
        }).done(function(data){
            alert(data);
            $(".teacher-list").html(data);
            $("#test").val("sdsdsd");
        }).fail(function(jqXHR, textStatus){
            alert("Ups accion no disponible.");
        });

    }

}


$(document).on('page:load', ready);
$(document).ready(ready);