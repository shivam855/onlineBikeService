<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Service Eng. Portal</title>
<link rel="stylesheet" type="text/css" href="back.css" />
</head>
<table class="login">
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="englogin.html" >LOGOUT</a></th></tr>
</table>
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
	
<body>
<h4><center>Online Bike Service Portal</center></h4>
<div class=abc>
<h1><center>Enigneer Portal</center></h1><hr><br>	
<center><table class=detail>
<tr>
<th><a href="engServiceApproval.jsp"><button>Vehicle Status</button></a></th>
</tr>
</table>
</center>
<p><h2>&nbsp &nbsp   Vehicle Status</h2></p>
<p>The content on this portal is meant for sharing information regarding vehicles on the basis of information available on centralized VAHAN and vehicle National ...
</p>
<br><br>
</div>
</body>
</html>