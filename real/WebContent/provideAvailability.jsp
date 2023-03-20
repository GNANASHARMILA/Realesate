<%@ page import="java.sql.*"%>
<%
// Retrieve availability details from the database
String JdbcURL = "jdbc:mysql://localhost:3306/pro";
String Username = "root";
String password = "Sharmilasql@29";
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
try {
	con = DriverManager.getConnection(JdbcURL, Username, password);
	ps = con.prepareStatement("SELECT * FROM site");
	rs = ps.executeQuery();
} catch (SQLException e) {
	e.printStackTrace();
}
%>

<!-- Display availability details in a table -->
<table class="availability">
	<tr>

		<th>Location</th>
		<th>Property_Type</th>
		<th>Budget</th>
		<th>Availability</th>
		<th>Site Id</th>
	</tr>
	<%
	while (rs.next()) {
	%>
	<tr>
		<td><%=rs.getString("Location")%></td>
		<td><%=rs.getString("Property_Type")%></td>
		<td><%=rs.getString("Budget")%></td>
		<td><%=rs.getString("Availability")%></td>
		<td><%=rs.getString("SiteId")%></td>
	</tr>
	<%
	}
	%>
</table>

<%
// Close the database connection, statement, and result set
try {
	if (rs != null)
		rs.close();
	if (ps != null)
		ps.close();
	if (con != null)
		con.close();
} catch (SQLException e) {
	e.printStackTrace();
}
%>

<style>
.availability {
	background-color: #f2f2f2;
	border-collapse: collapse;
	width: 100%;
}

.availability th, .availability td {
	padding: 8px;
	text-align: left;
	border-bottom: 2px solid #ddd;
}

.availability th {
	background-color: #4CAF50;
	color: white;
}

button {
	background-color: #D5DBDB;
	color: #008CBA;
	font-size: 18px;
	font-weight: bold;
	padding: 10px 20px;
	border: 2px solid #008CBA;
	border-radius: 7px;
	cursor: pointer;
}

button:hover {
	background-color: #008CBA;
	color: #ffffff;
}
</style>

<br>
<br>
<button onclick="goBack()">Back</button>

<script>
	function goBack() {
		window.location.href = "seller.jsp";
	}
</script>

