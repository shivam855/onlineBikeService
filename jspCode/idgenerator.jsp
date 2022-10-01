<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Id Generator</title>
<link rel="stylesheet" type="text/css" href="back.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<table class="login">
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="login.html" >LOGIN</a></th><tr>
</table>
<h4><center>Online Bike Service Portal</center></h4>
<div class="abc">
<h1><center> New User Id</center></h1><hr><br>
<pre>
 <h3> Hi.. Thanks for the registeration. 
  Your User_id is here...</h3>
<%@page import="java.sql.*" %>
	<%
	String str="";
	String email = (String)session.getAttribute("email");	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst= conn.prepareStatement("select * from cus_details where email=?");	
	pst.setObject(1, email);
	ResultSet pass =  pst.executeQuery();
	while(pass.next())
	{	
		 str = pass.getString("user_id");
		 out.println("<h1> USER Id = "+ str+"</h1>");			
	}
	}
    catch(Exception e)
    {
		out.println(e);
    }
	%>
</pre></div>

</body>
</html>