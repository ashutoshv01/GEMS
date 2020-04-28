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
String roll=session.getAttribute("rollID").toString(); 
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
Statement st = con.createStatement();
String post= request.getParameter("post");
String uname = request.getParameter("favname");
if(post.equals("Vice President"))
{
	int i= st.executeUpdate("update voters set favvp='"+uname+"' where rollno ='"+roll+"'");
}

if(post.equals("G.Sec Technology"))
{
    int i= st.executeUpdate("update voters set favgt='"+uname+"' where rollno ='"+roll+"'");
}
           
if(post.equals("G.Sec Social and Culture"))
{
    int i= st.executeUpdate("update voters set favgs='"+uname+"' where rollno ='"+roll+"'");
}
           
if(post.equals("G.Sec Student Welfare"))
{
   	int i= st.executeUpdate("update voters set favgw='"+uname+"' where rollno ='"+roll+"'");
}
%> 
</body>
</html>