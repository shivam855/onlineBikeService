<html>
<head>
<link rel="stylesheet" type="text/css" href="back.css" />
<title>Mapping</title>
</head>
<body><table class=login>
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="adlogin.html" >LOGOUT</a></th><tr>
</table><br />
<%@page import="java.sql.*" %>
<%
	String name="";	
	int admin_id = (Integer)session.getAttribute("admin_id");
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
</head>
<body>
<div class=abc>
<h1><center  style="font-size: 25px;">Mapping Customer Request And Service Engineer </center></h1><hr>
<pre>
<form action=mappingApproval.jsp method=get> <center>
<%@page import="java.sql.*" %>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst=conn.prepareStatement("select * from service");
	ResultSet rs=pst.executeQuery();
	out.println("Tracking Id : <select style='width: 250px;' name=tf1 />");
	while(rs.next())
	{
		out.println("<option value="+rs.getInt("track_id")+">" +rs.getInt("track_id")	+"	</option>");
	}
	out.println("</select>");
	out.println("User Id : <select style='width: 100px;' name=tf2 />");
	ResultSet rs2=pst.executeQuery();
	while(rs2.next())
	{
		out.println("<option value="+rs2.getInt("user_id")+">" +rs2.getInt("user_id")	+"	</option>");
	}
	out.println("</select>");
	Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/engineer", "root", "mysql");
	PreparedStatement ps1=conn1.prepareStatement("select * from registeration");
	ResultSet rs1=ps1.executeQuery();
	out.println("Service Engineer Id : <select style='width: 100px;' name=tf3 />");	
	while(rs1.next())
	{
		out.println("<option value="+rs1.getInt("eng_id")+">" +rs1.getInt("eng_id")	+"	</option>");
	}
	out.println("</select>");
}
catch(Exception e){
	out.println(e);
 }
%>
  <center><button type=submit name=submit value=SUBMIT>Submit</button></center>
</form>
</pre>
</div>
</body>
</html>