<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<sql:setDataSource var="data" driver="com.mysql.cj.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/manhuaweb" user="root"
				password="123456" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>
    <!-- css -->
	<link rel="stylesheet" type="text/css" href="./template/web/style/style.css">
	
    
</head>
<body>
	<!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->
    
    <div class="container">
    	<dec:body/>
    </div>

	<!-- footer -->
	<%@ include file="/common/web/footer.jsp" %>
	<!-- footer -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="./template/web/style/script.js"></script>
	
</body>
</html>