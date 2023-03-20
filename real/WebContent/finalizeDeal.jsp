<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String jdbcURL = "jdbc:mysql://localhost:3306/pro";
String username = "root";
String password = "Sharmilasql@29";

String buyer_name = request.getParameter("buyer_name");
String buyer_email = request.getParameter("buyer_email");
String buyer_password = request.getParameter("buyer_password");
String buyer_phone = request.getParameter("buyer_phone");

try (Connection conn = DriverManager.getConnection(jdbcURL, username, password)) {
	String query = "INSERT INTO buyer(name, email, password,contactnumber) VALUES (?, ?, ?, ?)";
	PreparedStatement statement = conn.prepareStatement(query);
	statement.setString(1, buyer_name);
	statement.setString(2, buyer_email);
	statement.setString(3, buyer_password);
	statement.setString(4, buyer_phone);

	int rowsInserted = statement.executeUpdate();

	if (rowsInserted > 0) {
		out.println("<h1>Deal Finalized Successfully</h1>");
		out.println("<p>Buyer/Renter Name: " + buyer_name + "</p>");
		out.println("<p>Buyer/Renter Email: " + buyer_email + "</p>");
		out.println("<p>Buyer/Renter Password: " + buyer_password + "</p>");
		out.println("<p>Buyer/Renter Contact Number: " + buyer_phone + "</p>");
		out.println("<p>Thank you for choosing our site. Your information has been recorded.</p>");
	}
} catch (SQLException e) {
	out.println("Error finalizing deal: " + e.getMessage());
} catch (Exception e) {
	out.println(e.getMessage());
}
%>

<body>
	<button onclick="goBack()">Back</button>

	<script>
		function goBack() {
			window.location.href = "seller.jsp";
		}
	</script>
</body>
