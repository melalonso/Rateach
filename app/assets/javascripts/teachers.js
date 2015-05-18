// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	$('#evaluationModal').modal({
		backdrop:true,
		show: false
	});

	$("body").on('click','#evaluate-teacher', function(){
        var id = $("#teacher-id").html();
        $.ajax({
            method: 'get',
            url: '/teachers/'+id+'/teacher_evaluations/new',
            data: {teacher_id: id},
            async: false
        }).done(function(response){
            $('#evaluationModal').html(response);
            $('#evaluationModal').modal('show');
        });
	});

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
    });

});