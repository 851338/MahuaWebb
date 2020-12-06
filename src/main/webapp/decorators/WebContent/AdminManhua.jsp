<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Admin Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>A$$</title>
<meta name="description" content="Bootstrap Metro Dashboard">
<meta name="author" content="Dennis Ji">
<meta name="keyword"
	content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<!-- end: Meta -->

<!-- start: Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- end: Mobile Specific -->

<!-- start: CSS -->
<link id="bootstrap-style" href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/bootstrap-responsive.min.css" rel="stylesheet">
<link id="base-style" href="./css/style.css" rel="stylesheet">
<link id="base-style-responsive" href="./css/style-responsive.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext'
	rel='stylesheet' type='text/css'>
<link rel="shortcut icon" href="img/favicon.ico">
</head>
<%-- <%
	//In case, if Admin session is not set, redirect to Login page
	if ((request.getSession(false).getAttribute("admin") == null)) {
%>
<jsp:forward page="Login.jsp"></jsp:forward>
<%
	}
%> --%>
<body>
	<%-- <center>
		<h2>Admin's Home</h2>
	</center>

	Welcome
	<%=request.getAttribute("userName")%>

	<div style="text-align: right">
		<a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
	</div> --%>

	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a> <a class="brand" href="index.html"><span>TopTruyen</span></a>

				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right">
						<!-- start: User Dropdown -->
						<li class="dropdown"><a class="btn dropdown-toggle"
							data-toggle="dropdown" href="#"> <i
								class="halflings-icon white user"></i> Hello Admin,<%=request.getAttribute("userName")%><span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title"><span>Account
										Settings</span></li>
								<li><a href="#"><i class="halflings-icon user"></i>
										Profile</a></li>
								<li><a href="user/Login.jsp"><i class="halflings-icon off"></i>
										Logout</a></li>
							</ul></li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->

			</div>
		</div>
	</div>
	<!-- start: Header -->

	<div class="container-fluid-full">
		<div class="row-fluid">

			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a class="dropmenu" href="#"><i
								class="icon-folder-close-alt"></i><span class="hidden-tablet">
									Quản lý</span><span class="label label-important"></span></a>
							<ul>
								<li><a class="submenu" href="#"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Quản lý truyện</span></a></li>
								<li><a class="submenu" href="#"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Quản lý nhân viên</span></a></li>
								<li><a class="submenu" href="#"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Quản lý bạn đọc</span></a></li>
								<li><a class="submenu" href="#"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Quản lý comment</span></a></li>
							</ul></li>
						<li><a class="dropmenu" href="#"><i
								class="icon-folder-close-alt"></i><span class="hidden-tablet">
									Thống kê</span><span class="label label-important"></span></a>
							<ul>
								<li><a class="submenu" href="#"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Top view</span></a></li>
								<li><a class="submenu" href="#"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Quản lý nhân viên</span></a></li>
								<li><a class="submenu" href="#"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Quản lý bạn đọc</span></a></li>
							</ul></li>
						<li><a href="login.html"><i class="icon-lock"></i><span
								class="hidden-tablet"> Login Page</span></a></li>
					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->


			<!-- start: Content -->
			<div id="content" class="span10">
				<h1>Danh sách user</h1>
				<table border="1" width="100%">
					<tr>
						<th>Tên truyện</th>
						<th>Tên tác giả</th>
						<th>Thể loại</th>
						<th>Đường dẫn ảnh</th>
						<th>Đánh giá</th>
					</tr>
					<tr>
					</tr>
					<sql:setDataSource var="data" driver="com.mysql.cj.jdbc.Driver"
						url="jdbc:mysql://localhost:3306/manhuaweb" user="root"
						password="123456" />
					<sql:query var="result" dataSource="${data}">
					select * from manhua
				</sql:query>
					<c:forEach var="rows" items="${result.rows}">
						<tr>
							<td><c:out value="${rows.name}" /></td>
							<td><c:out value="${rows.author}" /></td>
							<td><c:out value="${rows.type}" /></td>
							<td><c:out value="${rows.imgUrl}" /></td>
							<td><c:out value="${rows.rating}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<!-- end: Content -->

		</div>
		/#content.span10
	</div>
	<!--/fluid-row-->

	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> <a href="#"
				class="btn btn-primary">Save changes</a>
		</div>
	</div>

	<div class="common-modal modal fade" id="common-Modal1" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-content">
			<ul class="list-inline item-details">
				<li><a href="http://themifycloud.com">Admin templates</a></li>
				<li><a href="http://themescloud.org">Bootstrap themes</a></li>
			</ul>
		</div>
	</div>

	<div class="clearfix"></div>

	<footer>

	<p>
		<span style="text-align: left; float: left">&copy; 2013 <a
			href="http://themifycloud.com/downloads/janux-free-responsive-admin-dashboard-template/"
			alt="Bootstrap_Metro_Dashboard">JANUX Responsive Dashboard</a></span>

	</p>

	</footer>

	<!-- start: JavaScript-->

 	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery-migrate-1.0.0.min.js"></script>

	<script src="js/jquery-ui-1.10.0.custom.min.js"></script>

	<script src="js/jquery.ui.touch-punch.js"></script>

	<script src="js/modernizr.js"></script>

	<script src="js/bootstrap.min.js"></script>

	<script src="js/jquery.cookie.js"></script>

	<script src='js/fullcalendar.min.js'></script>

	<script src='js/jquery.dataTables.min.js'></script>

	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.pie.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>

	<script src="js/jquery.chosen.min.js"></script>

	<script src="js/jquery.uniform.min.js"></script>

	<script src="js/jquery.cleditor.min.js"></script>

	<script src="js/jquery.noty.js"></script>

	<script src="js/jquery.elfinder.min.js"></script>

	<script src="js/jquery.raty.min.js"></script>

	<script src="js/jquery.iphone.toggle.js"></script>

	<script src="js/jquery.uploadify-3.1.min.js"></script>

	<script src="js/jquery.gritter.min.js"></script>

	<script src="js/jquery.imagesloaded.js"></script>

	<script src="js/jquery.masonry.min.js"></script>

	<script src="js/jquery.knob.modified.js"></script>

	<script src="js/jquery.sparkline.min.js"></script>

	<script src="js/counter.js"></script>

	<script src="js/retina.js"></script>

	<script src="js/custom.js"></script> 
	<!-- end: JavaScript-->
</body>
</html>