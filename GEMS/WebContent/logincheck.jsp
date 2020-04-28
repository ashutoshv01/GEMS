<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Validate</title>
</head> 
<body> 
<% 
	String uname=request.getParameter("username"); 
	String pass=request.getParameter("password"); 
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(" select * from voters where rollno = '"+uname+"' ");
	if(rs.next())
	{
		if( rs.getString(4).equals(pass) ) 
		{
			String name = rs.getString("username");
			String verified = rs.getString(7);
			String iscandi = rs.getString(6);
			session.setAttribute("username",name); 
			session.setAttribute("rollID", uname);
			session.setAttribute("verified", verified);
			session.setAttribute("iscandi", iscandi);
			if( rs.getString(6).equals("0"))
			{
				response.sendRedirect("home.jsp");
			}
			else
			{
				response.sendRedirect("candihome.jsp");
			}
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
%>

</body>
</html>