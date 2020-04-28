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
		String p1 = "Vice President";
		String p2 = "G.Sec Technology";
		String p3 = "G.Sec Social and Culture";
		String p4 = "G.Sec Student Welfare";
		String match;
		int i;
		
		match = "select * from candis where post = '"+p1+"'  ";
		rs = st.executeQuery(match);
		i =0;
		List<String> l1 = new ArrayList<String>();
		while(rs.next())
		{
			String s = rs.getString("username");
			l1.add(i,s);
			i = i+1;
		}
		match = "select * from candis where post = '"+p2+"'  ";
		rs = st.executeQuery(match);
		i =0;
		List<String> l2 = new ArrayList<String>();
		while(rs.next())
		{
			String s = rs.getString("username");
			l2.add(i,s);
			i = i+1;
		}
		match = "select * from candis where post = '"+p3+"'  ";
		rs = st.executeQuery(match);
		i =0;
		List<String> l3 = new ArrayList<String>();
		while(rs.next())
		{
			String s = rs.getString("username");
			l3.add(i,s);
			i = i+1;
		}
		match = "select * from candis where post = '"+p4+"'  ";
		rs = st.executeQuery(match);
		i =0;
		List<String> l4 = new ArrayList<String>();
		while(rs.next())
		{
			String s = rs.getString("username");
			l4.add(i,s);
			i = i+1;
		}
		request.setAttribute("l1",l1);
		request.setAttribute("l2",l2);
		request.setAttribute("l3",l3);
		request.setAttribute("l4",l4);
	%>
	<div class ="login">
        <h1 style="text-align:center">Select a Candidate</h1>
        <div class="eventform">
            <form id ="findcandi" class="eventinput-group" action="updatevotes.jsp" autocomplete="off" method="post">
				Vice President
				<select class="input-field" name="CANDI1">
					<c:forEach items="${l1}" var="name1">
        				<option value="${name1}">${name1}</option>
    				</c:forEach>
				</select>
				G.Sec Tech
				<select class="input-field" name="CANDI2">
					<c:forEach items="${l2}" var="name2">
        				<option value="${name2}">${name2}</option>
    				</c:forEach>
				</select>
				G.Sec Socult
				<select class="input-field" name="CANDI3">
					<c:forEach items="${l3}" var="name3">
        				<option value="${name3}">${name3}</option>
    				</c:forEach>
				</select>
				G.Sec Welfare
				<select class="input-field" name="CANDI4">
					<c:forEach items="${l4}" var="name4">
        				<option value="${name4}">${name4}</option>
    				</c:forEach>
				</select>			  
                <input type ="submit" class="submit-btn" value ="Vote">
            </form>
        </div>
        <input type ="submit" class="back-btn" value ="Back to Home" onclick=history.back()>
    </div>
</body>
</html>