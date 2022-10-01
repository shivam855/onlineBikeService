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
<h1><center  style="font-size: 25px;">Unmapping Completed </center></h1><hr>
<pre>
provided service engineer now free to 
take another task
<form action=mappingApproval.jsp method=get> <center>
<%@page import="java.sql.*" %>
<%
	int track_id = Integer.parseInt(request.getParameter("tf1"));
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst=conn.prepareStatement("delete from service where track_id=?");
	pst.setInt(1, track_id);
	pst.execute();
	}
catch(Exception e){
	out.println(e);
 }
%>
    		<br><center><font size=2px><a href="AdminPortal.jsp">Back to AdminPortal </a></font></center>
    		
    		<br><center><font><a href="mapping.jsp">Next mapping Status</a></font></center>
</form>
</pre>
</div>
</body>
</html>