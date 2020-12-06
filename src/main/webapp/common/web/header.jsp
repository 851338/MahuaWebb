<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section class="header">
 		<div class="container">
 			<div class="icon">
 				<img src="./img/icon.png" style="height: 100px; width: 100px">
 			</div>

 			<div class="stuff">
 				<div class="searchBar"><input type="text" placeholder="Search.."></div>
 				<div class="login"><a href='<c:url value="/dang-nhap?action=login"/>'>Đăng nhập</a>
 				</div>
 				<div class="register"><a href='<c:url value="/dang-ky?action=signup"/>'>Đăng ký</a>
 				</div>
 			</div>

 			<div class="naviBar">
 				<div class="Hot"><a href="">Hot</a></div>
 				<div class="Update"><a href="">Mới cập nhật</a></div>
 				<div class="dropdown"><a href="">Thể loại</a>
 					<div class="dropdown-Category">
 						<a href="./cate/ngon-tinh.html">Ngôn tình</a>
 						<a href="./cate/kiem-hiep.html">Kiếm hiệp</a>
 						<a href="./cate/tien-hiep.html">Tiên hiệp</a>
 						<a href="./cate/trinh-tham.html">Trinh thám</a>
 						<a href="./cate/truyen-nguoc.html">Truyện ngược</a>
 						<a href="./cate/hai-huoc.html">Hài hước</a>
 						<a href="./cate/kinh-di.html">Kinh dị</a>
 						<a href="./cate/di-gioi.html">Dị giới</a>					
 					</div>
 				</div>
 				<div class="Author"><a href="">Tác giả</a></div>
 				<div class="BXH"><a href="">BXH</a></div>
 			</div>
 		</div>
 </section>