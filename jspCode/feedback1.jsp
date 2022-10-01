<html>
<head>
<title>FeedBack Form </title>
<link rel="stylesheet" type="text/css" href="back.css" />
<script>
function validate()
{
	var name=document.myform.tf3.value;  
	if((name==null || name==""))
	{
	  alert("No one option should be left their");  
	  return false;  
	}
}
</script>
</head>
<body>
<br>	
<table class="login">
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="englogin.html" >LOGOUT</a></th><tr>
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
<h1><center>FeedBack Form</center></h1><hr><br>
<pre>
<form action="feedback.jsp" method=get name="myform" onsubmit="return validate()">
<font size ='3px' >
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
<b>Service Provided   :<input type=radio name=tf1 > Excellent <input type=radio name=tf1 > Very Good <input type=radio name=tf1 > Good<input type=radio name=tf1 > Bad</center><br><br>
<b>Facility Provided  :<input type=radio name=tf2 > Excellent <input type=radio name=tf2 > Very Good <input type=radio name=tf2 > Good<input type=radio name=tf2 > Bad</center><br><br>
  <b> <center>Suggestion:</center>
  <center><textarea name = tf3 rows='8' cols='25' style="width: 300px;"></textarea></font></center>
  
  <center><button type=submit name=submit value=SUBMIT>Submit</button></center>  		                            
</form>
</pre>

</div>
</body>
</html>