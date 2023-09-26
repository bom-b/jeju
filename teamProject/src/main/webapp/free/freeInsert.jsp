<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/bootstrap5.jsp"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<style type="text/css">
.insert-container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background-image: url('assets/img/loginbackground.jpeg');
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
}

.input-group {
	margin: 7px;
}

.input-group-text {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

#buttonset {
	margin-top: 15px;
}

.radio_gender, .checkbox_hobby {
	font-size: 1.1rem; /* 주위 글꼴의 1.1배 */
}

@font-face {
	font-family: 'SDMiSaeng'; /*글꼴*/
	src: local('SDMiSaeng'), url('SDMiSaeng.eot'), url('SDMiSaeng.woff')
		format('woff'), url('assets/font-awesome/fonts/SDMiSaeng.ttf')
		format('truetype');
}

.sdms-font {
	font-family: 'SDMiSaeng', sans-serif; /*웹 폰트 지정*/
	color: orange;
}

h2 {
	font-size: 70px;
}
</style>
<script type="text/javascript">
  		$(document).ready(function(){
  	  		/* $('#regdate').datepicker(); */
  	  		$('#regdate').datepicker({dateFormat: "yy/mm/dd"});  	  	 
  		});
  		
  		function validCheck(){/* 폼 유효성 검사 */  			
  			var subject = $('#oname').val();
  			if(subject.length < 3 || subject.length > 20){
  				alert('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
  				$('#oname').focus() ;
  				return false ;
  			}
  			
  			var content = $('#ocontent').val();
  			if(content.length < 5 || content.length > 30){
  				alert('글 내용은 5글자 이상 30글자 이하이어야 합니다.');
  				$('#ocontent').focus() ;
  				return false ;
  			}
  			
  		}
  	</script>
</head>
<body>
	<div class="container">
		<h2>게시물 등록</h2>

		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="pageNumber"
				value="<%=request.getParameter("pageNumber")%>"> <input
				type="hidden" name="pageSize"
				value="<%=request.getParameter("pageSize")%>"> <input
				type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
			<input type="hidden" name="keyword"
				value="<%=request.getParameter("keyword")%>"> <input
				type="hidden" name="command" value="frInsert">
			<div class="col-md-6">
				<div class="input-group">
					<span class="input-group-text col-md-2">작성자</span>
					<c:set var="userInfo"
						value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})" />
					<input id="fakeid" name="fakeid" disabled="disabled" type="text"
						class="form-control" placeholder="" value="${userInfo}"> <input
						id="id" name="id" type="hidden" value="${sessionScope.loginfo.id}">
				</div>

				<div class="input-group">
					<span class="input-group-text col-md-2">글 제목</span> <input
						id="oname" name="oname" type="text" class="form-control"
						placeholder="">
				</div>

				<div class="input-group">
					<span class="input-group-text col-md-2">글 내용</span> <input
						id="ocontent" name="ocontent" type="text" class="form-control"
						placeholder="">
				</div>
				<div class="input-group">
					<span class="input-group-text col-md-2">글 카테고리</span> <select
						id="pcategory" name="pcategory" class="form-select">
						<option value="잡담">잡담</option>
						<option value="정보공유">정보공유</option>
						<option value="질문">질문</option>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="input-group">
					<span class="input-group-text col-md-2">이미지 1</span> <input
						id="oimage1" name="oimage1" type="file" class="form-control"
						accept="image/*">
				</div>

				<div class="input-group">
					<span class="input-group-text col-md-2">이미지 2</span> <input
						id="oimage2" name="oimage2" type="file" class="form-control"
						accept="image/*">
				</div>

				<div class="input-group">
					<span class="input-group-text col-md-2">이미지 3</span> <input
						id="oimage3" name="oimage3" type="file" class="form-control"
						accept="image/*">
				</div>

				<div class="input-group">
					<span class="input-group-text col-md-2">이미지 4</span> <input
						id="oimage4" name="oimage4" type="file" class="form-control"
						accept="image/*">
				</div>

				<div class="input-group">
					<span class="input-group-text col-md-2">이미지 5</span> <input
						id="oimage5" name="oimage5" type="file" class="form-control"
						accept="image/*">
				</div>

				<div id="buttonset" class="input-group">
					<button type="submit" class="btn btn-primary btn-lg"
						onclick="return validCheck();">등록</button>
					&nbsp;&nbsp;&nbsp;
					<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>