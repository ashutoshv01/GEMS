<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@page import = "java.sql.*"%>
<%@page import = "javax.sql.*"%>
<%@page import = "java.util.Random"%>
<html>   
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<%
	String result;
    String a=session.getAttribute("rollID").toString();
    Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(" select * from voters where rollno = '"+a+"' ");
	String email = "";
	if(rs.next())
	{
		email = rs.getString(5);
	}
	else
	{
		response.sendRedirect("error.jsp");
	}
	Random rand = new Random();
	int OTP = rand.nextInt(9999);
	session.setAttribute("otp",OTP);
	final String to = email;
    final String subject = "OTP Confirmation";
    final String messg = "Hi, your OTP for Gymkhana Election Management System verification is "+OTP;
    final String from = "gemsiitkgp@gmail.com";
    final String pass = "********";   //Enter passsword
    String host = "smtp.gmail.com";
    Properties props = new Properties();
    props.put("mail.host", host);
    props.put("mail.user", from);
    props.put("mail.smtp.password", pass);
    props.put("mail.defaultEncoding", "UTF-8");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.required", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    props.put("mail.smtp.socketFactory.fallback", "true");
    props.put("mail.smtp.port", "587");
    props.put("mail.smtp.socketFactory.port", "465");
    props.setProperty("mail.smtp.ssl.trust", host);
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });

    try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        message.setSubject(subject);
        message.setText(messg);
        Transport.send(message);%>
    <% } catch (MessagingException mex) {
        mex.printStackTrace();
        response.sendRedirect("error.jsp");
    }
%>

	<div class ="login">
        <h1 style="text-align:center">Confirm OTP</h1><br/>
        <h2 style="text-align:center">Sent to your registered mail ID</h2>
        <div class="eventform">
        
            <form id ="changepassword" class="eventinput-group" action="validate.jsp" autocomplete="off" method="post">            
                <input type="text" class="input-field" name ="OTPEnter" placeholder="Enter the OTP" required>             
                <input type ="submit" class="addeventsbtn" value ="Verify">
            </form>
        </div>
        <input type ="submit" class="back-btn" value ="Back to Home" onclick=history.back()>
    </div>
</body>
</html>
