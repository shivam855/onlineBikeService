<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>payment approval</title>
</head>
<body>
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
	}
}
	catch(Exception e)
    {
		out.println(e);
    }
	%>
<h4><center>Onlie Bike Service Portal</center></h4>
<div class="abc">
<h1><center>Approval for Payment Request </center></h1><hr><br>
<%@page import="java.sql.*" %>
<%
	String id="";
	String str=request.getParameter("tf1");
	String str2=request.getParameter("tf2");
	
 try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst=conn.prepareStatement("Select * from payment where trackid = ?");
	pst.setString(1,str);
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
		id=rs.getString("trackid");
	}
	
	if(str.equals(id))
	{
		 try{
				if(str2.equals("completed"))
				{
				String sql="Update payment set status ='completed' where trackid='"+id+"'";
				PreparedStatement pst1 = conn.prepareStatement(sql);
				pst.setString(1, str2);
				out.println("<h1><center>Request Successfully Completed .</center></h1>");
				pst1.execute();
				}
				else if(str2.equals("incompleted"))
				{
					String sql="delete from payment where trackid='"+id+"'";
					PreparedStatement pst1 = conn.prepareStatement(sql);
					pst.setString(1, str2);
					out.println("<h1><center>Request Rejected.</center></h1>");
					pst1.execute();
				}
		 }
		 catch(Exception e)
		 {
			 out.println(e);
		 }
	}	
	else
	{
		out.println("<h2 style='color: red;'><center>Service request Does'nt Exist!!!!!<br><br>Please Enter Valid Id......... </center></h2>");
	}
	pst.execute(); 
	rs.close();
	pst.close();
 }
catch(Exception e){
	out.println(e);
 }
%>	
    	<br><br><center><a href="AdminPortal.jsp">Admin Page</a></center>	
<br><center><a href="http://localhost:8080/OurProject/AdminPayment.jsp">Next Approval</a></center><br>
</body>
</html>
