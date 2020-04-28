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
	String uname=request.getParameter("Name"); 
	String roll=request.getParameter("Roll");
	String hall=request.getParameter("Hall");
	String pass=request.getParameter("Pass");
	String mail=request.getParameter("Email");
	int t=0;
	if(request.getParameter("IsCandi")!=null)
	{
		t=1;
	}
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	String match = "select * from voters where rollno ='"+roll+"' ";
	rs = st.executeQuery(match);
	if(rs.next())
	{
		response.sendRedirect("error.jsp");
	}
	else
	{
		int x =0;
		String s = "null";
		int i= st.executeUpdate("insert into voters values('"+uname+"','"+roll+"','"+hall+"', '"+pass+"' ,'"+mail+"','"+t+"','"+x+"','"+x+"','"+s+"','"+s+"','"+s+"','"+s+"') ");
		response.sendRedirect("successfulevent2.jsp");
	}
	%>

</body>
</html>