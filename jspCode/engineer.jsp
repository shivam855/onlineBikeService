
<%@page import="java.sql.*" %>

	<%
	String str ="";
	String s1 = request.getParameter("tf1");
	String s2 = request.getParameter("tf2");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/engineer", "root", "mysql");
	PreparedStatement pst= conn.prepareStatement("select * from registeration where email=? ");
	pst.setString(1, s1);	
	ResultSet pass =  pst.executeQuery();
	while(pass.next())
	{
		 str = pass.getString("password");		
	}
	if(s2.equals(str) && s1!= null && str!= null )
	{
		response.sendRedirect("http://localhost:8080/BikeProject1/Service.html");	
	}
	else
	{
		response.sendRedirect("http://localhost:8080/BikeProject1/login.html");	
	}
	}
    catch(Exception e)
    {
		out.println(e);
    }
%>