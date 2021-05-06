<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-signup" />
<c:url var="SignupURL" value="/web-signup" />
<c:url var="NewURL" value="/admin-new" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng ký</title>
</head>
<body>
	<div class="container">
		<!-- <h1 class="form-heading">login Form</h1> -->
		<div class="signup-form">
			<div class="main-div">
				<c:if test="${not empty message}">
					<div class="alert alert-${alert}">${message}</div>
				</c:if>
				<form method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="userName"
							name="userName" placeholder="Username" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="fullName"
							name="fullName" placeholder="Fullname" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password"
							name="password" placeholder="Password" required>
					</div>
					<input type="hidden" value="signup" name="action" />
					<button id="btnSignUp" type="submit" class="btn btn-primary">Signup</button>
					<br> <a href='<c:url value="/dang-nhap?action=login"/>'>Already
						had an account? Click here...</a>
				</form>
			</div>
		</div>
	</div>

	<script>
		$('#btnSignUp').click(function(e) {
			e.preventDefault();

			var userName = document.getElementById("userName");
			var fullName = document.getElementById("fullName");
			var password = document.getElementById("password");
			var data = {};
			data["userName"] = userName.value;
			data["fullName"] = fullName.value;
			data["password"] = password.value;
			addUser(data);
		});
		function addUser(data) {
					$.ajax({
						url : '${APIurl}',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "/manhuaweb/dang-nhap?action=login&message=signup_success&alert=success";
						},
						error : function(error) {
							window.location.href = "/manhuaweb/dang-ky?action=signup&message=signup_fail";
							alert("Duplicated username!");
						}
					});
		}
	</script>
</body>
</html>