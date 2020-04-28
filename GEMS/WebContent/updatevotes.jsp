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
String vp=request.getParameter("CANDI1"); 
String gt=request.getParameter("CANDI2");
String gs=request.getParameter("CANDI3");
String gw=request.getParameter("CANDI4");
String roll = session.getAttribute("rollID").toString();
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
Statement st = con.createStatement();
ResultSet rs;
String match;
match = "select * from voters where rollno ='"+roll+"' ";
rs = st.executeQuery(match);
if(rs.next())
{
	if(rs.getString("isvoted").equals("0"))
	{
		int x =1;
		int i= st.executeUpdate("update voters set isvoted='"+x+"' where rollno ='"+roll+"'");
		
		match = "select * from candis where username ='"+vp+"' ";
		rs = st.executeQuery(match);
		if(rs.next())
		{
			x = rs.getInt("votes");
			x = x+1;
			i= st.executeUpdate("update candis set votes='"+x+"' where username ='"+vp+"'");
		}

		match = "select * from candis where username ='"+gt+"' ";
		rs = st.executeQuery(match);
		if(rs.next())
		{
			x = rs.getInt("votes");
			x = x+1;
			i= st.executeUpdate("update candis set votes='"+x+"' where username ='"+gt+"'");
		}

		match = "select * from candis where username ='"+gs+"' ";
		rs = st.executeQuery(match);
		if(rs.next())
		{
			x = rs.getInt("votes");
			x = x+1;
			i= st.executeUpdate("update candis set votes='"+x+"' where username ='"+gs+"'");
		}

		match = "select * from candis where username ='"+gw+"' ";
		rs = st.executeQuery(match);
		if(rs.next())
		{
			x = rs.getInt("votes");
			x = x+1;
			i= st.executeUpdate("update candis set votes='"+x+"' where username ='"+gw+"'");
		}
		response.sendRedirect("successfulevent.jsp");
	}
	else
	{
		response.sendRedirect("error.jsp");	
	}	
}


%>

</body>
</html>