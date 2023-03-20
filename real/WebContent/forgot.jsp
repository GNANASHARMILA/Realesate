<%@ page language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Update Password</title>
<style>
body {
	background-image:
		url("https://images.rawpixel.com/image_1300/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGYtbWlzY3RleHR1cmUwMS1iZWVyLTAwMF81LmpwZw.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}
</style>
</head>
<body>
	<%
	String jdbcURL = "jdbc:mysql://localhost:3306/pro";
	String username = "root";
	String password = "Sharmilasql@29";

	String email = request.getParameter("Email");
	String newPassword = request.getParameter("NewPassword");

	if (email == null || email.trim().isEmpty()) {
		out.println("Email parameter is missing or empty!");
	} else {
		try (Connection conn = DriverManager.getConnection(jdbcURL, username, password)) {

			String update = "UPDATE users SET password=? WHERE email=?";
			PreparedStatement updateStatement = conn.prepareStatement(update);
			updateStatement.setString(1, newPassword);
			updateStatement.setString(2, email);

			int rowsUpdated = updateStatement.executeUpdate();

			if (rowsUpdated > 0) {
		out.println("<h2><strong><center>Password updated successfully!</center></strong></h2>");
			} else {
		out.println("Failed to update the password for the email: " + email);
			}

		} catch (Exception e) {
			out.println(e.getMessage());
		}
	}
	%>
</body>
</html>
