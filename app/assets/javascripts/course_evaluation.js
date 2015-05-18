// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
    $("#evaluation-course-modal").on('click', "#send-course-evaluation", function(){
        var evaluationData = {};
        for (var i = 1; i<6; i++){
            var target = "#rubric"+i;
            //console.log(target);
            var value = $('input[name=radioName]:checked', target.toString()).val()
            if (value == undefined){
                alert("No pueden haber rubros sin evaluar");
                return;
            }
            evaluationData[target.toString().replace('#','')] = value;
        }
        console.log (evaluationData);
        var course_id = $('#course-id').html();
        $.ajax({
            method: 'post',
            url: '/courses/'+course_id+'/course_evaluations',
            data: evaluationData
        }).done(function(response){
            console.log(response);
            location.reload();
        });
    });
});