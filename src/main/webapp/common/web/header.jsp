<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<section class="header">
	<div class="container">
		<div class="icon">
			<a href='<c:url value="/trang-chu"/>'><img src="./img/ic.png"
				style="height: 100px; width: 200px"></a>
		</div>

		<div class="stuff">
			<div class="searchBar">
				<form action="<c:url value="/admin-user?type=list&page=1&maxPageItem=4&sortName=name&sortBy=desc"/>" method="get">
					<input type="text" name="name" placeholder="Search..">
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
			<c:if test="${empty USERMODEL.id}">
				<div class="login">
					<a href='<c:url value="/dang-nhap?action=login"/>'>Đăng nhập</a>
				</div>
				<div class="register">
					<a href='<c:url value="/dang-ky?action=signup"/>'>Đăng ký</a>
				</div>
			</c:if>
			<c:if test="${not empty USERMODEL.id}">
				<div class="register">Xin chào, ${USERMODEL.fullName}</div>
				<div class="login">
					<a href='<c:url value="/thoat?action=logout"/>'>Thoát</a>
				</div>
			</c:if>
		</div>

		<div class="naviBar">
			<div class="Hot">
				<a href='<c:url value="/trang-chu"/>'>Trang chủ</a>
			</div>
			<div class="Update">
				<a href="#mcn">Mới cập nhật</a>
			</div>
			<div class="dropdown">
				<a href="">Thể loại</a>
				<div class="dropdown-Category">
					<c:forEach var="item" items="${modelCat.listResult}">
						<c:url var="categoryURL" value="/category-story">
							<c:param name="id" value="${item.id}" />
						</c:url>
						<a href="${categoryURL}">${item.name}</a>
					</c:forEach>
				</div>
			</div>
			<div class="Author">
				<a href="">Tác giả</a>
			</div>
			<div class="BXH">
				<a href='<c:url value="/bxh"/>'>BXH</a>
			</div>
		</div>
	</div>
</section>