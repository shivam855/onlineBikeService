<%@page import="org.omg.PortableInterceptor.SYSTEM_EXCEPTION"%>
<%@page import = "java.sql.*" %>
<%@page import="java.util.*" %>
<%
	int max=100,min=10;
	String s1 = request.getParameter("tf1");
	String paymod = request.getParameter("tf2");
	String s3 = request.getParameter("tf3");
	String s4 = request.getParameter("tf4");
	String exp_date = request.getParameter("tf5");
	int bill_amt = Integer.parseInt(s1);
	int cvv = Integer.parseInt(s4);
	int x = Integer.parseInt(s3);
	Random num = new Random();
	int track_id = Math.abs((num.nextInt())*max-min+1);
	int user_id = (Integer)session.getAttribute("user_id");
	String user_name = 	(String)session.getAttribute("user_name");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
		PreparedStatement pst= conn.prepareStatement("insert into payment(trackid,bill_amt,paymod,debitnum,cvv,exp_date,status) values(?,?,?,?,?,?,?); ");
		pst.setInt(1, track_id);
		pst.setInt(2, bill_amt);
		pst.setString(3, paymod);
		pst.setInt(4, x);
		pst.setInt(5, cvv);
		pst.setString(6, exp_date);
		pst.setString(7, "panding");
		pst.execute();
		session.setAttribute("track id", track_id);
		session.setAttribute("user_id", user_id);
		session.setAttribute("user_name", user_name);
		response.sendRedirect("http://localhost:8080/OurProject/paydone.jsp");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>