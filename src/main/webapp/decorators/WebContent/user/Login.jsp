<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Log in</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	 <div class="side"></div>
		<div class="formframe">
			<form name="form" action="<%=request.getContextPath()%>/LoginServlet" method="post">	
				<div class="container">
					<img alt="usrnm" src="username.png">
					<input type="text" placeholder="Enter username" name="username" required>

					<img alt="psw" src="password.png">
					<input type="Password" placeholder="Enter password" name="password" required>

					<button type="submit" value="Login">Login</button>
					<br><br>

					<div>Haven't had an account yet? <a href="Signup.jsp">Signup here...</a></div>
					<br>

					<div>Forgot password? <a href="Forgot.jsp">Click here...</a></div>
					<br>
				</div>
			</form>
		</div>
		<div class="side"></div>
</body>
</html>