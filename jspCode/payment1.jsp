<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
<link rel="stylesheet" type="text/css" href="back.css" />
<script src="paymentvalidate.js"></script>
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
<h1><center>Payment Paying Mode</center></h1><hr><br>
<pre>
<form action="payment.jsp" method=get name="myform" onsubmit="return validateform()">
<%@page import="java.sql.*" %>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst=conn.prepareStatement("select * from service where user_id=?");
	pst.setInt(1,user_id);
	pst.execute();
	ResultSet rs=pst.executeQuery();
	out.println(" <b>Tracking Id     :<select style='width: 320px;' name=tf6 />");
	while(rs.next())
	{
		out.println("<option value="+rs.getInt("track_id")+">" +rs.getInt("track_id")	+"	</option>");
	}
	out.println("</select></b>");
}
catch(Exception e){
	out.println(e);
 }
%>	
<b> Bill_Amount     :<input type=text name=tf1 required="required" /><br><br></b>
<b> Paying_Mode     : <input type="radio" name=tf2 required="required" onclick="online()" style="height:25px; width:25px; vertical-align: middle;" value="online"/> Online   <input type="radio" name=tf2 onclick="offline()" style="height:25px; width:25px; vertical-align: middle;" value="online"/>  Offline<br><br></b>
  	<script>
  		function online()
  		{
  			alert("plz enter all details carefully");
  		}
  		function offline()
  		{
  			alert("wait upto completing the services");
  		}	
  	</script>
<b> Debit_Number    :<input type=text name=tf3 required="required"/><br><br></b>
<b> CVV		 :<input type=text name=tf4 required="required"/><br><br></b>
<b> Expiry Date     :<input type=text name=tf5   required="required"/><br><br></b>
      
    <center><button type=submit name=submit value=SUBMIT>Submit</button></center>                  
</form>
</pre></div>
</body>
</html>