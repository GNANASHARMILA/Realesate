<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<html>
<head>
<title>Manage Property Details</title>
<style>
body {
	background-image:
		url("https://img.lovepik.com/background/20211021/large/lovepik-real-estate-poster-background-image_401416682.jpg");
	/* set background image */
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	font-family: Arial, sans-serif; /* set font family */
	font-size: 16px; /* set font size */
	line-height: 1.5; /* set line height */
	margin: 0; /* remove default margin */
}

h1 {
	color: #333; /* set heading color */
	font-size: 36px; /* set heading font size */
	text-align: center; /* center align heading */
	margin: 50px 0; /* add margin to top and bottom */
}

form {
	background-color: #fff; /* set form background color */
	border-radius: 18px; /* add border radius to form */
	padding: 20px; /* add padding to form */
	max-width: 500px; /* set max width of form */
	margin: 0 auto; /* center align form */
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* add box shadow to form */
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: none;
	border-radius: 3px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

input[type=submit] {
	background-color: #333;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: #666;
}

.site-details {
	background-color: #fff;
	border: 14px solid #ccc;
	border-radius: 250px;
	padding: 10px;
	margin-bottom: 20px;
	text-align: center;
}
</style>
</head>
<body>

	<h1>Manage Property Details</h1>

	<%
	String jdbcURL = "jdbc:mysql://localhost:3306/pro";
	String username = "root";
	String password = "Sharmilasql@29";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		// Get the location and property type from the request parameter
		String location = request.getParameter("location");
		String propertyType = request.getParameter("propertyType");

		// Initialize JDBC driver and database URL
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcURL, username, password);

		// Retrieve site details with the given location and property type
		String sql = "SELECT * FROM site WHERE Location=? AND Property_Type=? AND Availability='yes'";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, location);
		pstmt.setString(2, propertyType);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			do {

		String loc = rs.getString("Location");
		String propType = rs.getString("Property_type");
		String budget = rs.getString("Budget");
		int siteId = rs.getInt("SiteId");
	%>
	<div class="site-details">
		<p>
			Location:
			<%=loc%></p>
		<p>
			Property Type:
			<%=propType%></p>
		<p>
			Budget:
			<%=budget%></p>
		<p>
			Managed details of site with SiteId:
			<%=siteId%></p>
	</div>
	<%
	//out.println("<tr><td>" + siteId + "</td><td>" + loc + "</td><td>" + propType + "</td><td>" + budget + "</td></tr>");
	} while (rs.next());

	} /* else {
		out.println("Failed to Manage details");
		} */
	} catch (Exception ex) {
	out.println("Error managing property details. " + ex.getMessage());
	} finally {
	if (rs != null) {
	rs.close();
	}
	if (pstmt != null) {
	pstmt.close();
	}
	if (conn != null) {
	conn.close();
	}
	}
	%>

	<%-- Display the message --%>


	<%-- Create a form to input the location and property type --%>
	<form method="post" action="">
		<label for="location">Location:</label> <input type="text"
			id="location" name="location" required><br> <label
			for="propertyType">Property Type:</label> <input type="text"
			id="propertyType" name="propertyType" required><br> <input
			type="submit" value="Submit">
	</form>
	<button onclick="goBack()">Back</button>

	<script>
		function goBack() {
			window.location.href = "admin.jsp";
		}
	</script>

</body>
</html>
