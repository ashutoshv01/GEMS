<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddEvents</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
	<div class ="login">
        <h1 style="text-align:center">Add and Schedule an Event</h1>
        <div class="eventform">
        
            <form id ="addEvent" class="eventinput-group" action="addevents.jsp" autocomplete="off" method="post">            
                <input type="text" class="input-field" name ="Details" placeholder="Enter the details of the events" required>             
                <input type="text" class="input-field" name ="Venue" placeholder="Enter the venue" required>
                
                <label for="appt" class ="inputboxesT">Time:</label>
  				<input type="time" id="appt" name="T" class="inputboxesT" required>
				
				<label for="date" class="inputD">Date:</label>
  				<input type="date" id="date" name="Date" class="inputboxesD" required>
  				
  				<!--  
  				<label for="reminder" class="inputR">Want a reminder?</label>
  				<input type="checkbox" id="reminder" class="checkreminder" name="IsRemind" value="Candidate">
  				-->
                <input type ="submit" class="addeventsbtn" value ="ADD">
            </form>
        </div>
        <input type ="submit" class="back-btn" value ="Back to Home" onClick = history.back()>
    </div>
</body>
</html>