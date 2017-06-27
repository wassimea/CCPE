<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<link rel='stylesheet' type='text/css' href='css/main.css'>
<head>
    
    </head>
  <body>
<div id = 'MainContainer'>
	<% request.getRequestDispatcher("link.html").include(request,response); %>
	<% session.setAttribute("course_id", request.getParameter("course_id")); %>
	<% session.setAttribute("course_number_of_lectures", request.getParameter("course_number_of_lectures")); %>
	<% session.setAttribute("course_start_date", request.getParameter("course_start_date")); %>
        <h2>Manage lecture times</h2>
        <div id = 'content'>  
	<form action = manage_lecture_times  method = "GET">
		<input type="hidden"  name="course_id" value = "<%= request.getParameter("course_id") %>"/>
		<input type="hidden"  name="course_number_of_lectures" value = "<%= request.getParameter("course_number_of_lectures") %>"/>
		<input type="hidden"  name="course_start_date" value = "<%= request.getParameter("course_start_date") %>"/>
		<div class = "manage_lecture_times_monday">
			<br>
			<label><strong>Monday</strong></label>
			<input type="checkbox" name="monday_checkbox" class = "monday_checkbox">
			<br>
			<label><strong>From:</strong></label>
			<label>Hour:</label>
			<select name="monday_from_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_hour">
					<option disabled selected value></option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="monday_from_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<label><strong>To</strong></label>
			<label>Hour:</label>
			<select name="monday_to_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_hour">
					<option disabled selected value></option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="monday_to_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_hour">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<br><br>
		</div>

		<div class = "manage_lecture_times_tuesday">
			<br>
			<label><strong>Tuesday</strong></label>
			<input type="checkbox" name="tuesday_checkbox" class = "tuesday_checkbox">
			<br>
			<label><strong>From:</strong></label>
			<label>Hour:</label>
			<select name="tuesday_from_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_hour">
					<option disabled selected value></option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="tuesday_from_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<label><strong>To</strong></label>
			<label>Hour:</label>
			<select name="tuesday_to_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_hour">
					<option disabled selected value></option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="tuesday_to_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<br><br>
		</div>

		<div class = "manage_lecture_times_wednesday">
			<br>
			<label><strong>Wednesday</strong></label>
			<input type="checkbox" name="wednesday_checkbox" class = "wednesday_checkbox">
			<br>
			<label><strong>From:</strong></label>
			<label>Hour:</label>
			<select name="wednesday_from_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_hour">
					<option disabled selected value></option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="wednesday_from_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<label><strong>To</strong></label>
			<label>Hour:</label>
			<select name="wednesday_to_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_hour">
					<option disabled selected value></option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="wednesday_to_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<br><br>
		</div>

		<div class = "manage_lecture_times_thursday">
			<br>
			<label><strong>Thursday</strong></label>
			<input type="checkbox" name="thursday_checkbox" class = "thursday_checkbox">
			<br>
			<label><strong>From:</strong></label>
			<label>Hour:</label>
			<select name="thursday_from_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_hour">
					<option disabled selected value></option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="thursday_from_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<label><strong>To</strong></label>
			<label>Hour:</label>
			<select name="thursday_to_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_hour">
					<option disabled selected value></option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="thursday_to_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<br><br>
		</div>

		<div class = "manage_lecture_times_friday">
			<br>
			<label><strong>Friday</strong></label>
			<input type="checkbox" name="friday_checkbox" class = "friday_checkbox">
			<br>
			<label><strong>From:</strong></label>
			<label>Hour:</label>
			<select name="friday_from_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_hour">
					<option disabled selected value></option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="friday_from_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<label><strong>To</strong></label>
			<label>Hour:</label>
			<select name="friday_to_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_hour">
					<option disabled selected value></option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="friday_to_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<br><br>
		</div>

		<div class = "manage_lecture_times_saturday">
			<br>
			<label><strong>Saturday</strong></label>
			<input type="checkbox" name="saturday_checkbox" class = "saturday_checkbox">
			<br>
			<label><strong>From:</strong></label>
			<label>Hour:</label>
			<select name="saturday_from_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_hour">
					<option disabled selected value></option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="saturday_from_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<label><strong>To</strong></label>
			<label>Hour:</label>
			<select name="saturday_to_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_hour">
					<option disabled selected value></option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="saturday_to_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<br><br>
		</div>

		<div class = "manage_lecture_times_sunday">
			<br>
			<label><strong>Sunday</strong></label>
			<input type="checkbox" name="sunday_checkbox" class = "sunday_checkbox">
			<br>
			<label><strong>From:</strong></label>
			<label>Hour:</label>
			<select name="sunday_from_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_hour">
					<option disabled selected value></option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="sunday_from_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_from_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<label><strong>To</strong></label>
			<label>Hour:</label>
			<select name="sunday_to_hour" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_hour">
					<option disabled selected value></option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				</select>
			
			<label>Minute:</label>

			<select name="sunday_to_minute" onmousedown="if(this.options.length>8){this.size=0;}"  onchange='this.size=0;' onblur="this.size=0;" size = "0" class = "manage_lecture_times_to_minute">
					<option disabled selected value></option>
					<option value="00">00</option>
					<option value="05">05</option>
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="20">20</option>
					<option value="25">25</option>
					<option value="30">30</option>
					<option value="35">35</option>
					<option value="40">40</option>
					<option value="45">45</option>
					<option value="50">50</option>
					<option value="55">55</option>
				</select>
			<br><br><br><br>
		</div>
		<a href = "pingit.jsp">PingIt</a>
                <div class = "Button Button--start">
                <button type = 'submit'><span>Confirm</span></button>
                </div>
	</form>
        </div>
	</div>
  </body>

</html>


