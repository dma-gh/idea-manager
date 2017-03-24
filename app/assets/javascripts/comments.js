$('#eventComments').on('show.bs.modal', function(){
    $.get("remote.htm", function(data){
        $('#modal').find('.modal-content').html(data);
    })
})