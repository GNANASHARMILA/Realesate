<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Site Visit - Result</title>
<style>
body {
	background-image:
		url("https://sdginvestorplatform.undp.org/sites/default/files/styles/hero_2x/public/opportunity/shutterstock_701873641.jpg?itok=uCuNmVe1");
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

	String name = request.getParameter("name");
	String date = request.getParameter("date");
	String amount = request.getParameter("amount");
	String siteId = request.getParameter("siteId");

	try (Connection conn = DriverManager.getConnection(jdbcURL, username, password)) {
		String query = "INSERT INTO status (Name, Bookingstatus, Budget, SiteId) VALUES (?, ?, ?, ?)";
		PreparedStatement statement = conn.prepareStatement(query);
		statement.setString(1, name);
		statement.setString(2, date);
		statement.setString(3, amount);
		statement.setString(4, siteId);
		statement.executeUpdate();

		String updateAvailabilityQuery = "UPDATE site SET Availability='Booked' WHERE SiteId=?";
		PreparedStatement updateAvailabilityStatement = conn.prepareStatement(updateAvailabilityQuery);
		updateAvailabilityStatement.setString(1, siteId);
		updateAvailabilityStatement.executeUpdate();
	%>
	<h1>Site visit booked successfully!</h1>
	<p>
		Name:
		<%=name%></p>
	<p>
		Date:
		<%=date%></p>
	<p>
		Amount:
		<%=amount%></p>
	<p>
		Site ID:
		<%=siteId%></p>
	<%
	} catch (SQLException e) {
	out.println("Error booking site visit: " + e.getMessage());
	} catch (Exception e) {
	out.println(e.getMessage());
	}
	%>


	<h1>Payment</h1>
	<form method="post" action="payment.jsp">
		<label for="name">Name:</label> <input type="text" name="name"
			id="name" required><br> <br> <label for="siteId">Site
			ID:</label> <input type="number" name="siteId"><br> <br> <label
			for="initialAmount">Initial Amount:</label> <input type="text"
			name="initialAmount" id="initialAmount" required><br> <br>
		<input type="submit" value="Pay">
	</form>

	<%-- <%
    String Name = request.getParameter("name");
String SiteId = request.getParameter("siteId");
    String InitialAmount = request.getParameter("initialAmount");

    String JdbcURL = "jdbc:mysql://localhost:3306/pro";
    String Username = "root";
    String password1 = "Sharmilasql@29";

    try {
        Connection con = DriverManager.getConnection(JdbcURL, Username, password1);

        String query = "UPDATE status SET InitialAmount=? WHERE SiteId=? AND Name=?";
        PreparedStatement statement = con.prepareStatement(query);
      
        statement.setString(1, InitialAmount);
        statement.setString(2, SiteId);
        statement.setString(3, Name);
        int rowsUpdated = statement.executeUpdate();
        if (rowsUpdated > 0) { 
            out.println("Booking status and payment amount updated successfully!");
        } else {
            out.println("No rows were updated.");
        } 
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

 --%>