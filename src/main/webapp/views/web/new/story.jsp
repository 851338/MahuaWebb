<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-story" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${model.name}</title>
</head>
<body>
	<div class="st1">
		<h1>${model.name}</h1>
		<div class="st2">
			${model.content}
		</div>
		<div class="st5">
			<h2>Bình luận</h2>
			<input class="st3" type="text" name="comment" id="comment">
			<button id="btnComment" type="button" onclick="displayComment()">Comment</button>
			<div class="st4" id="themvaoday">
				<c:forEach var="item" items="${comment.listResult}">
					<p>
						<b>${item.createdBy}: </b>${item.content}</p>
				</c:forEach>
			</div>
		</div>
	</div>


	<script>
		var input1 = document.getElementById("comment");
		input1.addEventListener("keyup", function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
				document.getElementById("btnComment").click();
			}
		});
		function displayComment() {
			var input = document.getElementById("comment");
			var p = document.createElement("p");
			var check = {};
			check["newId"] = ${USERMODEL.userName};
			if(check["newId"] === "") {
				alert("asd");
			} else {
				p.innerHTML = "<b>${USERMODEL.userName}: </b>" + input.value;
				themvaoday.appendChild(p);				
			}

		}
		$('#btnComment').click(function() {
			var input = document.getElementById("comment")
			var data = {};
			data["content"] = input.value;
			data["newId"] = ${model.id};
			addComment(data);
		});
		function addComment(data) {
			$.ajax({
				url : '${APIurl}',
				type : 'POST',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
				}
			});
			document.getElementById("comment").value = "";
		}
	</script>
</body>
</html>