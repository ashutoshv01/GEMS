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
<title>View Candidates</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
		Statement st = con.createStatement();
		ResultSet rs;
		String match = "select * from candis ";
		rs = st.executeQuery(match);
		int i =0;
		List<String> l1 = new ArrayList<String>();
		while(rs.next())
		{
			String s = rs.getString("username");
			l1.add(i,s);
			i = i+1;
		}
		request.setAttribute("l1",l1);
	%>
	<div class ="login">
        <h1 style="text-align:center">Select a Candidate</h1>
        <div class="eventform">
            <form id ="findcandi" class="eventinput-group" action="viewprofile.jsp" autocomplete="off" method="post">
				<select class="input-field" name="CANDI">
					<c:forEach items="${l1}" var="name">
        				<option value="${name}">${name}</option>
    				</c:forEach>
				</select>			  
                <input type ="submit" class="submit-btn" value ="View Profile">
            </form>
        </div>
        <input type ="submit" class="back-btn" value ="Back to Home" onclick=history.back()>
    </div>
</body>
</html>