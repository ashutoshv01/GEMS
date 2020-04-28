<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logged Out</title>
</head>
<body>
	<%
		if (session.getAttribute("username")==null)
		{
			response.sendRedirect("index.html");
		}
		else{
			session.removeAttribute("username");
	    	session.removeAttribute("rollID");
	    	session.removeAttribute("verified");
			session.removeAttribute("iscandi");
	    	session.invalidate();
	    	response.sendRedirect("index.html");
		}
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		System.out.println("x");
    %>
</body>
</html>