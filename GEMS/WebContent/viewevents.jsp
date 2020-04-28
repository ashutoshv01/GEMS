<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Events</title>
<link rel="stylesheet" href="table.css">
</head>
<body>

	<h1>List of Events</h1>
	
	  <div class="tbl-header">
	    <table cellpadding="0" cellspacing="0" border="0">
	      <thead>
	        <tr>
	        	<th>Candidate</th>	        	
		      	<th>Details</th>
		        <th>Venue</th>
		        <th>Date</th>
		        <th>Time</th>
	        </tr>
	      </thead>
	    </table>
	  </div>
	  
	<div class="tbl-content">
	<table cellpadding="0" cellspacing="0" border="0">
	<tbody>
	  
	<%
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	
	rs = st.executeQuery("select * from events order by d desc,t desc");
	while(rs.next())
	{
	%>	
		        <tr>
		          <td><%=rs.getString("candi") %></td>
		          <td><%=rs.getString("details")%></td>
		          <td><%= rs.getString("venue")%> </td>
		          <td><%= rs.getString("d")%> </td>
		          <td><%= rs.getString("t").substring(0,5)%></td>
		        </tr>		
	<% 	
	}
	%>
	
	</tbody>
	</table>
	</div>
	
<input type ="submit" class="backbtn" value ="Back to Home" onClick = history.back()>

<script type="text/javascript">
// '.tbl-content' consumed little space for vertical scrollbar, scrollbar width depend on browser/os/platfrom. Here calculate the scollbar width .
$(window).on("load resize ", function() {
  var scrollWidth = $('.tbl-content').width() - $('.tbl-content table').width();
  $('.tbl-header').css({'padding-right':scrollWidth});
}).resize();	
</script>
	
</body>
</html>