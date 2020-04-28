<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chat</title>
<link rel ="stylesheet" href = "chat.css">
</head>

<body>
<div class="msger">

<div class="msger-header">
<h2>Common Chat Room</h2>
</div>

<div class="msger-chat">
  
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
Statement st = con.createStatement();
ResultSet rs;
String name = session.getAttribute("username").toString();
String match = "select * from messages";
rs = st.executeQuery(match);
while(rs.next())
{
	if(rs.getString("sender").equals(name))
	{%>
			<div class="msg right-msg">
			<div class="msg-bubble">
			<div class="msg-info">You</div>
			<%=rs.getString("message") %>
			</div>
			</div>
	<%}else{%>
			
			<div class="msg left-msg">
			<div class="msg-bubble">
			<div class="msg-info"><%=rs.getString("sender") %></div>
			<%=rs.getString("message") %>
			</div>
			</div>		
		
	<% }
}
%>

</div>

<form class="msger-inputarea" action="updatemsgs.jsp" method="post" autocomplete="off">
<input type="text" class="msger-input" name ="msg" placeholder="Enter your message...">
<button type="submit" class="msger-send-btn">Send</button>
</form>
<div class ="msger-inputarea">

<%String x = session.getAttribute("iscandi").toString();
	if(x.equals("0"))
	{
	%>
    <center><a href="home.jsp"><button class="msger-leave-btn">Leave</button></a></center>
    <%}else{ %>
	<center><a href="candihome.jsp"><button class="msger-leave-btn">Leave</button></a></center>
	<%}%>
	</div>
</div>  
</body>
</html>