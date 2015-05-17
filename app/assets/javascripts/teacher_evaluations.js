
$(document).ready(function(){
    $("#evaluationModal").on('click', "#send-evaluation", function(){
        var evaluationData = {};
        for (var i = 1; i<11; i++){
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
        var teacher_id = $('#teacher-id').html();
        $.ajax({
            method: 'post',
            url: '/teachers/'+teacher_id+'/teacher_evaluations',
            data: evaluationData
        }).done(function(response){
            console.log(response);
            location.reload();
        });
    });
});