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
});