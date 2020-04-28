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
	String post=request.getParameter("Post"); 
	String bio=request.getParameter("Bio");
	String sop=request.getParameter("SOP");
	String link=request.getParameter("SOPVid");
	String cg=request.getParameter("CGPA");
	String roll = session.getAttribute("rollID").toString();
	String uname = session.getAttribute("username").toString();
	int ld=0;
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	String match = "select * from candis where rollno ='"+roll+"' ";
	rs = st.executeQuery(match);
	if(rs.next())
	{
		int i= st.executeUpdate("update candis set bio ='"+bio+"',post ='"+post+"',sop ='"+sop+"',soplink ='"+link+"',cgpa ='"+cg+"' where rollno ='"+roll+"'");
		response.sendRedirect("successfulevent.jsp");
	}
	else
	{
		int i= st.executeUpdate("insert into candis values('"+uname+"','"+roll+"','"+bio+"', '"+post+"' ,'"+sop+"','"+link+"','"+cg+"','"+ld+"','"+ld+"') ");
		response.sendRedirect("successfulevent.jsp");
	}
	%>

</body>
</html>