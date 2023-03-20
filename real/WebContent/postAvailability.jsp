<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String jdbcURL = "jdbc:mysql://localhost:3306/pro";
String username = "root";
String password = "Sharmilasql@29";

// Check availability
if (request.getParameter("action").equals("checkAvailability")) {
	String location = request.getParameter("Location");
	String property_type = request.getParameter("propertyType");
	String budget = request.getParameter("Budget");

	try (Connection conn = DriverManager.getConnection(jdbcURL, username, password)) {
		String query = "SELECT * FROM site WHERE Location=? AND Property_Type=? AND Budget<=? AND Availability='yes'";
		PreparedStatement statement = conn.prepareStatement(query);
		statement.setString(1, location);
		statement.setString(2, property_type);
		statement.setString(3, budget);
		//statement.setString(4,"yes");
		/* statement.setString(1, location);
		statement.setString(2, property_type);
		statement.setString(3, budget);
		ResultSet rs = statement.executeQuery();
		while(rs.next()) {
	int SiteId = rs.getInt("SiteId");
		
	String Location = rs.getString("Location");
	String Property_type = rs.getString("Property_Type");
	String  Budget= rs.getString("Budget"); */

		/* statement.setString(1, location);
		statement.setString(2, budget); */
		out.println("<h1><center>Available sites are:</center></h1>");
		ResultSet rs = statement.executeQuery();
		while (rs.next()) {
	int SiteId = rs.getInt("SiteId");
	String Location = rs.getString("Location");
	String Property_type = rs.getString("Property_type");
	String Budget = rs.getString("Budget");

	// Output the data as HTML

	out.println("<div>");
	out.println("<h2>Site ID: " + SiteId + "</h2>");
	out.println("<p>Location: " + Location + "</p>");
	out.println("<p>Property Type: " + Property_type + "</p>");
	out.println("<p>Budget: " + Budget + "</p>");
	out.println("</div>");
		}
		/*  if(rs.next()) {
		     out.println("Location is available");
		 } else {
		     throw new Exception("No availability information found for " + location);
		 } */

	} catch (SQLException e) {
		out.println("Error checking availability: " + e.getMessage());
	} catch (Exception e) {
		out.println(e.getMessage());
	}
}
%>

<style>
body {
	background-image:
		url("https://cdn.vectorstock.com/i/preview-2x/12/73/3d-checklist-on-clipboard-paper-with-gold-coins-vector-43801273.webp");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}

div {
	border: 8px outset grey;
	/*  background-color: lightblue;  */
	text-align: center;
}
</style>
<body>


	<button onclick="goBack()">Back</button>

	<script>
		function goBack() {
			window.location.href = "buyer.jsp";
		}
	</script>
</body>