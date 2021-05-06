<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<div class="headerm">
		<a href='<c:url value="/trang-chu"/>'><img src="./img/ic.png"
			style="height: 100px; width: 200px; float: left"></a>
		<div class="stuffm">
			<ul class="userm">
				<a href='<c:url value="/thoat?action=logout"/>' class="abc">Đăng
					xuất</a>
				<p>Xin chào, ${USERMODEL.fullName}</p>
			</ul>
		</div>
	</div>
</body>
</html>