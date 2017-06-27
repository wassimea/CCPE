
var x_timer;            
function delete_message(message_id){
    clearTimeout(x_timer);
    x_timer = setTimeout(function(){
        delete_message_by_id(message_id);
    }, 1000);
}

function delete_message_by_id(message_id){
    $.post('delete_message', {'message_id': message_id}, function(data) {
        var row = document.getElementById(message_id);
        row.parentNode.removeChild(row);
    });
}