<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>

	<% 
	String reminder=request.getParameter("removal");
	String roll=session.getAttribute("rollID").toString();
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	String match = "select * from reminders where event ='"+reminder+"' and rollno='"+roll+"' ";
	rs = st.executeQuery(match);
	if(rs.next())
	{
		int i= st.executeUpdate("delete from reminders where rollno = '"+roll+"' and event = '"+reminder+"' ");
		response.sendRedirect("successfulevent.jsp");
	}
	else
	{
		response.sendRedirect("error.jsp");
	}
	%>

</body>
</html>