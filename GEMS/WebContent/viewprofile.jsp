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
<title>Profile</title>
<link rel="stylesheet" href="table.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.0/jquery.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
</head>
<body>
<%
	String uname = request.getParameter("CANDI");
	String roll=session.getAttribute("rollID").toString(); 
	String n = session.getAttribute("username").toString();
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","mypass");
	Statement st = con.createStatement();
	ResultSet rs;
	String match = "select * from candis where username ='"+uname+"' ";
	rs = st.executeQuery(match);
	request.setAttribute("likedto",uname);
	request.setAttribute("likedby",n);
	String l="";
	if(rs.next())
	{
		String post = rs.getString("post");
		l += rs.getString("likes");
%>
	<div class ="login">
	<center><h2>CANDIDATE PROFILE</h2></center>
	<br/>
	<div class="tbl-content">
	<table cellpadding="0" cellspacing="0" border="0">
	<tbody>
		<tr><td>ROLL NO:</td><td> <%=rs.getString("rollno") %></td></tr> 
		<tr><td>NAME:</td><td> <%=rs.getString("username") %></td></tr> 
		<tr><td>CONTESTING FOR THE POST OF:</td><td> <%=rs.getString("post") %></td></tr> 
		<tr><td>CGPA:</td><td> <%=rs.getString("cgpa") %></td></tr> 
		<tr><td>BIO:</td><td> <%=rs.getString("bio") %></td></tr> 
		<tr><td>SOP:</td><td> <%=rs.getString("sop") %></td></tr> 
		<tr><td>WATCH ME HERE:</td>
		<%if(rs.getString("soplink").equals("NULL"))
			{
		%>
		<td>Not Available</td>
		<%}
		else{
		%>
	<td><iframe width="560" height="315" src="<%=rs.getString("soplink") %>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</td><%} %></tr>
		<tr><td>Votes Secured:</td><td> <%=rs.getString("votes") %></td></tr>
	</tbody>
	</table>
	</div>
	<input type ="submit" class="backbtn" value ="Go Back" onClick = history.back()>
	</div>
   
   <%
   	String state1,id1;
   	match = "select * from likes where likedby ='"+n+"' ";
	rs = st.executeQuery(match);
	int check = 0;
	while(rs.next())
	{
		if(rs.getString("likedto").equals(uname))
		{
			check=1;
		}
	}
	if(check==0)
	{%>
		<!--  state1 = "Like";
		id1 = "like-btn";-->
		<button id="like-btn" class="likebtn">Like</button> 
	<% }
	else
	{%>
		<!--  state1 = "Liked";
		id1 = "like-btnd";-->
		<button id="like-btn" class ="likebtnd">Liked</button> 
	<% }
	//request.setAttribute("state1",state1);
	//request.setAttribute("id1",id1);
   %> 
   
   <!--  <button id="${id1}">${state1}</button> <div id ="poslike"><</div>-->
   <div id ="poslike"><%=l %></div>
   <input type="hidden" id="likedto" value="${likedto}">
   <input type="hidden" id="likedby" value="${likedby}"> 
   <script>
       $("#like-btn").click((e)=>{
         e.preventDefault();
         let txt = $("#like-btn").text();
         if (txt == "Like"){
           $("#like-btn").text("Liked");
           var likedto = $("#likedto").val();
           var likedby = $("#likedby").val();
           $("#like-btn").css({'background': 'linear-gradient(to right, #ff80ff,#cc00cc)', 'border': '0','outline': 'none','padding': '10px 30px','border-radius': '10px', 'position' : 'absolute','left' : '1000px','top' : '600px'});

           $.ajax(
               	{
                      type : "post",
                      url : 'uplikes.jsp',
                      dataType : 'json',
                      cache : false,
                      data : { 'likedto':likedto , 'likedby':likedby },
                      success : function(result) {
                    	  var lk = result.likes;
                    	  $("#poslike").text(lk);
                   	}
               	});
         }
         else{
        	 $("#like-btn").text("Like");
        	 var likedto = $("#likedto").val();
             var likedby = $("#likedby").val();
             $("#like-btn").css({'background': 'linear-gradient(to right, #ccffcc,#00ff00)','border': '0','outline': 'none','padding': '10px 30px','border-radius': '10px','position' : 'absolute','left' : '1000px','top' : '600px'});
             $.ajax(
                    	{
                           type : "post",
                           url : 'downlikes.jsp',
                           dataType : 'json',
                           cache : false,
                           data : { 'likedto':likedto , 'likedby':likedby },
                           success : function(result) {
                         	  var lk = result.likes;
                         	  $("#poslike").text(lk);
                        	}
                    	});
		}
       });
    </script>
    <div id="result1"></div>
 
   <%
   	String state,id;
   	match = "select * from voters where rollno ='"+roll+"' ";
	rs = st.executeQuery(match);
	if(rs.next())
	{
		String fav1 = rs.getString("favvp");
		String fav2 = rs.getString("favgt");
		String fav3 = rs.getString("favgs");
		String fav4 = rs.getString("favgw");
		if(uname.equals(fav1) || uname.equals(fav2) || uname.equals(fav3) || uname.equals(fav4) )
		{
			state = "Marked as Favourite";
			id = "favd";
		}
		else
		{
			state = "Mark as Favourite";
			id = "fav";
		}
		request.setAttribute("state",state);
		request.setAttribute("id",id);
		request.setAttribute("favname",uname);
		request.setAttribute("post",post);
	}
   %> 
   <button id="${id}">${state}</button>
   <input type="hidden" id="favname" value="${favname}">
   <input type="hidden" id="post" value="${post}">
   <script>
       $("#fav").click((e)=>{
         e.preventDefault();
         let txt = $("#fav").text();
         if (txt == "Mark as Favourite"){
           $("#fav").text("Marked as Favourite");
           var Favname = $("#favname").val();
           var Post = $("#post").val();
           $("#fav").css({'background': 'linear-gradient(to right, #ff80ff,#cc00cc)', 'border': '0','outline': 'none','padding': '10px 30px','border-radius': '10px', 'position' : 'absolute','left' : '400px','top' : '600px'});
           $.ajax(
        	{
               type : "post",
               url : 'updatefav.jsp',
               dataType : 'json',
               cache : false,
               data : { 'favname':Favname , 'post':Post },
               success : function() {
            	   
            	}
        	});
               
         }//else{
           //$("#fav").text("Mark as Favourite");
           //$("#fav").css({'background': 'linear-gradient(to right, #ccffcc,#00ff00)','border': '0','outline': 'none','padding': '10px 30px','border-radius': '10px','position' : 'absolute','left' : '400px','top' : '600px'});
           
         //}
       });
    </script>
    
    
	</body>
	
<%} %>

</html>