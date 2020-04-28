<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<%@page import = "java.io.*"%>
<%@page import = "com.google.gson.*" %>
<% 
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
Statement st = con.createStatement();
String likedto= request.getParameter("likedto");
String likedby = request.getParameter("likedby");
ResultSet rs;
String match = "select * from candis where username ='"+likedto+"' ";
rs = st.executeQuery(match);
int likes = 0;
if(rs.next())
{
	likes = rs.getInt("likes");
	likes = likes+1;
	int i= st.executeUpdate("update candis set likes='"+likes+"' where username ='"+likedto+"'");
}
int j= st.executeUpdate("insert into likes values('"+likedto+"','"+likedby+"')" );
response.setContentType("application/json; charset=UTF-8");
String x = Integer.toString(likes);
JsonObject X = new JsonObject();
X.addProperty("likes",x);
response.getWriter().write(X.toString());
%>