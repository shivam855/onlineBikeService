<!DOCTYPE html>
<html>
<head>
<title>Welcome User</title>
</head>
<style>	
body{
	margin-top:5px;
 	color:black;
 	font-size:15px;
 	background-size: 100%;
 	background-image: url(img.png);
 	background-repeat: no-repeat;
 	background-size:100% 100%;
 	}
 	 h3{
  text-align:center;
  font-family: monospace;
  background-color : blue;
  color:white;
  padding:8px; 
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
 h4
{
	background-color: lightblue;
	font-size: 40px;
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
<div class="abc">
	

<%@page import="java.sql.*" %>
<%

 try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	String sql = "select * from payment";
	PreparedStatement pst = conn.prepareStatement(sql);
	ResultSet rs=pst.executeQuery();
	out.println("<center><h3  style='color:black ;font-size:25px;'>Customer Payment Done</h3></center>");
	out.println("<table border = 4 bgcolor=lightGray style='height: 80%; width: 100% ;'>");
	out.println("<thead><th>Track ID</th><th>Bill Amount</th><th>Payment Mode</th><th>Debit Number</th><th>CVV</th><th>Expiry Date</th></thead>");

	while(rs.next())
	{
	out.print("<tr style='text-align:center;'>");
	out.print("<td>  "+rs.getString("trackid")+"  "+"</td>");
	out.print("<td>  "+rs.getString("bill_amt")+"  "+"</td>");
	out.print("<td>  "+rs.getString("paymod")+"  "+"</td>");
	out.print("<td>  "+rs.getString("debitnum")+"  "+"</td>");
	out.print("<td>  "+rs.getString("cvv")+"  "+"</td>");
	out.print("<td>  "+rs.getString("exp_date")+"  "+"</td></tr>");
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

    		<br><center><font size=4px><a href="AdminPortal.jsp">Back to AdminPortal </a></font></center>
</body>
</html>