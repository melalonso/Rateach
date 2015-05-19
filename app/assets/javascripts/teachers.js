// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var ready = function() {
    $('.dropdown-toggle').dropdown();

    $('#evaluationModal').modal({
        backdrop:true,
        show: false
    });


    $("body").on("click","#do-comment",function(){
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
                console.log(response);
                var html = "<div class=\"col-md-8\">"+
                    "<div class=\"panel panel-default\">"+
                    "<div class=\"panel-heading\">"+
                    "<strong>"+username+"</strong> <span class=\"text-muted\">"+response.date+"</span>";

                    if ($('#user-manager').html()=='true'){
                        html+= "<i class=\"fa-times fa pull-right delete-comment\" id=\""+response.id+"\"></i>";
                    }
                    html += "</div>"+
                    "<div class=\"panel-body\"><p>"+com+
                    "<p></div>"+
                    "</div>"+
                    "</div>"+
                    "</div>";
                $('#teacher-comment-list').append(html);
                $('#comment-area').val('');
            }).fail(function(jqXHR, textStatus){
                alert("Ups accion no disponible.");
            });
        }
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

    $('body').on('click','.delete-comment',function(){
        var id = $(this).attr('id');
        var urlString = '/teacher_comments/'+id;
        var $element = $(this);
        $.ajax({
            type: 'DELETE',
            url: urlString
        }).done(function(response){
            console.log(response);
            $element.parentsUntil( ".teacher-comments ").remove();
        });
    });
};


$(document).on('page:load', ready);
$(document).ready(ready);