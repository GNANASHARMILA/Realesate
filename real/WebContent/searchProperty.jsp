<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String jdbcURL = "jdbc:mysql://localhost:3306/pro";
    String username = "root";
    String password = "Sharmilasql@29";
    
    // Check availability
    if(request.getParameter("action").equals("checkAvailability")) {
        String location = request.getParameter("Location");
        String property_type = request.getParameter("Property_Type");
        String budget = request.getParameter("Budget");
        
        try(Connection conn = DriverManager.getConnection(jdbcURL, username, password)) {
        	if (budget.endsWith("L")) {
            String query = "SELECT * FROM site WHERE Location = ? AND Property_Type = ? AND Budget LIKE '%L' AND Budget <= ? AND Availability='yes'";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, location);
            statement.setString(2, property_type);
            statement.setString(3, budget);
            
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
        	}
        	else if(budget.endsWith("C")){
        		 String query = "SELECT * FROM site WHERE Location = ? AND Property_Type = ? AND Budget LIKE '%C' AND Budget <= ? AND Availability='yes'";
        		 PreparedStatement statement = conn.prepareStatement(query);
                 statement.setString(1, location);
                 statement.setString(2, property_type);
                 statement.setString(3, budget);
                 
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
        	}
            
        } catch (SQLException e) {
            out.println("Error checking availability: " + e.getMessage());
        }
    }
%>

<style>
body {
	background-image:
		url("https://images.rawpixel.com/image_400/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGYtbWlzY3RleHR1cmUwMS1iZWVyLTAwMF81LmpwZw.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}

div {
	border: 8px outset grey;
	/*  background-color: lightblue;  */
	text-align: center;
}

form {
	margin: 20px;
	padding: 20px;
	border: 10px solid #ccc;
	border-radius: 5px;
	max-width: 300px;
}

label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

input[type="text"] {
	padding: 5px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 3px;
	width: 80%;
}

input[type="submit"] {
	padding: 7px 10px;
	font-size: 16px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 7px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #3e8e41;
}
</style>

<body>
	<h1>
		<center>Check Site Availability</center>
	</h1>


	<form action="" method="POST">
		<label for="Location">Location:</label><br> <input type="text"
			id="Location" name="Location" required><br> <br> <label
			for="Property_Type">Property Type:</label><br> <input
			type="text" id="Property_Type" name="Property_Type" required><br>
		<br> <label for="Budget">Budget:</label> <br>
		<input type="text" id="Budget" name="Budget" required><br>
		<br> <input type="hidden" name="action" value="checkAvailability"><br>
		<input type="submit" value="Check Availability">
	</form>
	<br>

	<button onclick="goBack()">Back</button>

	<script>
        function goBack() {
            window.location.href = "buyer.jsp";
        }
    </script>
</body>
