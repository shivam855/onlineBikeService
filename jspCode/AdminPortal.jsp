<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Admin Portal </title>
<script src="validation.js"></script>
<link rel="stylesheet" type="text/css" href="back.css" />
</head>
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
	session.setAttribute("admin_id",admin_id);
	}
}
	catch(Exception e)
    {
		out.println(e);
    }
	%>
<h4><center>Online Bike Service Portal</center></h4>
<div class=abc>
<h1><center>Admin Portal</center></h1><hr><br>	
<table class=detail>
<tr>
<th><a href="ServiceRequest.jsp"><button>Customer Request</button></a></th>  <th><a href="ServiceEngineer.jsp"><button>Service_Engineer request</button></a></th>
<th><a href="AdminPayment.jsp"><button>Payment Request</button></a></th></tr><tr><td></td> <th><a href="mapping.jsp"><button>Mapping</button></a></th>
</tr>
</table>
<br><br>
</div>
</body>
</html>