<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
<link rel="stylesheet" href="main.css">
</head>
<body>

	<div class ="login">
	
	<br></br>
	<br></br>
	<h2 style="text-align:center">Success!</h2>
	<br></br>
	<%String x = session.getAttribute("iscandi").toString();
	if(x.equals("0"))
	{
	%>
    <a href="home.jsp"><input type ="submit" class="reset" value ="Home" ></a>
    <%}else{ %>
	<a href="candihome.jsp"><input type ="submit" class="reset" value ="Home" ></a>
	<%}%>
	</div>
	
	
</body>
</html>