<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset</title>
<link rel="stylesheet" href="main.css">
</head>
<body>

	<div class ="login">
        <h1 style="text-align:center">Change password</h1>
        <div class="eventform">
        
            <form id ="changepassword" class="eventinput-group" action="chngpwd.jsp" autocomplete="off" method="post">            
                <input type="text" class="input-field" name ="Old" placeholder="Enter the old password" required>             
                <input type="text" class="input-field" name ="New" placeholder="Enter the new password" required>
                <input type="text" class="input-field" name ="Confirm" placeholder="Confirm password" required>
               
                <input type ="submit" class="addeventsbtn" value ="Change password">
            </form>
        </div>
        <input type ="submit" class="back-btn" value ="Back to Home" onclick=history.back()>
    </div>
</body>
</html>