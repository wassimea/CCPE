
function delete_applications(row_id,course_id){
	$(document).ready(function() {
		    if(confirm('Are you sure ?')){
			    var x_timer;    
			    var row = row_id;
				clearTimeout(x_timer);		        
				x_timer = setTimeout(function(){
				    delete_application(row);
				}, 1000);
		
			    function delete_application(row){
				$("#ResultTable").html('');
                                var registered_only_bool = 0;
                                var paid_only_bool = 0;
                                var submitted_only_bool = 0;      
                                var all_bool = 0;    
                                if(document.getElementById("show_registered_checkbox").checked)
                                {
                                  registered_only_bool = 1;
                                  $.get('show_only_registered', {'registered_only_bool':registered_only_bool,'application_id':row , 'course_id':course_id}, function(data) {
                                    $("#ResultTable").html(data);
                                  });
                                }
                                
                                else if(document.getElementById("show_paid_checkbox").checked)
                                {
                                  paid_only_bool = 1;
                                  $.get('show_paid_only', {'paid_only_bool':paid_only_bool,'application_id':row , 'course_id':course_id}, function(data) {
                                    $("#ResultTable").html(data);
                                  });
                                }
                                
                                else if(document.getElementById("show_submitted_checkbox").checked)
                                {
                                  submitted_only_bool = 1;
                                  $.get('show_submitted_only', {'submitted_only_bool':submitted_only_bool,'application_id':row , 'course_id':course_id}, function(data) {
                                    $("#ResultTable").html(data);
                                  });
                                }
                                else //(document.getElementById("show_all_checkbox").checked)
                                {
                                  all_bool = 1;
                                  $.get('show_all', {'all_bool':all_bool,'application_id':row , 'course_id':course_id}, function(data) {
                                    $("#ResultTable").html(data);
                                  });
                                  
                                  
                                }
			    }
		}
	  });

}


function show_registered_students(course_id){
	$(document).ready(function() {
			    var x_timer;    
			    var registered_only = 0
                            if(document.getElementById("show_registered_checkbox").checked)
                            {
                              registered_only = 1
                            }
                              
				clearTimeout(x_timer);		        
				x_timer = setTimeout(function(){
				    show_students(registered_only);
				}, 1000);
		
			    function show_students(registered_only_bool){
				$("#ResultTable").html('');
				$.get('show_only_registered', {'registered_only_bool':registered_only_bool, 'course_id':course_id }, function(data) {
				  $("#ResultTable").html(data);
				});	
			    }
	  });

}


function show_submitted_students(course_id){
	$(document).ready(function() {
			    var x_timer;    
			    var submitted_only_bool = 0
                            if(document.getElementById("show_submitted_checkbox").checked)
                            {
                              submitted_only_bool = 1
                            }
                              
				clearTimeout(x_timer);		        
				x_timer = setTimeout(function(){
				    show_students(submitted_only_bool);
				}, 1000);
		
			    function show_students(submitted_only_bool){
				$("#ResultTable").html('');
				$.get('show_submitted_only', {'submitted_only_bool':submitted_only_bool, 'course_id':course_id }, function(data) {
				  $("#ResultTable").html(data);
				});	
			    }
	  });

}

function show_paid_students(course_id){
	$(document).ready(function() {
			    var x_timer;    
			    var paid_only_bool = 0
                            if(document.getElementById("show_paid_checkbox").checked)
                            {
                              paid_only_bool = 1
                            }
                              
				clearTimeout(x_timer);		        
				x_timer = setTimeout(function(){
				    show_students(paid_only_bool);
				}, 1000);
		
			    function show_students(paid_only_bool){
				$("#ResultTable").html('');
				$.get('show_paid_only', {'paid_only_bool':paid_only_bool, 'course_id':course_id }, function(data) {
				  $("#ResultTable").html(data);
				});	
			    }
	  });

}



function show_all_students(course_id){
	$(document).ready(function() {
			    var x_timer;    
			    var all_bool = 0
                            if(document.getElementById("show_all_checkbox").checked)
                            {
                              all_bool = 1
                            }
                              
				clearTimeout(x_timer);		        
				x_timer = setTimeout(function(){
				    show_students(all_bool);
				}, 1000);
		
			    function show_students(all_bool){
				$("#ResultTable").html('');
				$.get('show_all', {'all_bool':all_bool, 'course_id':course_id }, function(data) {
				  $("#ResultTable").html(data);
				});	 
			    }
	  });

}



function update_table(course_id){
	$(document).ready(function() {
		    if(confirm('Are you sure ?')){
			    var x_timer;    
				clearTimeout(x_timer);		        
				x_timer = setTimeout(function(){
				    updateit();
				}, 1000);
		
			    function updateit(){
				$("#ResultTable").html('');
                                var registered_only_bool = 0;
                                var paid_only_bool = 0;
                                var submitted_only_bool = 0;            
                                if(document.getElementById("show_registered_checkbox").checked)
                                {
                                  registered_only_bool = 1;
                                  $.post('show_only_registered', {'registered_only_bool':registered_only_bool , 'course_id':course_id}, function(data) {
                                    $("#ResultTable").html(data);
                                  });
                                }
                                
                                else if(document.getElementById("show_paid_checkbox").checked)
                                {
                                  paid_only_bool = 1;
                                  $.get('show_paid_only', {'paid_only_bool':paid_only_bool, 'course_id':course_id}, function(data) {
                                    $("#ResultTable").html(data);
                                  });
                                }
                                
                                else if(document.getElementById("show_submitted_checkbox").checked)
                                {
                                  submitted_only_bool = 1;
                                  $.get('show_submitted_only', {'submitted_only_bool':submitted_only_bool, 'course_id':course_id}, function(data) {
                                    $("#ResultTable").html(data);
                                  });
                                }
			    }
		}
	  });

}

