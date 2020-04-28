<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submit details</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
	<div class ="login">
        <h1 style="text-align:center">Complete your details to confirm participation</h1>
        <div class="eventform">
            <form id ="candidatereg" class="eventinput-group" action="details.jsp" autocomplete="off" method="post">
            	<select class="input-field" name="Post">
					  <option value="Vice President" selected>Vice President</option>
					  <option value="G.Sec Technology">G.Sec Tech</option>
					  <option value="G.Sec Social and Culture">G.Sec Socult</option>
					  <option value="G.Sec Student Welfare">G.Sec Welfare</option>
				</select>
                <textarea class="input-field" name ="Bio" rows = "2" cols ="50">Introduce Yourself</textarea>
                <textarea class="input-field" name ="SOP" rows = "2" cols ="50">Your Statement of Purpose</textarea>
                <input type="text" class="input-field" name ="SOPVid" placeholder="SOP Embed if available else NULL" >
                <input type="text" class="input-field" name ="CGPA" placeholder="Enter your CGPA">
                <input type ="submit" class="submit-btn" value ="Register">
            </form>
        </div>
        <input type ="submit" class="back-btn" value ="Back to Home" onclick=history.back()>
    </div>
</body>
</html>