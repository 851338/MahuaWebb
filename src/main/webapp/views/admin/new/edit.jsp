<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new" />
<c:url var="NewURL" value="/admin-new" />
<html>
<head>
<title>Cập nhật truyện</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
							chủ</a></li>
					<li class="active">Cập nhật truyện</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty messageResponse}">
							<div class="alert alert-${alert}">${messageResponse}</div>
						</c:if>
						<form id="formSubmit">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Thể
									loại</label>
								<div class="col-sm-9">
									<select class="form-control" id="categoryCode"
										name="categoryCode">
										<c:if test="${empty model.categoryCode}">
											<option value="">Chọn thể loại</option>
											<c:forEach var="item" items="${categories}">
												<option value="${item.code}">${item.name}</option>
											</c:forEach>
										</c:if>
										<c:if test="${not empty model.categoryCode}">
											<option value="">Chọn thể loại</option>
											<c:forEach var="item" items="${categories}">
												<option value="${item.code}"
													<c:if test="${item.code == model.categoryCode}">selected="selected"</c:if>>
													${item.name}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Tên
									truyện</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="name" name="name"
										value="${model.name}" />
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Hình
									đại diện</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" multiple onchange="processSelectedFiles(this)" id="imgUrl "
										name="imgUrl" value="${model.imgUrl}" />
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Tác
									giả</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="author"
										name="author" value="${model.author}" />
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Nhà
									xuất bản</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" id="publisher"
										name="publisher" value="${model.publisher}" />
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right">Nội
									dung</label>
								<div class="col-sm-9">
									<textarea rows="" cols="" id="content" name="content"
										style="width: 820px; height: 175px">${model.content}</textarea>
								</div>
							</div>
							<br /> <br />
							<div class="form-group">
								<div class="col-sm-12">
									<c:if test="${not empty model.id}">
										<input type="button"
											class="btn btn-white btn-warning btn-bold"
											value="Cập nhật truyện" id="btnAddOrUpdateNew" />
									</c:if>
									<c:if test="${empty model.id}">
										<input type="button"
											class="btn btn-white btn-warning btn-bold"
											value="Thêm truyện" id="btnAddOrUpdateNew" />
									</c:if>
								</div>
							</div>
							<input type="hidden" value="${model.id}" id="id" name="id" /> <input
								type="hidden" value="${model.categoryId}" id="type" name="type" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var editor = '';
		$(document).ready(function() {
			editor = CKEDITOR.replace('content');
		});

 		//var filePath = '';
/*		$('#imgUrl').on('change', function() {
			filePath = $(this).value;
			console.log(filePath);
		}); */
/* 		function processSelectedFiles(fileInput) {
			  var files = fileInput.files;

			  for (var i = 0; i < files.length; i++) {
			    console.log("Filename " + files[i].name);
			  }
			}
		const selectedFile = document.getElementById('imgUrl'); */

		$('#btnAddOrUpdateNew').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
	//		data["imgUrl"] = selectedFile.getData();
			data["content"] = editor.getData();
			var id = $('#id').val();
			if (id == "") {
				addNew(data);
			} else {
				updateNew(data);
			}
		});
		function addNew(data) {
			$
					.ajax({
						url : '${APIurl}',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${NewURL}?type=edit&id="
									+ result.id + "&message=insert_success";
						},
						error : function(error) {
							window.location.href = "${NewURL}?type=list&maxPageItem=4&page=1&message=error_system";
						}
					});

		}
		function updateNew(data) {
			$
					.ajax({
						url : '${APIurl}',
						type : 'PUT',
						contentType : 'application/json',
						data : JSON.stringify(data),
						dataType : 'json',
						success : function(result) {
							window.location.href = "${NewURL}?type=edit&id="
									+ result.id + "&message=update_success";
						},
						error : function(error) {
							window.location.href = "${NewURL}?type=list&maxPageItem=4&page=1&message=error_system";
						}
					});
		}
	</script>
</body>
</html>
