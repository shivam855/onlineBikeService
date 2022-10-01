<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Id Generator</title>
<link rel="stylesheet" type="text/css" href="back.css" />
</head>
<body>
<table class="login">
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="englogin.html" >LOGIN</a></th><tr>
</table>
<%@page import="java.sql.*" %>
<%
	String str=" ";	
	int user_id = 	(Integer)session.getAttribute("user_id");
	String user_name = 	(String)session.getAttribute("user_name");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	out.println("<b><div class=user> USER_ID:"+user_id+"</div></b>");
	out.println("<b><div class=user> USER_ID:"+user_name+"</div></b>");
	session.setAttribute("user_id", user_id);
	session.setAttribute("user_name", user_name);
}
	catch(Exception e)
    {
		out.println(e);
    }
%>	
<h4><center>Online Bike Service Portal</center></h4>
<div class="abc">
<h1><center>Payment Completed</center></h1><hr><br>
Hi.. Thanks requesting on my page.
<br>
			  "Your Tracking_id and Bill is here....
 	<%@page import = "java.sql.*" %>
	<%
	int track_id = (Integer)session.getAttribute("track id");	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst= conn.prepareStatement("select * from payment where trackid=?");	
	pst.setObject(1, track_id);
	ResultSet pass =  pst.executeQuery();
	while(pass.next())
	{	
		str = pass.getString("bill_amt");
	if(pass.getString("status").equals("completed"))
	{
		out.println("<h1>Your Tracking Id = "+track_id+"</h1>"+
			  "<h1>Your Bill  = "+str+"</h1>");
			  session.setAttribute("user_id", user_id);
			  session.setAttribute("user_name", user_name);
	}
	else if(pass.getString("status").equals("incompleted"))
	{
		out.println("<h1> Sorry your service request is rejected</h1>");	
	}
	else{
		out.println("<h1> wait for the approval</h1>");	
		out.println("<a href='paydone.jsp'><button>REFRESH</button></a>");	
	}
	}
	}
	catch(Exception e)
	{
		out.println(e);
	}
	%>
<br><br><center><a class =low href="http://localhost:8080/OurProject/onlinebike.jsp">Customer Page</a></center>	
<br><br>
</body>
</html>




