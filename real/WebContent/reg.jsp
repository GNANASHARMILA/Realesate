<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: Arial, sans-serif;
}

body {
	background-image:
		url("https://img.freepik.com/premium-photo/online-registration-form-modish-form-filling_31965-42692.jpg");
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: 100% 100%;
	margin-left:40%;
}
h1 {
	text-align: center;
	padding: 20px;
	font-size: 36px;
	color: #333333;
}

form {
	/* background-color: #25DEDE; */
	width: 500px;
	margin: 0 auto;
	padding: 40px;
	box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
	border-radius: 20px;
	margin-top: 40px;
	margin-bottom: 40px;
}

label {
	display: block;
	font-size: 18px;
	font-weight: bold;
	color: black;
	margin-bottom: 10px;
}
/* .container {
	margin: 10px;
	width: 90%;
	height: 50%;
	padding: 50px;
	border-radius: 60px;
	box-shadow: 0px 2px 10px #0E0E0E;
	
} */
input[type="text"], input[type="email"], input[type="password"], input[type="number"],
	select {
	display: block;
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: none;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	font-size: 16px;
	color: #333333;
	background-color: #f2f2f2;
	transition: box-shadow 0.2s ease-in-out;
}

input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus,
	input[type="number"]:focus, select:focus {
	box-shadow: 0 0 5px #008080;
}

input[type="submit"] {
	display: block;
	background-color: #008080;
	color: #ffffff;
	padding: 10px;
	border: none;
	border-radius: 5px;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.2s ease-in-out;
	float: right;
}

input[type="submit"]:hover {
	background-color: #004d4d;
}

#blink {
	font-size: 30px;
	font-weight: bold;
	font-family: 'Poppins', sans-serif;
}

/* .error {
	color: red;
	font-size: 14px;
	margin-top: 5px;
	display: block;
} */
</style>
</head>
<body>
	<h1 id="blink">
		Registration
		<script type="text/javascript">
			var blink = document.getElementById('blink');

			setInterval(function() {
				blink.style.opacity = (blink.style.opacity == 0 ? 1 : 0);
			}, 1000);
		</script>
	</h1>

	<form method="post" action="RegistrationController">
		<div class="container">
			<label>Name:</label><br> <input type="text"
				placeholder="Enter a name" name="name" required> <br> <label>Email:</label><br>
			<input type="email" placeholder="Enter email" name="email" required>
			<br> <label>Password:</label><br> <input type="password"
				placeholder="Enter password" name="password" required> <br>
			<label>Contact_Number:</label><br> <input type="number"
				placeholder="Enter Contact_Number" name="contactnumber" required>
			<br> <label>Role:</label><br> <select name="role">
				<option value="seller">Seller</option>
				<option value="buyer">Buyer</option>
				<option value="admin">Admin</option>
			</select><br></br>
			<input type="submit" value="Register" required><br>
		</div>
	</form>
</body>