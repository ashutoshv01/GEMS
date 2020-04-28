<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AddEvents</title>
</head>
<body>
	<% 
	String detail=request.getParameter("Details"); 
	String venue=request.getParameter("Venue");
	String time=request.getParameter("T");
	String date=request.getParameter("Date");
	String candidate = session.getAttribute("username").toString();
	int t=0;
	/*if(request.getParameter("IsRemind")!=null)
	{
		t=1;
	}*/
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	int i = st.executeUpdate("insert into events values('"+candidate+"','"+detail+"','"+time+"','"+date+"', '"+venue+"')");
	response.sendRedirect("successfulevent.jsp");
	%>
</body>
</html>