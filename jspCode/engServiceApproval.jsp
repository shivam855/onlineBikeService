<!DOCTYPE html>
<html>
<head>
<title>Welcome User</title>
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
 	background-size:100% ; 
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
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="englogin.html" >LOGOUT</a></th><tr>
</table><br />
<%@page import="java.sql.*" %>
<%
	String name="";	
	int eng_id = 	(Integer)session.getAttribute("eng_id");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/engineer", "root", "mysql");
	PreparedStatement pst = conn.prepareStatement("select * from registeration where eng_id=?");
	pst.setInt(1,eng_id);
	pst.execute();
	ResultSet rs = pst.executeQuery();
	while(rs.next())
	{
	out.println("<b><div class=user> Ser_Eng_ID   :"+eng_id+"</div></b>");
	out.println("<b><div class=user> Eng_NAME :"+rs.getString("name")+"</div></b>");
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
	PreparedStatement pst = conn.prepareStatement("select * from service where eng_id=?");
	pst.setInt(1,eng_id);
	pst.execute();
	ResultSet rs=pst.executeQuery();
	out.println("<center><h2>Engineer service Request</h2></center>");
	out.println("<table border = 4 bgcolor=lightGray style='height: 80%; width: 100% ;'>");
	out.println("<thead><th>Track ID</th><th>User ID</th><th>Engineer ID</th><th>Bike Name</th><th>Status</th></thead>");
	
	while(rs.next())
	{
	if(rs.getString("status").equals("completed"))
	{
		PreparedStatement pst2 = conn.prepareStatement("update service set status='completed'");
		pst2.execute();
	}
	else if(rs.getString("status").equals("panding"))
	{
		out.print("<tr style='text-align:center;'><td> "+rs.getInt("track_id")+"  "+"</td>");
		out.print("<td>  "+ rs.getInt("user_id")+" " +"</td>");
		out.print("<td>  "+ eng_id +"</td>");
		out.print("<td>  "+rs.getString("bike_name")+"  "+"</td>");
		out.print("<td>  "+rs.getString("status")+"  "+"</td>");
		out.print("<td>  "+rs.getString("approval")+"  "+"</td>");
	}
	else if(rs.getString("status").equals("incompleted"))
	{
		PreparedStatement pst1 = conn.prepareStatement("delete from service where eng_id=?");
		pst1.setInt(1,eng_id);
		pst1.execute();
	}	
	}
	out.println("</table>");
	pst.execute(); 	
	out.println("<h3><b>Give Approval for this Tracking Id <a href='ApprovalbyEng.jsp'>Track Id</a></b></h3>");		
	rs.close();
	pst.close();
 }
catch(Exception e){
	out.println(e);
 }
%>
<br><br><center><a class=low href="engineerBase.jsp"> Back to Engineer Portal</a></center>
</body>
</html>