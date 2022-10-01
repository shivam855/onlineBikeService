<!DOCTYPE html>
<html>
<head>
<title>Welcome User</title>
</head>
<style>	
body{
	margin-left: 2px;
	margin-right: 2px;
	margin-top:5px;
 	color:black;
 	font-size:18px;
 	background-size: 100%;
 	background-image: url(img.png);
 	background-repeat: no-repeat;
 	background-size:100% 100%; 
 	}
 h2{
  text-align:center;
  font-family: monospace;
  background-color : blue;
  color:white;
  padding:8px;
  
 }
 h4
{
	background-color: lightblue;
	font-size: 40px;
}
 a.hover{
 	border:3px solid black;
	background-color: #138496;	
}
.login
{
	margin-top:0px;
	font-size:15px;
	margin-left:85%;
	background-color: yellow;
} 
.user
{
	font-size:18px;
	margin-left:85%;
	margin-top:5px;
}
.mno
{
font-size: 20px;
}
</style>
<body>
<table class=login>
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="adlogin.html" >LOGOUT</a></th><tr>
</table><br />
<%@page import="java.sql.*" %>
<%
	String name="";	
	int admin_id = 	(Integer)session.getAttribute("admin_id");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst = conn.prepareStatement("select * from admin_details");
	ResultSet rs = pst.executeQuery();
	while(rs.next())
	{
	out.println("<b><div class=user> ADMIN_ID   :"+admin_id+"</div></b>");
	out.println("<b><div class=user> ADMIN_NAME :"+rs.getString("name")+"</div></b>");
	}
}
	catch(Exception e)
    {
		out.println(e);
    }
	%>
	
<h4><center>Online Bike Service Portal</center></h4>
<div class=abc>
<%@page import="java.sql.*" %>
<%

 try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	String sql = "select * from cus_details";
	PreparedStatement pst = conn.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	out.println("<center><h2>Customer Details</h2></center>");
	out.println("<table border = 4 bgcolor=lightGray style='height: 80%; width: 100% ;'>");
	out.println("<thead><th>User ID</th><th>Name</th><th>Email ID</th><th>Phone No.</th><th>Adhaar No</th><th>Address</th><th>City</th><th>State</th></thead>");

	while(rs.next())
	{
	out.print("<tr style='text-align:center;'><td> "+rs.getString("user_Id")+"  "+"</td>");
	out.print("<td>  "+rs.getString("name")+"  "+"</td>");
	out.print("<td>  "+rs.getString("email")+"  "+"</td>");
	out.print("<td>  "+rs.getString("phone")+"  "+"</td>");
	out.print("<td>  "+rs.getString("adhaar")+"  "+"</td>");
	out.print("<td>  "+rs.getString("address")+"  "+"</td>");
	out.print("<td>  "+rs.getString("city")+"  "+"</td>");
	out.print("<td>  "+rs.getString("state")+"  "+"</td></tr></h4>");
	}
	
	out.println("</table>");
	pst.execute(); 
			
	rs.close();
	pst.close();
 }
catch(Exception e){
	out.println(e);
 }
%>

<br><br><center><a href="http://localhost:8080/OurProject/AdminPortal.jsp">Admin Portal</a></center>
</body>
</html>