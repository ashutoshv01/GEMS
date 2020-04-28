<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Favourites</title>
<link rel="stylesheet" href="table.css">
</head>
<body>
<%
	String roll=session.getAttribute("rollID").toString(); 
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	String match = "select * from voters where rollno ='"+roll+"' ";
	rs = st.executeQuery(match);
	if(rs.next())
	{
%>
	<div class ="login">
	<center><h2>YOUR FAVOURITES</h2></center>
	<br/>
	<div class="tbl-content">
	<table cellpadding="0" cellspacing="0" border="0">
	<tbody>
		<tr><td>VICE PRESIDENT:</td><td> <%=rs.getString("favvp") %></td></tr> 
		<tr><td>G.SEC TECHNOLOGY:</td><td> <%=rs.getString("favgt") %></td></tr> 
		<tr><td>G.SEC SOCULT:</td><td> <%=rs.getString("favgs") %></td></tr> 
		<tr><td>G.SEC WELFARE:</td><td> <%=rs.getString("favgw") %></td></tr>
	</tbody>
	</table>
	</div>
	<input type ="submit" class="backbtn" value ="Go Back" onClick = history.back()>
	</div> 
<%} %>
</body>
</html>