<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Feedback</title>
</head>
<link rel="stylesheet" type="text/css" href="back.css" />
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
<div class="abc">
<h1><center>Feedback Form</center></h1><hr><br>
<pre>
Have a Good jurney and best offluck..  
	<%@page import = "java.sql.*" %>
	<%
	String str="";
	String service = request.getParameter("tf1");
	String facility = request.getParameter("tf2");
	String suggestion = request.getParameter("tf3");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst= conn.prepareStatement("insert into feedback(user_id,service,facility,suggestion) values (?,?,?,?)");	
	pst.setInt(1, 120);
	pst.setString(2, service);
	pst.setString(3, facility);
	pst.setString(4, suggestion);
	pst.execute();
	out.println("<h3>Thanks for your Feedback</h3>");
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>
</pre>
</div>
</body>
</html>




