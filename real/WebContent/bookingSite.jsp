<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Site Visit</title>
<style>
body {
	background-image:
		url("https://hips.hearstapps.com/hmg-prod/images/martha-mulholland-standard-architecture-malibu-house-221-edit-1647617139.jpg");
	font-family: Arial, sans-serif;
	font-size: 16px;
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
	font-family: Arial, sans-serif;
}

h1 {
	font-size: 36px;
	font-weight: bold;
	color: #e60000;
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
}

form {
	background-color: #F0F0F0;
	border-radius: 10px;
	box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
	padding: 40px;
	width: 550px;
	height: 700px;
	margin: 0 auto;
}

label {
	display: block;
	margin-bottom: 20px;
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

input[type="text"], input[type="date"], select {
	width: 100%;
	padding: 10px;
	margin-bottom: 30px;
	border: 50px;
	border-radius: 5px;
	box-shadow: 0px 14px 25px rgb(128, 128, 128);
	font-size: 16px;
}

input[type="text"]:focus, input[type="date"]:focus, select:focus {
	outline: none;
	box-shadow: 0px 0px 5px #008080;
}

a {
	text-decoration: none;
	color: #008080;
}

input[type="submit"] {
	background-color: #008080;
	color: #fff;
	padding: 15px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 18px;
	margin-top: 30px;
}

input[type="submit"]:hover {
	background-color: #005f5f;
}
</style>
</head>
<body>
	<h1 class="blink-bg">Booking</h1>
	<form method="post" action="bookiSiteVisit.jsp">
		<label for="name">Name:</label> <input type="text" id="name"
			name="name"><br> <br> <label for="date">Date:</label>
		<input type="date" id="date" name="date"><br> <br> <label
			for="property">Property_Type:</label> <input type="text"
			id="property" name="property"><br> <br> <label
			for="amount"> Budget:</a></label> <input type="text" id="amount"
			name="amount"><br> <br> <label for="siteId">Site
			ID:</label> <select id="siteId" name="siteId">
			<!-- JDBC code to retrieve available site IDs -->
			<%@ page import="java.sql.*"%>
			<%
			String JdbcURL = "jdbc:mysql://localhost:3306/pro";
			String Username = "root";
			String password = "Sharmilasql@29";
			Connection con = null;
			try {
				con = DriverManager.getConnection(JdbcURL, Username, password);
				String sql = "SELECT SiteId FROM site WHERE Availability = 'yes'";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<option value="<%=rs.getString("SiteId")%>"><%=rs.getString("SiteId")%></option>
			<%
			}
			} catch (Exception e) {
			e.printStackTrace();
			} finally {
			if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			}
			}
			%>
		</select> <br> <br> <input type="submit" value="Submit">
	</form>
</body>
</html>
