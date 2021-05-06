<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
</head>
<body>
	<section id = "mcn" class="hot">
	<h1>Hot</h1>
	<h1>Mới cập nhật</h1>
	<div class="hot-container">
		<div class="slideshow-container">
		<c:forEach var="item" items="${hotmodel.listResult}" begin="0" end="3">
			<div class="Hotno1 fade">
				<c:url var="storyURL" value="/story">
					<c:param name="id" value="${item.id}"/>
				</c:url>
				<a href="${storyURL}"><img src="${item.imgUrl}"
					style="width: 100%, height=450px"></a>
			</div>
		</c:forEach>
		
			<!-- <div class="Hotno1 fade">
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
			</div> -->
			
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
		<c:forEach var="item" items="${update.listResult}" begin="0" end="9">
			<div class="row">
				<div class="row-title">
					<a href="">${item.name }</a>
				</div>
				<div class="row-cate">
					<a href="./author/a-hao.html">${item.cate }</a>
				</div>
				<div class="row-author">
					<a href="./author/a-hao.html">${item.author }</a>
				</div>
			</div>
		</c:forEach>
	</div>
	</section>

	<section class="list-cate">
 		<h1 style="width: 100%;">Thể loại</h1>
 		<div class="categories"><a href=""></a>
 			<h3 class="category-title">
 				<span class="star"></span>
 				<span class="star"></span>
 				<span class="star last"></span>
 				<span><a href="">Ngôn tình</a></span>
 				<span class="star first"></span> 				
 				<span class="star"></span>
 				<span class="star"></span>
 			</h3>
 			<c:forEach var="item" items="${model1.listResult}" begin = "0" end = "2">
	 			<c:url var="storyURL" value="/story">
					<c:param name="id" value="${item.id}"/>
				</c:url>
				<div class="item top-1"><a href="${storyURL}"><img src="${item.imgUrl}"></a>
 				<div class="item-title">${item.name}</div>
 				</div>							
			</c:forEach>
 		</div>
 		<div class="categories"><a href=""></a>
 			<h3 class="category-title">
 				<span class="star"></span>
 				<span class="star"></span>
 				<span class="star last"></span>
 				<span><a href="">Kiếm hiệp</a></span>
 				<span class="star first"></span> 				
 				<span class="star"></span>
 				<span class="star"></span>
 			</h3>
 			<c:forEach var="item" items="${model2.listResult}" begin = "0" end = "2">
	 			<c:url var="storyURL" value="/story">
					<c:param name="id" value="${item.id}"/>
				</c:url>
				<div class="item top-1"><a href="${storyURL}"><img src="${item.imgUrl}"></a>
 				<div class="item-title">${item.name}</div>
 				</div>							
			</c:forEach>
 		</div>
 		<div class="categories">
 			<h3 class="category-title">
 				<span class="star"></span>
 				<span class="star"></span>
 				<span class="star last"></span>
 				<span><a href="">Tiên hiệp</a></span>
 				<span class="star first"></span> 				
 				<span class="star"></span>
 				<span class="star"></span>
 			</h3>
 			<c:forEach var="item" items="${model3.listResult}" begin = "0" end = "2">
	 			<c:url var="storyURL" value="/story">
					<c:param name="id" value="${item.id}"/>
				</c:url>
				<div class="item top-1"><a href="${storyURL}"><img src="${item.imgUrl}"></a>
 				<div class="item-title">${item.name}</div>
 				</div>							
			</c:forEach>
 		</div>
 		<div class="categories"><a href=""></a>
 			<h3 class="category-title">
 				<span class="star"></span>
 				<span class="star"></span>
 				<span class="star last"></span>
 				<span><a href="">Trinh thám</a></span>
 				<span class="star first"></span> 				
 				<span class="star"></span>
 				<span class="star"></span>
 			</h3>
 			<c:forEach var="item" items="${model4.listResult}" begin = "0" end = "2">
	 			<c:url var="storyURL" value="/story">
					<c:param name="id" value="${item.id}"/>
				</c:url>
				<div class="item top-1"><a href="${storyURL}"><img src="${item.imgUrl}"></a>
 				<div class="item-title">${item.name}</div>
 				</div>							
			</c:forEach>
 		</div>
 		<div class="categories"><a href=""></a>
 			<h3 class="category-title">
 				<span class="star"></span>
 				<span class="star"></span>
 				<span class="star last"></span>
 				<span><a href="">Truyện ngược</a></span>
 				<span class="star first"></span> 				
 				<span class="star"></span>
 				<span class="star"></span>
 			</h3>
 			<c:forEach var="item" items="${model5.listResult}" begin = "0" end = "2">
	 			<c:url var="storyURL" value="/story">
					<c:param name="id" value="${item.id}"/>
				</c:url>
				<div class="item top-1"><a href="${storyURL}"><img src="${item.imgUrl}"></a>
 				<div class="item-title">${item.name}</div>
 				</div>							
			</c:forEach>
 		</div>
 		<div class="categories"><a href=""></a>
 			<h3 class="category-title">
 				<span class="star"></span>
 				<span class="star"></span>
 				<span class="star last"></span>
 				<span><a href="">Hài hước</a></span>
 				<span class="star first"></span> 				
 				<span class="star"></span>
 				<span class="star"></span>
 			</h3>
 			<c:forEach var="item" items="${model6.listResult}" begin = "0" end = "2">
	 			<c:url var="storyURL" value="/story">
					<c:param name="id" value="${item.id}"/>
				</c:url>
				<div class="item top-1"><a href="${storyURL}"><img src="${item.imgUrl}"></a>
 				<div class="item-title">${item.name}</div>
 				</div>							
			</c:forEach>
 		</div>
 		<div class="categories"><a href=""></a>
 			<h3 class="category-title">
 				<span class="star"></span>
 				<span class="star"></span>
 				<span class="star last"></span>
 				<span><a href="">Kinh dị</a></span>
 				<span class="star first"></span> 				
 				<span class="star"></span>
 				<span class="star"></span>
 			</h3>
 			<c:forEach var="item" items="${model7.listResult}" begin = "0" end = "2">
	 			<c:url var="storyURL" value="/story">
					<c:param name="id" value="${item.id}"/>
				</c:url>
				<div class="item top-1"><a href="${storyURL}"><img src="${item.imgUrl}"></a>
 				<div class="item-title">${item.name}</div>
 				</div>							
			</c:forEach>
 		</div>
 		<div class="categories"><a href=""></a>
 			<h3 class="category-title">
 				<span class="star"></span>
 				<span class="star"></span>
 				<span class="star last"></span>
 				<span><a href="">Dị giới</a></span>
 				<span class="star first"></span> 				
 				<span class="star"></span>
 				<span class="star"></span>
 			</h3>
 			<c:forEach var="item" items="${model8.listResult}" begin = "0" end = "2">
	 			<c:url var="storyURL" value="/story">
					<c:param name="id" value="${item.id}"/>
				</c:url>
				<div class="item top-1"><a href="${storyURL}"><img src="${item.imgUrl}"></a>
 				<div class="item-title">${item.name}</div>
 				</div>							
			</c:forEach>
 		</div>
 		
 	</section>
 	<section>
 	
 	</section>
</body>

</html>