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



    $("body").on("click","#do-comment-course",function(){
        var com = $("#comment-area").val();

        if (com==""){
            alert("Escriba su comentario, por favor.");
            return;
        }else{
            var cid = $("#course-id").html();
            var uid = $("#user-id").html();
            var username = $("#user-name").html();

            $.ajax({
                method: 'post',
                url: "/courses/"+cid+"/course_comments",
                data: {user_id: uid,content: com},
                async: false
            }).done(function(response){
                console.log(response);
                var html = "<div class=\"col-md-8\">"+
                    "<div class=\"panel panel-default\">"+
                    "<div class=\"panel-heading\">"+
                    "<strong>"+username+"</strong> <span class=\"text-muted\">"+response.date+"</span>";

                if ($('#user-manager').html()=='true'){
                    html+= "<i class=\"fa-times fa pull-right delete-comment-course\" id=\""+response.id+"\"></i>";
                }
                html += "</div>"+
                    "<div class=\"panel-body\"><p>"+com+
                    "<p></div>"+
                    "</div>"+
                    "</div>"+
                    "</div>";
                $('#course-comment-list').append(html);
                $('#comment-area').val('');
            }).fail(function(jqXHR, textStatus){
                alert("Ups accion no disponible.");
            });
        }
    });
    $('body').on('click','.delete-comment-course',function(){
        var id = $(this).attr('id');
        var urlString = '/course_comments/'+id;
        var $element = $(this);
        $.ajax({
            type: 'DELETE',
            url: urlString
        }).done(function(response){
            console.log(response);
            $element.parentsUntil( ".course-comments ").remove();
        });
    });


}


$(document).on('page:load', ready);
$(document).ready(ready);