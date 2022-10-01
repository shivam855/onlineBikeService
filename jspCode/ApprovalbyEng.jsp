<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Service Request</title>
<link rel="stylesheet" type="text/css" href="back.css" />
</head>	
<body>
<table class=login>
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="adlogin.html" >LOGOUT</a></th><tr>
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
<div class="abc">
<h1><center>Status By Engineer Service Request </center></h1><hr><br>
<pre>
<form action="http://localhost:8080/OurProject/engStatusApproval.jsp" method=get><font size=4px>
   <%@page import="java.sql.*" %>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst=conn.prepareStatement("select * from service where eng_id=?");
	pst.setInt(1,eng_id);
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
<br><b> Approval         :<input type=radio name=tf2 value="completed" />Completed <input type=radio name=tf2 value="incompleted" />InCompleted<input type=radio name=tf2 value="Panding" />Panding<br>
      
    <center><button type=submit name=submit value=SUBMIT>Submit</button></center>  
    
    		<br><br><center><h6><a href="engineerBase.jsp">Back to Engineer Portal </a></h6></center>
                    
</form>
</pre></div>
</body>
</html>