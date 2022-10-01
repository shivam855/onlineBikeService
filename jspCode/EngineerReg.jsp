<%@page import="java.sql.*" %>
<%
String s1 = request.getParameter("tf1");
String s2 = request.getParameter("tf2");
String s3 = request.getParameter("tf3");
String s4 = request.getParameter("tf4");
String s5 = request.getParameter("tf5");
String s6 = request.getParameter("tf6");
String s7 = request.getParameter("tf7");
String s8 = request.getParameter("tf8");
String s9 = request.getParameter("tf9");
String s10 = request.getParameter("tf10");
if(s9.equals(s10))
{ 
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/engineer", "root", "mysql");
	PreparedStatement pst= conn.prepareStatement("insert into registeration(name,email,phone,adhaar,address,city,state,experiance,password,requirement,approval) values(?,?,?,?,?,?,?,?,?,?,?); ");
	pst.setString(1, s1);
	pst.setString(2, s2);
	pst.setString(3, s3);
	pst.setString(4, s4);
	pst.setString(5, s5);
	pst.setString(6, s6);
	pst.setString(7, s7);
	pst.setString(8, s8);
	pst.setString(9, s9);	
	pst.setString(10, "btech");
	pst.setString(11, "panding");
	pst.execute();
	session.setAttribute("email", s2);
	response.sendRedirect("http://localhost:8080/OurProject/engRegister.jsp");
}

 catch(Exception e){
	out.println(e);
 }
}
else
	{
	response.sendRedirect("http://localhost:8080/OurProject/registration.html");
	}
	%>
	