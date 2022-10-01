<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Request</title>
<link rel="stylesheet" type="text/css" href="back.css" />
<script src="serviceValidation.js"></script>
</head>
<body>
<table class="login">
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="login.html" >LOGOUT</a></th><tr>
</table>
<%@page import="java.sql.*" %>
<%
	String str=" ";	
	int user_id = 	(Integer)session.getAttribute("user_id");
	String user_name = (String)session.getAttribute("user_name");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	out.println("<b><div class=user> USER_ID:"+user_id+"</div></b>");
	out.println("<b><div class=user> USER_NAME:"+user_name+"</div></b>");
	session.setAttribute("user_name", user_name);
	}
	catch(Exception e)
    {
		out.println(e);
    }
	%>
<br>	
<h4><center>Online Bike Service Portal</center></h4>	
<div class="abc">
<h1><center>Service Request Table</center></h1><hr><br>
<pre>
<form name="myform" action=service.jsp method=get onsubmit="return validateform()"> 
   <b> Bike Name     :<select name="tf1" required="required">
   <option></option>
   <option value="Hero Honda"> HERO HONDA </option>
   <option value="Yamaha"> YAMAHA </option>
   <option value="Bajaj"> BAJAJ </option>
   <option value="Tvs"> TVS </option>
   </select> <br><br></b>   
   <b> Bike Model    :<input type=text name=tf2  required="required"/><br><br></b>
   <b> Service Type  :  <input type="radio" name=tf3 value="silver" required="required"/> SILVER <input type="radio" value="gold" name=tf3 /> GOLD <input type="radio" value="premium" name=tf3 /> PRIMIOUM <br><br></b>
   <b> Services      :<select name="tf4" required="required">
   <option></option>
   <option value="Engine Service"> ENGINE SERVICE </option>
   <option value="Light"> LIGHT REPAIRING </option>
   <option value="Tube and Tire"> TUBE AND TIRE SERVICE </option>
   <option value="Color"> COLOR UPGRADE </option>
   </select> <br><br></b>   
      
    <center><button type=submit name=submit value=SUBMIT>Submit</button></center>                  
</form>
</pre></div>
</body>
</html>