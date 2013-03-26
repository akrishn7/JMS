<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Applicant Form Handler</title>
</head>
<body>

<%
	String name = request.getParameter("companyName ");
	String address = request.getParameter("streetAddress");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zip = request.getParameter("zip");
	String URL = request.getParameter("URL");
	String phoneNumber = request.getParameter("phoneNumber");
	
	try
	{
		Connection con = null;
		String connectionUrl = "jdbc:sqlserver://152.15.106.187:1433;databaseName=pdunlap2;user=pdunlap2;password=800581960";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		con = DriverManager.getConnection(connectionUrl);
		
		String insertQuery = "INSERT INTO Company VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pst = con.prepareStatement(insertQuery);
		pst.setString(1,name);
		pst.setString(2,address);
		pst.setString(3,city);
		pst.setString(4,state);
		pst.setString(5,zip);
		pst.setString(6,phoneNumber);
		pst.setString(7,URL);
		pst.executeUpdate();
		
		response.sendRedirect("success.html");
	}
	catch(Exception e){
		out.print(e.getMessage());
	}
%>

</body>
</html>