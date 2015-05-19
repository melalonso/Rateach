/**
 * Created by sd on 5/18/15.
 */
var checkField = function (value){
    if (value=='')return true;
    value = value.replace(/\s/g, '');
    if (value.length == 0) return true;
};
var fillSelect = function(url, element, caption){
    $.ajax({
        method: 'get',
        url: url
    }).done(function(response){
        var response = response;
        var html = "<option value='0'> Seleccione una "+caption+" </option>";
        for (var i = 0; i<  response.length; i++){
            html += "<option value=\""+ response[i].id+"\">"+ response[i].name +"</option>";
        }
        $(element).html(html);
    });
};

var ready = function(){
    fillSelect('/universities.json','#select-university','Universidad');
    $('#select-university').on('change', function(){
        var id = $( "#select-university option:selected" ).attr('value');
        if (id==0){
            $('#select-faculty').html("<option value='0'> Seleccione una Escuela </option>");
        }else{
            fillSelect(('/universities/'+id+'/faculties.json').toString(),'#select-faculty','Escuela');
        }
    });

    $('#add-teacher').click(function(){
        var uid = $( "#select-university option:selected" ).attr('value');
        var fid = $( "#select-faculty option:selected" ).attr('value');
        var name = $('#teacher-name').val();
        var lastName = $('#teacher-last-name').val();
        if (uid==0 || fid==0 || checkField(name) || checkField(lastName)){
            alert('Los datos ingresados no son correctos por favor reviselos e intentelo de nuevo.');
            return;
        }
        $.ajax({
            method: 'post',
            url: '/teachers',
            data: {
                teacher:
                {university_id: uid, faculty_id: fid,
                name: name, last_name: lastName
                    }
                }

        }).done(function(response){
            console.log('success');
            window.location = '/';
        });
        //alert(name+"  "+lastName);
    });


    $('#add-course').click(function(){
        var uid = $( "#select-university option:selected" ).attr('value');
        var fid = $( "#select-faculty option:selected" ).attr('value');
        var name = $('#teacher-name').val();
        if (uid==0 || fid==0 || checkField(name)){
            alert('Los datos ingresados no son correctos por favor reviselos e intentelo de nuevo.');
            return;
        }
        $.ajax({
            method: 'post',
            url: '/courses',
            data: {
                course:
                {university_id: uid, faculty_id: fid,
                    name: name
                }
            }

        }).done(function(response){
            console.log('success');
            window.location = '/';
        });
        //alert(name+"  "+lastName);
    });
};
$(document).on('page:load', ready);
$(document).ready(ready);