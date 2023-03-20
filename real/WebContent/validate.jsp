<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Details of Sellers and Buyers</title>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
	border-bottom: 1px solid #ddd;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

th {
	background-color: #4CAF50;
	color: white;
}
</style>

</head>
<body>
	<h3>
		<center>Details of Sellers</center>
	</h3>
	<table>
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Contact Number</th>
		</tr>
		<%
		String JDBC_DRIVER = "com.mysql.jdbc.Driver";
		String DB_URL = "jdbc:mysql://localhost/pro";
		String USER = "root";
		String PASS = "Sharmilasql@29";

		Connection conn = null;
		java.sql.Statement stmt = null;
		ResultSet rs = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			stmt = conn.createStatement();
			String sql = "SELECT * FROM users WHERE role='seller'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String contactNumber = rs.getString("contactnumber");
		%>
		<tr>
			<td><%=name%></td>
			<td><%=email%></td>
			<td><%=contactNumber%></td>
		</tr>
		<%
		}
		} catch (SQLException e) {
		out.println("Error checking availability: " + e.getMessage());
		} catch (Exception e) {
		out.println(e.getMessage());
		} finally {
		try {
		if (rs != null) {
			rs.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		} catch (Exception e) {
		out.println("Error closing database connection: " + e.getMessage());
		}
		}
		%>
	</table>
	<br></br>
	<h3>
		<center>Validate Details of Buyer</center>
	</h3>
	<table>
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Contact Number</th>
		</tr>
		<%
		String JDBC = "com.mysql.jdbc.Driver";
		String URL = "jdbc:mysql://localhost/pro";
		String User = "root";
		String Pwd = "Sharmilasql@29";

		Connection conn1 = null;
		java.sql.Statement stmt1 = null;
		ResultSet rs1 = null;
		try {
			Class.forName(JDBC);
			conn = DriverManager.getConnection(URL, User, Pwd);
			stmt = conn.createStatement();
			String sql = "SELECT * FROM users WHERE role='buyer'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String contactNumber = rs.getString("contactnumber");
		%>
		<tr>
			<td><%=name%></td>
			<td><%=email%></td>
			<td><%=contactNumber%></td>
		</tr>
		<%
		}
		} catch (SQLException e) {
		out.println("Error checking availability: " + e.getMessage());
		} catch (Exception e) {
		out.println(e.getMessage());
		} finally {
		try {
		if (rs != null) {
			rs.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		if (conn != null) {
			conn.close();
		}
		} catch (Exception e) {
		out.println("Error closing database connection: " + e.getMessage());
		}
		}
		%>
	</table>
	<button onclick="goBack()">Back</button>

	<script>
		function goBack() {
			window.location.href = "admin.jsp";
		}
	</script>
</body>
</html>
