<%@page import="java.sql.*" %>
	<%
	String str="";
	String s1 = request.getParameter("tf1");
	int x = Integer.parseInt(s1);
	String s2 = request.getParameter("tf2");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst= conn.prepareStatement("select * from admin_details where admin_id=? ");
	pst.setInt(1, x);	
	ResultSet pass =  pst.executeQuery();
	while(pass.next())
	{
		 str = pass.getString("password");		
	}
	if(s2.equals(str) && x != 0)
	{
		response.sendRedirect("http://localhost:8080/OurProject/AdminPortal.jsp");
		session.setAttribute("admin_id",x);
	}
	else	
	{
		response.sendRedirect("http://localhost:8080/OurProject/adlogin1.html");			
	}
	}
    catch(Exception e)
    {
		out.println(e);
    }

	%>
	