<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String contactnumber = request.getParameter("contactnumber");
String role = request.getParameter("role");

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pro", "root", "Sharmilasql@29");

	if (role.equals("seller")) {
		String insertQuery = "INSERT INTO seller (name, email, password, contactnumber) VALUES (?, ?, ?,?)";
		PreparedStatement pstmt = conn.prepareStatement(insertQuery);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, password);
		pstmt.setString(4, contactnumber);
		pstmt.executeUpdate();
	} else if (role.equals("admin")) {
		String insertQuery = "INSERT INTO admin(name, email, password, contactnumber) VALUES (?, ?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(insertQuery);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, password);
		pstmt.setString(4, contactnumber);
		pstmt.executeUpdate();
	} else if (role.equals("buyer")) {
		String insertQuery = "INSERT INTO buyer (name, email, password, contactnumber) VALUES (?, ?, ?,?)";
		PreparedStatement pstmt = conn.prepareStatement(insertQuery);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setString(3, password);
		pstmt.setString(4, contactnumber);
		pstmt.executeUpdate();
	} else {
		out.println("Error: Invalid role");
	}
	String insertQuery = "INSERT INTO users(name,email,password,contactnumber,role)values(?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(insertQuery);
	pstmt.setString(1, name);
	pstmt.setString(2, email);
	pstmt.setString(3, password);
	pstmt.setString(4, contactnumber);
	pstmt.setString(5, role);
	pstmt.executeUpdate();
	out.println("<center><strong><h1>Data is successfully inserted!</h1></strong></center>");
} catch (SQLException e) {
	out.println("Error: " + e.getMessage());
} catch (ClassNotFoundException e) {
	out.println("Error: " + e.getMessage());
} catch (Exception e) {
	out.println("Error: " + e.getMessage());
	e.printStackTrace();
}
%>
<style>
body {
	background-image:
		url("https://companieshouse.blog.gov.uk/wp-content/uploads/sites/148/2017/08/Register-a-company-620x413.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}
</style>
<body>

	<button onclick="goBack()">Back</button>

	<script>
        function goBack() {
            window.location.href = "login.html";
        }
    </script>
</body>