<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller</title>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.card-container {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	margin-top: 20px;
}

.card {
	width: 200px;
	height: 200px;
	margin-bottom: 20px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
}

.card img {
	width: 100%;
	height: 70%;
	object-fit: cover;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.card button {
	width: 100%;
	height: 30%;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	cursor: pointer;
}

.card button:hover {
	background-color: #0056b3;
}

.card h3 {
	margin: 10px;
}

.card p {
	margin: 10px;
	font-size: 14px;
	line-height: 1.5;
}
</style>
</head>
<body>

	<h1>
		<center>
			Welcome
			<%=session.getAttribute("username")%></center>
	</h1>
	<div class="img">
		<img
			src="https://img.freepik.com/free-photo/happy-real-estate-agent-giving-couple-keys-their-new-home_637285-6089.jpg"
			; width=100%;>

	</div>
	<div class="card-container">
		<div class="card">
			<img
				src="https://png.pngtree.com/png-vector/20190307/ourmid/pngtree-real-estate-logo-png-image_781922.jpg">
			<h3>
				<center>Post a site</center>
			</h3>
			<button onclick="window.location.href='postProperty.html'">
				<h3>Click here</h3>
			</button>
		</div>
		<div class="card">
			<img
				src="https://png.pngtree.com/png-vector/20190307/ourmid/pngtree-real-estate-logo-png-image_781922.jpg"
				alt="Image 1">
			<h3>
				<center>Provide availability</center>
			</h3>
			<button onclick="window.location.href='provideAvailability.jsp'">
				<h3>Click here</h3>
			</button>
		</div>
		<div class="card">
			<img
				src="https://png.pngtree.com/png-vector/20190307/ourmid/pngtree-real-estate-logo-png-image_781922.jpg">
			<h3>
				<center>Finalize a deal</center>
			</h3>
			<button onclick="window.location.href='finalizeDeal.html'">
				<h3>Click here</h3>
			</button>
		</div>
	</div>
	<button onclick="goBack()">Back</button>

	<script>
		function goBack() {
			window.location.href = "first.jsp";
		}
	</script>
	<!-- <ul>
		<li><a href="postSite.jsp">Post a site</a></li>
		<li><a href="updateAvailability.jsp">Update availability</a></li>
		<li><a href="finalizeDeal.jsp">Finalize a deal</a></li>
	</ul> -->
</body>
</html>
