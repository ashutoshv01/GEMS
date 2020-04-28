<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
Statement st = con.createStatement();
ResultSet rs;
String message = request.getParameter("msg");
String sender = session.getAttribute("username").toString();
int i = st.executeUpdate("insert into messages values('"+sender+"','"+message+"')");
response.sendRedirect("chat.jsp");
%>
</body>
</html>