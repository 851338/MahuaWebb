<%@ page contentType="text/html"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Sign up</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script src="script.js"></script>
</head>
<body>
	<form name="form" action="<%=request.getContextPath()%>/SignupServlet" method="post" onsubmit="return validate()">
		<div class="container">
			<img alt="usrnm" src="../img/username.png">
			<input type="text" placeholder="Enter username" name="username" required>

			<img alt="psw" src="../img/password.png">
			<input type="Password" placeholder="Enter password" name="password" required>

			<img alt="email" src="../img/email.png">
			<input type="text" placeholder="Enter email" name="email" required>

			<img alt="phone" src="../img/password.png">
			<input type="text" placeholder="Enter phonenumber" name="phone" required>


			<button type="submit" value="Signup">Signup</button>
			<br><br>

			<div>Already had an account? <a href="Login.jsp">Login here...</a></div>
			<br>
		</div>
	</form>
</body>
</html>