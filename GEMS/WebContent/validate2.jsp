<%@page import = "javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String otp=session.getAttribute("otp").toString();
	String roll=session.getAttribute("rollID").toString();
	String value=request.getParameter("OTPEnter");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(" select * from voters where rollno = '"+roll+"' ");
	if(otp.equals(value))
	{
		if(rs.next())
		{
			int x = 1;
			int i= st.executeUpdate("update voters set isverified='"+x+"' where rollno ='"+roll+"'");
			response.sendRedirect("vote.jsp");
		}
		else
		{
			response.sendRedirect("error.jsp");
		}
	}
	else
	{
		response.sendRedirect("error.jsp");
	}
	%>
</body>
</html>