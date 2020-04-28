<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<%@page import = "java.util.*"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="main.css">
<link rel="stylesheet" href="methods.css">
</head>
<body>
	<div class ="login">
	<br/><br/><br/><br/><br/> 
	<h1 class = "welcome"> 
	<% 
		String verify = "";
		if (session.getAttribute("username")==null)
		{
			response.sendRedirect("index.html");
		}
		else
		{
			String a=session.getAttribute("username").toString(); 
			out.println("Welcome "+a);
			verify = verify + session.getAttribute("verified").toString();
			String roll = session.getAttribute("rollID").toString();
			Class.forName("com.mysql.jdbc.Driver");
			java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
			Statement st = con.createStatement();
			ResultSet rs;
			String match = "select * from reminders where rollno = '"+roll+"' ";
			rs = st.executeQuery(match);
			while(rs.next())
			{
				String s = rs.getString("event");
				request.setAttribute("l1",s);
				%>
				<script>
				var message = 'REMINDER: ${l1}';
				console.log(message);
				alert(message);
				</script>
			<%}
		}
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		%>
	</h1> 
	<marquee width="100%" height="100px"><h3><b>The voting procedure has started and will continue till 8pm today.</b></h3></marquee>
	<br/> <br/> <br/><br/><br/><br/><br/> 
	<div class="logout"><a href="logout.jsp"><input type ="submit" class="methods" value ="Logout"></a></div>
	<div class="chngpwd"><a href="chngpwdfront.jsp"><input type ="submit" class="methods" value ="Change Password"></a></div>
	
		<% if(verify.equals("1"))
		{
	%> 
	<div class="viewevent"><a href="viewevents.jsp"><input type ="submit" value ="View Events" class ="methods"></a></div>
	<div class="verify"><a href="sendotp.jsp"><input type ="submit" value ="Verify Account" class="methods"></a></div>
	<div class="viewcandi"><a href="viewcandidates.jsp"><input type ="submit" value ="View Candidates" class="methods"></a></div>
	<div class="vote"><a href="voterverification.jsp"><input type ="submit" value ="Cast Vote" class="methods"></a></div>
	<div class="slot"><a href="slotregistration.jsp"><input type ="submit" value ="Get your slot" class="methods"></a></div>
	<div class="favs"><a href="viewfavs.jsp"><input type ="submit" value ="View your favourites" class="methods"></a></div>
	<div class="chat"><a href="chat.jsp"><input type ="submit" value ="Chat with the candidates" class="methods"></a></div>
	<div class="remind"><a href="reminder.jsp"><input type ="submit" value ="Add reminders" class="methods"></a></div>
	<div class="remove"><a href="remove.jsp"><input type ="submit" value ="Remove reminders" class="methods"></a></div>
	</div><%}
		else
		{%>
		<center><h2>You need to verify your account first!.</h2></center>
			<div class="verify"><a href="sendotp.jsp"><input type ="submit" value ="Verify Account" class="methods"></a></div>
		<%}
		%>	
		
		
	<%
	//String roll = session.getAttribute("rollID").toString();
	//Class.forName("com.mysql.jdbc.Driver");
	//java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	//Statement st = con.createStatement();
	//ResultSet rs;
	//String match = "select * from reminders where rollno = '"+roll+"' ";
	//rs = st.executeQuery(match);
	//while(rs.next())
	//{
	//	String s = rs.getString("event");
	//	request.setAttribute("l1",s);
	%>
		<script>
		//var message = 'REMINDER: ${l1}';
		//console.log(message);
		//alert(message);
		</script>
	<%//}%>
	
</body>
</html>