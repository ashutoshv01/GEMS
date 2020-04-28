<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<%@page import = "java.util.Random"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
</head>
<body>
	<%
	Random rand = new Random();
	int booth = rand.nextInt(10)+1;
	int slot = rand.nextInt(10)+8;
	String b = Integer.toString(booth);
	String xt = Integer.toString(slot);
	String yt = Integer.toString(slot+1);
	String a=session.getAttribute("rollID").toString();
    Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(" select * from slots where rollno = '"+a+"' ");
	if(rs.next())
	{
		b = rs.getString("booth");
		int t = rs.getInt("slot");
		xt = Integer.toString(t);
		yt = Integer.toString(t+1);
	}
	else
	{
		int i = st.executeUpdate("insert into slots values('"+a+"','"+booth+"','"+slot+"')" );
	}
	%>
	<div class ="login">
	<center><h2>YOUR SLOT DETAILS</h2></center><br/>
	<center><h2>These details will be verified by the authorities</h2></center><br/>
	<center><h2>After successful verification you will be given the OTP.</h2></center>
	<div class="tbl-content">
	<table cellpadding="0" cellspacing="0" border="0">
	<tbody>
		<tr><td>ROLL NO:</td><td> <%=a %></td></tr> 
		<tr><td>BOOTH NO:</td><td> <%=b%></td></tr> 
		<tr><td>YOU CAN CAST VOTE FROM TIME(HRS):</td><td> <%=xt %></td></tr> 
		<tr><td>TILL TIME(HRS):</td><td> <%=yt %></td></tr> 
	</tbody>
	</table>
	</div>
	<input type ="submit" class="backbtn" value ="Go Back" onClick = history.back()>
	</div>	
	
</body>
</html>