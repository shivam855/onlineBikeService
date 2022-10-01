<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%
	int max=100,min=10;
	String str="";
	String Bike_Name = request.getParameter("tf1");
	String Bike_Modal = request.getParameter("tf2");
	String Service_Type = request.getParameter("tf3");
	String Service = request.getParameter("tf4");
	Random num = new Random();
	int track_id = Math.abs((num.nextInt())*max-min+1);
	int user_id = 	(Integer)session.getAttribute("user_id");
	String user_name = 	(String)session.getAttribute("user_name");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/engineer", "root", "mysql");
	PreparedStatement pst1= conn1.prepareStatement("select * from registeration");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
	PreparedStatement pst= conn.prepareStatement("insert into service(track_id,user_id,bike_name,bike_model,service_type,status ,services,eng_id,approval) values(?,?,?,?,?,?,?,?,?)");
	ResultSet rs = pst1.executeQuery();
	while(rs.next())
	{
		pst.setInt(8, rs.getInt("eng_id"));					
	}
	pst.setInt(1, track_id);	
	pst.setInt(2, user_id);
	pst.setString(3, Bike_Name);	
	pst.setString(4, Bike_Modal);
	pst.setString(5, Service_Type);
	pst.setString(6, "panding");
	pst.setString(7, Service);
	
	pst.setString(9, "panding");
	pst.execute();
	session.setAttribute("user_id", user_id);
	session.setAttribute("track_id", track_id);
	session.setAttribute("user_name", user_name);
	response.sendRedirect("http://localhost:8080/OurProject/servicedone.jsp");
	}
	catch(Exception e)
    {
		out.println(e);
    }
	%>
	