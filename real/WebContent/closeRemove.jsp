<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<html>
<head>
<title>Close Deal and Remove Site</title>
<style>
body {
	font-family: Calibri, Helvetica, sans-serif;
	background-image:
		url("https://www-cms.pipedriveassets.com/cdn-cgi/image/quality=70,format=auto/https://www-cms.pipedriveassets.com/How-to-close-a-sale.png");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}

form {
	border: 10px solid #ccc;
	padding: 20px;
	width: 400px;
	margin: 0 auto;
}

label, input {
	display: block;
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<%
	    String jdbcURL = "jdbc:mysql://localhost:3306/pro";
	    String username = "root";
	    String password = "Sharmilasql@29";
	    Connection conn = null;
	    Statement stmt = null;
	    int siteId = 0;
	    String message = "";

	    try {
	        // Get the site ID from the request parameter
	        siteId = Integer.parseInt(request.getParameter("SiteId"));

	        // Initialize JDBC driver and database URL
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(jdbcURL, username, password);

	        // Close the deal and remove site from the website
	        String sql = "UPDATE status SET status='sold' WHERE SiteId=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, siteId);
	        ps.executeUpdate();

	        sql = "DELETE FROM site WHERE SiteId=?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, siteId);
	        ps.executeUpdate();

	        message = "Closed the deal and removed site with SiteID: " + siteId;

	    } 
	    catch (Exception ex) {
	        message = "Error closing deal and removing site. " + ex.getMessage();
	    } finally {
	        if (stmt != null) {
	            stmt.close();
	        }
	        if (conn != null) {
	            conn.close();
	        }
	    }
	%>

	<h1>Close Deal and Remove Site</h1>

	<%-- Display the message --%>
	<p><%=message%></p>

	<%-- Create a form to input the site ID --%>
	<form>
		<label for="SiteId"><b>Site ID</b></label> <input type="text"
			id="SiteId" name="SiteId" required><input type="submit"
			value="Submit">
	</form>
	<button onclick="goBack()">Back</button>

	<script>
        function goBack() {
            window.location.href = "admin.jsp";
        }
    </script>

</body>
</html>
