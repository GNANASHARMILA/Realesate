<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>

<style>
.main {
	width: 100%;
	background: linear-gradient(to top, rgba(0, 0, 0, 0.1) 50%,
		rgba(0, 0, 0, 0.1) 50%);
	background-position: center;
	background-size: cover;
	height: 100vh;
	background-position: center;
}

h1 {
	color: black;
}

body {
	background-image: url("https://wallpapercave.com/wp/wp8179172.png");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
}

.navbar {
	width: 1200px;
	height: 75px;
	margin: auto;
}

.icon {
	width: 200px;
	float: left;
	height: 70px;
}

.logo {
	color: white;
	font-size: 20px;
	font-family: Arial;
	padding-left: 10px;
	float: left;
	padding-top: 10px;
	margin-top: 5px;
}

.menu {
	width: 500px;
	float: left;
	height: 70px;
	margin-top: 0px;
}

ul {
	float: left;
	display: flex;
	justify-content: center;
	align-items: center;
}

ul li {
	list-style: none;
	margin-left: 62px;
	margin-top: 27px;
	font-size: 16px;
}

ul li a {
	text-decoration: none;
	color: #fff;
	font-family: Arial;
	font-weight: bold;
	transition: 0.4s ease-in-out;
}

ul li a:hover {
	color: yellow;
}

.content {
	width: 1200px;
	height: auto;
	margin: 200px;
	color: #fff;
	position: relative;
	background-color: Pastel Gray;
}

.content h1 {
	font-family: 'Times New Roman';
	font-size: 50px;
	padding-left: 20px;
	margin-top: 9%;
	letter-spacing: 2px;
}

.content span {
	color: olive;
	font-size: 65px
}

.form {
	width: 130px;
	height: 260px;
	background-color: black;
	position: absolute;
	top: -10px;
	left: 800px;
	transform: translate(0%, -5%);
	border-radius: 10px;
	padding: 25px;
	position: absolute;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-size: 15px;
	font-family: 'Poppins', sans-serif;
}

.dropdown:hover .dropdown-content {
	display: block;
}

/* .blink {
	animation: blinker 1.5s linear infinite;
	color: olive;
	font-family: sans-serif;
}

@
keyframes blinker { 50% {
	opacity: 0;
}
} */
</style>
</head>
<body>

	<div class="main">
		<div class="navbar">
			<div class="icon">
				<h2 class="logo">REALESTATE</h2>
			</div>

			<div class="menu">
				<ul>

					<li><a href="first.jsp">HOME</a></li>
					<li>
					<li><a href="properties.html">PROPERTIES</a>
					<li class="dropdown"><a href="#" class="dropbtn">RESOURCES</a>
						<div class="dropdown-content">
							<form>
								<a href="about.jsp">ABOUT US</a>
							</form>
							<a href="works.html">HOW IT WORKS</a> <a href="design.html">DESIGN</a>
							<a href="contactus.html">CONTACT US</a>
						</div></li>


					<li style="margin-left: 450px; font-size: 12px;">
						<form>
							<h2>
								<a href=".\login.html"
									style='text-decoration: underline; color: tan'>Sign In</a>
							</h2>
						</form>
					</li>
					<li style="margin-left: 20px; font-size: 12px;">
						<form>
							<h2>
								<a href=".\register.html"
									style='text-decoration-line: underline; color: tan'>Sign Up</a>
							</h2>
						</form>
					</li>
				</ul>


			</div>

		</div>


		<div class="content">
			<marquee>
				<h1 style='color: mistyrose;'>
					WELCOME TO REAL ESTATE<br> <span><center>WEBSITE</center></span>
				</h1>
			</marquee>
		</div>
	</div>


</body>
</html>