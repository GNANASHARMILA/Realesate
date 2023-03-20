<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<style>
h1 {
	font-family: monospace;
}

.centered {
	font-family: Times New Roman;
	position: absolute;
	top: 7%;
	left: 7%;
	transform: translate(-50%, -50%);
}
</style>
</head>
<body>
	<img
		src="https://media1.propertyshare.in/images/static_page_banner/about%20us.jpg">
	<br></br>
	<div>
		<div class="centered";>
			<h1>About Us</h1>
		</div>
		<h1>
			<center>Who We Are</center>
		</h1>

		<p style="font-size: 50px">
		<center>
			Real estate has historically been the asset class that has created
			the highest wealth for investors <br> around the world. However,
			large capital investment, specialised investment knowledge, asset
			management capabilities and understanding of market cycles has
			restricted <br>the asset class to institutional investors, ultra
			high net worth individuals, pension and sovereign funds.
		</center>
		</p>
		<p>
		<center>
			Property Share was founded by a team with deep experience in
			institutional<br> real estate investing and technology with the
			aim to democratise real estate investing for ordinary investors by
			providing institutional quality analysis, <br> asset management
			and liquidity at much lower investment thresholds.
		</center>
		</p>
	</div>

	<button onclick="goBack()">Back</button>

	<script>
        function goBack() {
            window.location.href = "first.jsp";
        }
    </script>
</body>
</html>