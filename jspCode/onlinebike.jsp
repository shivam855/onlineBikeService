<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Customer Portal</title>
<link rel="stylesheet" type="text/css" href="back.css" />
</head>
<body>
<table class="login">
<tr><th><a  href="home.html" >HOME</a></th>  <th><a href="login.html" >LOGOUT</a></th><tr>
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
	out.println("<b><div class=user> USER_NAME:"+user_name+"</div></b><br>");
}
	catch(Exception e)
    {
		out.println(e);
    }
	%>
<h4><center>Online Bike Service Portal</center></h4>	
<div class=abc>
<h1><center>Customer Portal</center></h1><hr><br>	
<table class=detail>
<tr>
<th><a href="service1.jsp"><button>Customer Service</button></a></th>  <th><a href="vehicalTable.jsp"><button>Tracking Vehicle</button></a></th>
<th><a href="payment1.jsp"><button>Payment </button></a></th></tr><tr><th></th>  <th><a href="feedback1.jsp"><button>Feedback</button></a></th>
</tr>
</table><p><h2>&nbsp &nbsp  CUSTOMER SERVICE</h2></p>
<p>Customer service is the provision of service to customers before, during, and after a purchase. The perception of success of such interactions is dependent on employees "who can adjust themselves to the personality of the guest".Customer service concerns the priority an organization assigns to customer service relative to components such as product innovation and pricing. In this sense, an organization that values good customer service may to spend more money in training employees than the average organization or may proactively interview customers for feedback.
</p>
<p><h2>&nbsp &nbsp   Vehicle Status</h2></p>
<p>The content on this portal is meant for sharing information regarding vehicles on the basis of information available on centralized VAHAN and vehicle National ...
</p>
<p><h2> &nbsp &nbsp  FeedBack</h2></p>
<p>Feedback is defined as a return of information about a result or the returned portion of a process.An example of feedback is a high pitched noise that is returned from a speaker when a microphone gets too close to it.
</p>
<p><h2> &nbsp &nbsp  Payment</h2></p>
<p>Payment is the transfer of one form of goods, services, or financial assets in exchange for another form of goods, services, or financial assets in acceptable proportions that have been previously agreed upon by all parties involved. Payment can be made in the form of funds, assets or services.</p>
</div>
</body>
</html>