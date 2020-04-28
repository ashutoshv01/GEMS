<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CNG</title>
</head>
<body>
    
	<% 
	String oldpwd=request.getParameter("Old"); 
	String newpwd=request.getParameter("New");
	String confpwd=request.getParameter("Confirm");

	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	String roll = session.getAttribute("rollID").toString();
	String match = "select * from voters where rollno ='"+roll+"' ";
	rs = st.executeQuery(match);
	if(!newpwd.equals(confpwd))
	{
		response.sendRedirect("error.jsp");
	}
	else
	{
		if(rs.next())
		{
			if(rs.getString("pass").equals(oldpwd))
			{
				int i= st.executeUpdate("update voters set pass='"+newpwd+"' where rollno ='"+roll+"'");
				response.sendRedirect("successfulevent2.jsp");
			}
			else
			{
				response.sendRedirect("error.jsp");	
			}	
		}
		else
		{
			response.sendRedirect("error.jsp");	
		}		
	}
	%>

</body>
</html>