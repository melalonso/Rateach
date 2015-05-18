// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var ready = function() {

    $('#evaluation-course-modal').modal({
        backdrop:true,
        show: false
    });

    $("#evaluate-course").on('click', function(){

        var id = $("#course-id").html();
        $.ajax({
            method: 'get',
            url: '/courses/'+id+'/course_evaluations/new',
            data: {teacher_id: id},
            async: false
        }).done(function(response){
            $('#evaluation-course-modal').html(response);
            $('#evaluation-course-modal').modal('show');
        });

    });


     $("#do-comment-course").click(function(){
         var com = $("#comment-area-course").val();

         if (com==""){
             alert("Escriba su comentario, por favor.");
             return;
         }else{
             var cid = $("#course-id").html();
             var uid = $("#user-id-course").html();
             var username = $("#user-name").html();

             $.ajax({
                 method: 'post',
                 url: "/courses/"+cid+"/course_comments",
                 data: {user_id: uid,content: com},
                 async: false
             }).done(function(response){
                 $('#course-comment-list').append('<li class=\'comment-element\'><p><span>'+username+' </span>'+response+'</p>'+com+'</li>');
                 $('#comment-area-course').val('');
             }).fail(function(jqXHR, textStatus){
                alert("Ups accion no disponible.");
             });
         }
     });


}


$(document).on('page:load', ready);
$(document).ready(ready);