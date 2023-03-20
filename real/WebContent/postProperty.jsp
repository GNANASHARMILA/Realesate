<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Scanner"%>
<%
String JdbcURL = "jdbc:mysql://localhost:3306/pro";
String Username = "root";
String password = "Sharmilasql@29";
Connection con = null;
Scanner scan = new Scanner(System.in);
String SiteId = request.getParameter("SiteId");
String Location = request.getParameter("Location");
String propertyType = request.getParameter("propertyType");
String Budget = request.getParameter("Budget");

try {
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(JdbcURL, Username, password);
	String query = "INSERT INTO site (Location, Property_Type, Budget,Availability,SiteId) VALUES (?, ?, ?,?,?)";
	PreparedStatement statement = con.prepareStatement(query);
	statement.setString(1, Location);
	statement.setString(2, propertyType);
	statement.setString(3, Budget);
	statement.setString(4, "yes");
	statement.setString(5, SiteId);
	statement.executeUpdate();
	out.println("<center><strong><h1>Property posted successfully!</h1></strong></center>");
} catch (Exception e) {
	e.printStackTrace();
	out.println("<center><strong><h1>Error posting property." + e.getMessage() + "</h1></strong></center>");
} finally {
	try {
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
%>
<body>

	<button onclick="goBack()">Back</button>

	<script>
		function goBack() {
			window.location.href = "postProperty.html";
		}
	</script>
</body>
<style>
body {
	background-image:
		url("https://png.pngtree.com/background/20210709/original/pngtree-real-estate-selling-a-house-estate-high-end-real-estate-picture-image_935739.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}

button {
	background-color: #D5DBDB;
	color: #008CBA;
	font-size: 18px;
	font-weight: bold;
	padding: 10px 20px;
	border: 2px solid #008CBA;
	border-radius: 7px;
	cursor: pointer;
	position: fixed;
	bottom: 120px;
	left: 70px;
}

button:hover {
	background-color: #008CBA;
	color: #ffffff;
}
</style>
