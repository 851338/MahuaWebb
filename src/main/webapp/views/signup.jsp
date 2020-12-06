<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
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
					<div class="alert alert-${alert}">
							${message}
					</div>
				</c:if>
				<form action="<c:url value='/dang-ky'/>" id="formSignup" method="post">
					<div class="form-group">
						<input type="text" class="form-control" id="userName" name="userName"
							placeholder="Tên đăng nhập" required>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="fullName" name="fullName"
							placeholder="Họ tên" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="password" name="password"
							placeholder="Mật khẩu" required>
					</div>
					<input type="hidden" value="signup" name="action"/>
					<button type="submit" class="btn btn-primary" >Đăng ký</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>