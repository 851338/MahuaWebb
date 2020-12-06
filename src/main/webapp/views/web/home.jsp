<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<sql:setDataSource var="data" driver="com.mysql.cj.jdbc.Driver"
				url="jdbc:mysql://localhost:3306/newservlet12month2018" user="root"
				password="123456" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
</head>
<body>
	<section class="hot">
	<h1>Hot</h1>
	<h1>Mới cập nhật</h1>
	<div class="hot-container">
		<div class="slideshow-container">
			<div class="Hotno1 fade">
				<a href=""> <img src="./img/chang-re-dai-gia.jpg"
					style="width: 100%, height=450px"></a>
			</div>
			<div class="Hotno1 fade">
				<a href=""> <img src="./img/he-thong-livestream-tu-vong.jpg"
					style="width: 100%, height=450px"></a>
			</div>
			<div class="Hotno1 fade">
				<a href=""> <img src="./img/toan-chuc-phap-su-di-ban.jpg"
					style="width: 100%, height=450px"></a>
			</div>
			<div class=" Hotno1 fade">
				<a href=""> <img src="./img/thien-ha-de-nhat-sung-phi.jpg"
					style="width: 100%, height=450px"></a>
			</div>
			<div class="Hotsizebar">
				<a href=""></a>
			</div>
		</div>
		<br>
		<div class="dot-container">
			<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
			<span class="dot"></span>
		</div>
	</div>
	<div class="update-container">
		<div class="row">
			<div class="row-title" style="line-height: 0px;">
				<h3>Tên truyện</h3>
			</div>
			<div class="row-cate" style="line-height: 0px;">
				<h3>Thể loại</h3>
			</div>
			<div class="row-author" style="line-height: 0px;">
				<h3>Tác giả</h3>
			</div>
		</div>
		<sql:query var="result" dataSource="${data}">
					select * from manhua
				</sql:query>
		<c:forEach var="rows" items="${result.rows}" begin="0" end="9">
			<div class="row">
				<div class="row-title">
					<a href="./manhua/chang-re-cuc-pham.html">${rows.name }</a>
				</div>
				<div class="row-cate">
					<a href="./cate/ngon-tinh.html">${rows.type }</a>
				</div>
				<div class="row-author">
					<a href="./author/a-hao.html">${rows.author }</a>
				</div>
			</div>
		</c:forEach>
	</div>
	</section>

	<section class="list-cate">
	<h1 style="width: 100%;">Thể loại</h1>
	<div class="categories">
		<a href=""></a>
		<h3 class="category-title" style="background-color: #FFFACD;">
			<span class="star"></span> <span class="star"></span> <span
				class="star last"></span> <span><a href="">Ngôn tình</a></span> <span
				class="star first"></span> <span class="star"></span> <span
				class="star"></span>
		</h3>
		<sql:query var="result" dataSource="${data}">
					select * from manhua where type = "ngon tinh"
				</sql:query>
		<c:forEach var="rows" items="${result.rows}" begin="0" end="2">
			<div class="item top-1">
				<a href=""><img src="${rows.imgUrl}"></a>
				<div class="item-title">${rows.name}</div>
			</div>
		</c:forEach>
	</div>
	<div class="categories">
		<a href=""></a>
		<h3 class="category-title" style="background-color: #778899;">
			<span class="star"></span> <span class="star"></span> <span
				class="star last"></span> <span><a href="">Kiếm hiệp</a></span> <span
				class="star first"></span> <span class="star"></span> <span
				class="star"></span>
		</h3>
		<sql:query var="result" dataSource="${data}">
					select * from manhua where type = "kiem hiep"
				</sql:query>
		<c:forEach var="rows" items="${result.rows}" begin="0" end="2">
			<div class="item top-1">
				<a href=""><img src="${rows.imgUrl}"></a>
				<div class="item-title">${rows.name}</div>
			</div>
		</c:forEach>
	</div>
	<div class="categories">
		<h3 class="category-title" style="background-color: #20B2AA;">
			<span class="star"></span> <span class="star"></span> <span
				class="star last"></span> <span><a href="">Tiên hiệp</a></span> <span
				class="star first"></span> <span class="star"></span> <span
				class="star"></span>
		</h3>
		<sql:query var="result" dataSource="${data}">
					select * from manhua where type = "tien hiep"
				</sql:query>
		<c:forEach var="rows" items="${result.rows}" begin="0" end="2">
			<div class="item top-1">
				<a href=""><img src="${rows.imgUrl}"></a>
				<div class="item-title">${rows.name}</div>
			</div>
		</c:forEach>
	</div>
	<div class="categories">
		<a href=""></a>
		<h3 class="category-title" style="background-color: #00665d;">
			<span class="star"></span> <span class="star"></span> <span
				class="star last"></span> <span><a href="">Trinh thám</a></span> <span
				class="star first"></span> <span class="star"></span> <span
				class="star"></span>
		</h3>
		<sql:query var="result" dataSource="${data}">
					select * from manhua where type = "trinh tham"
				</sql:query>
		<c:forEach var="rows" items="${result.rows}" begin="0" end="2">
			<div class="item top-1">
				<a href=""><img src="${rows.imgUrl}"></a>
				<div class="item-title">${rows.name}</div>
			</div>
		</c:forEach>
	</div>
	<div class="categories">
		<a href=""></a>
		<h3 class="category-title" style="background-color: #87CEEB;">
			<span class="star"></span> <span class="star"></span> <span
				class="star last"></span> <span><a href="">Kinh dị</a></span> <span
				class="star first"></span> <span class="star"></span> <span
				class="star"></span>
		</h3>
		<sql:query var="result" dataSource="${data}">
					select * from manhua where type = "kinh di"
				</sql:query>
		<c:forEach var="rows" items="${result.rows}" begin="0" end="2">
			<div class="item top-1">
				<a href=""><img src="${rows.imgUrl}"></a>
				<div class="item-title">${rows.name}</div>
			</div>
		</c:forEach>
	</div>
	<div class="categories">
		<a href=""></a>
		<h3 class="category-title" style="background-color: #F4A460;">
			<span class="star"></span> <span class="star"></span> <span
				class="star last"></span> <span><a href="">Dị giới</a></span> <span
				class="star first"></span> <span class="star"></span> <span
				class="star"></span>
		</h3>
		<sql:query var="result" dataSource="${data}">
					select * from manhua where type = "di gioi"
				</sql:query>
		<c:forEach var="rows" items="${result.rows}" begin="0" end="2">
			<div class="item top-1">
				<a href=""><img src="${rows.imgUrl}"></a>
				<div class="item-title">${rows.name}</div>
			</div>
		</c:forEach>
	</div>
	<div class="categories">
		<a href=""></a>
		<h3 class="category-title" style="background-color: #FFA07A;">
			<span class="star"></span> <span class="star"></span> <span
				class="star last"></span> <span><a href="">Truyện ngược</a></span> <span
				class="star first"></span> <span class="star"></span> <span
				class="star"></span>
		</h3>
		<sql:query var="result" dataSource="${data}">
					select * from manhua where type = "truyen nguoc"
				</sql:query>
		<c:forEach var="rows" items="${result.rows}" begin="0" end="2">
			<div class="item top-1">
				<a href=""><img src="${rows.imgUrl}"></a>
				<div class="item-title">${rows.name}</div>
			</div>
		</c:forEach>
	</div>
	<div class="categories">
		<a href=""></a>
		<h3 class="category-title" style="background-color: darkseagreen;">
			<span class="star"></span> <span class="star"></span> <span
				class="star last"></span> <span><a href="">Hài hước</a></span> <span
				class="star first"></span> <span class="star"></span> <span
				class="star"></span>
		</h3>
		<sql:query var="result" dataSource="${data}">
					select * from manhua where type = "hai huoc"
				</sql:query>
		<c:forEach var="rows" items="${result.rows}" begin="0" end="2">
			<div class="item top-1">
				<a href=""><img src="${rows.imgUrl}"></a>
				<div class="item-title">${rows.name}</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>