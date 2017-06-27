function delete_course_fn(course_id){
	$(document).ready(function() {
        if(confirm('Are you sure ?')){
			    var x_timer;    
                              
				clearTimeout(x_timer);		        
				x_timer = setTimeout(function(){
				    deleteit();
				}, 1000);
		
			    function deleteit(){
                                $("#emmeye").html("");
				$.post('delete_course', {'course_id':course_id }, function(data) {
                                  
                                  $("#emmeye").html("<h3>Course successfully deleted.</h3>");
				});	 
			    }
        }
	  });

}