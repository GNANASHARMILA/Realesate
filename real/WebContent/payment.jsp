<%@ page import="java.sql.*"%>
<%
    String Name = request.getParameter("name");
   /*  int SiteId = Integer.parseInt(request.getParameter("siteId")); */
    String InitialAmount = request.getParameter("initialAmount");
    String siteId = request.getParameter("siteId");

    String JdbcURL = "jdbc:mysql://localhost:3306/pro";
    String Username = "root";
    String password1 = "Sharmilasql@29";
    

    try {
        Connection con = DriverManager.getConnection(JdbcURL, Username, password1);
        String updateAvailabilityQuery = "UPDATE site SET Availability='Booked' WHERE SiteId=?";
		PreparedStatement updateAvailabilityStatement = con.prepareStatement(updateAvailabilityQuery);
		updateAvailabilityStatement.setString(1, siteId);
		updateAvailabilityStatement.executeUpdate(); 

        String query = "UPDATE status SET InitialAmount=? WHERE SiteId=? AND Name=?";
        PreparedStatement statement = con.prepareStatement(query);
      
        statement.setString(1, InitialAmount);
        statement.setString(2, siteId);
        statement.setString(3, Name);
        int rowsUpdated = statement.executeUpdate();
        if (rowsUpdated > 0) { 
        	%>
        	
        	<div class="blink-text">
        	<% 
            out.println("<strong><h2>Booking status and payment amount updated successfully!</h2></strong>");
        } else {
            out.println("<strong><h2>No rows were updated.</h2></strong>");
        } 
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<style>
	body{
		background-image:url("https://sdginvestorplatform.undp.org/sites/default/files/styles/hero_2x/public/opportunity/shutterstock_701873641.jpg?itok=uCuNmVe1");
		background-repeat: no-repeat;
		background-attachment: fixed;
		background-size: 100% 100%;
	}
	.blink-text{
		color: #000;
		font-weight: bold;
		font-size: 2rem;
		animation: blinkingText 2s infinite;
	}
	@keyframes blinkingText{
		0%		{ color: #10c018;}
		25%		{ color: #1056c0;}
		50%		{ color: #ef0a1a;}
		75%		{ color: #254878;}
		100%	{ color: #04a1d5;}
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