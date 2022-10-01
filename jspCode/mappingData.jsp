<%@page import="java.sql.*" %>
<%
	int eng_id;
	 try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bike", "root", "mysql");
		Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/engineer", "root", "mysql");
		PreparedStatement pst = conn.prepareStatement("select * from service");
		PreparedStatement pst2 = conn1.prepareStatement("select * from registeration");
		PreparedStatement pst1 = conn.prepareStatement("insert into mapping(track_id,user_id,eng_id,eng_status,approval) values(?,?,?,?,?)");
		ResultSet rs=pst.executeQuery();
		ResultSet rs1=pst2.executeQuery();
		while(rs1.next())
		{
			eng_id = rs1.getInt("eng_id");
			  pst1.setInt(3,eng_id);
		}
		while(rs.next())
		{
	          int track_id = rs.getInt("track_id");
	          int user_id = rs.getInt("user_id");		
			  pst1.setInt(1,track_id);
			  pst1.setInt(2,user_id);
			  pst1.setString(4, "panding");
			  pst1.setString(5, "panding");
		}
		pst1.execute();
		pst2.close();
		
		rs1.close();
		rs.close();
		pst.close();
	 }
	catch(Exception e){
		out.println(e);
	 }


%>