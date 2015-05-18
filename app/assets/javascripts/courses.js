// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
    $('#evaluation-course-modal').modal({
        backdrop:true,
        show: false
    });

    $("#evaluate-course").on('click', function(){
        var id = $("#course-id").html();
        alert('click');
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

    /*
    $("#do-comment").click(function(){
        var com = $("#comment-area").val();

        if (com==""){
            alert("Escriba su comentario, por favor.");
            return;
        }else{
            var tid = $("#teacher-id").html();
            var uid = $("#user-id").html();
            var username = $("#user-name").html();

            $.ajax({
                method: 'post',
                url: "/teachers/"+tid+"/teacher_comments",
                data: {user_id: uid,content: com},
                async: false
            }).done(function(response){
                $('#teacher-comment-list').append('<li class=\'comment-element\'><p><span>'+username+' </span>'+response+'</p>'+com+'</li>');
                $('#comment-area').val('');
            }).fail(function(jqXHR, textStatus){
                alert("Ups accion no disponible.");
            });
        }
    });*/

});