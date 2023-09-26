<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 맛집 전용 style.css -->
<link href="<%=appName%>/assets/css_food/foodDetail_Insert.css" rel="stylesheet">

<script>
	$(document).ready(function(){
		$('#inputdate').datepicker({dateFormat: "yy/mm/dd"});		
		
		/* $("#category").prepend('<option value="aaa">bbb</option>'); */
		/* $('option').eq(2).attr('selected', true); */
	});
	
	/* form validation check */
	function validCheck(){
		
		/* 상품명은 4글자 이상 10글자 이하이어야 합니다. */
		var name = $('#name').val();
		if(name.length < 4 || name.length > 10){
			swal('상품명은 4글자 이상 10글자 이하이어야 합니다.');
			$('#name').focus();
			return false; 
		}
		
		/* 제조 회사는 4글자 이상 10글자 이하이어야 합니다. */
		var company = $('#company').val();
		if(company.length < 4 || company.length > 10){
			swal('제조 회사는 4글자 이상 10글자 이하이어야 합니다.');
			$('#company').focus();
			return false; 
		}
		
		/* 상품에 대한 코멘트는 10글자 이상 30글자 이하이어야 합니다. */
		var contents = $('#contents').val();
		if(contents.length < 10 || contents.length > 30){
			swal('상품에 대한 코멘트는 10글자 이상 30글자 이하이어야 합니다.');
			$('#contents').focus();
			return false; 
		}
		
		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#image01').prop('files')[0];
		if(!selectedFile){
			swal('이미지 파일을 업로드 해주세요.');
			$('#image01').focus();
			return false; 
		}
		
		/* 이미지의 확장자는 png 또는 jpg 형식이어야 합니다. */
		var fileName = selectedFile.name;
		var fileExtension = fileName.split('.').pop().toLowerCase();
		if (fileExtension !== 'png' && fileExtension !== 'jpg') {
			swal('이미지의 확장자는 png 또는 jpg 형식이어야 합니다.');
			$('#image01').focus();
			return false; 
		}
		
		/* 재고는(은) 숫자 형식이어야 합니다. */
		var regex = /^[0-9]+$/;
		var stock = $('#stock').val();
		var result = regex.test(stock);
		if(result == false){
			swal('재고는(은) 숫자 형식이어야 합니다.');
			$('#stock').focus();
			return false;
		}
		
		/* 재고는 최대 5개까지입니다. */
		if(stock > 5){
			swal('재고는 최대 5개까지입니다.');
			$('#stock').focus();
			return false; 
		}
		
		/* 단가는(은) 숫자 형식이어야 합니다. */
		var regex = /^[0-9]+$/;
		var price = $('#price').val();
		var result = regex.test(price);
		if(result == false){
			swal('재고는(은) 숫자 형식이어야 합니다.');
			$('#price').focus();
			return false;
		}
		
		/* 단가는(은) 100이상 10000이하의 값이어야 합니다. */
		if(price > 10000 || price < 100){
			swal('단가는(은) 100이상 10000이하의 값이어야 합니다.');
			$('#price').focus();
			return false; 
		}
		
		/* 포인트는(은) 숫자 형식이어야 합니다. */
		var regex = /^[0-9]+$/;
		var point = $('#point').val();
		var result = regex.test(point);
		if(result == false){
			swal('포인트는(은) 숫자 형식이어야 합니다.');
			$('#point').focus();
			return false;
		}
		
		/* 포인트는(은) 3이상 10이하의 값이어야 합니다. */
		if(point > 10 || point < 3){
			swal('포인트는(은) 3이상 10이하의 값이어야 합니다.');
			$('#point').focus();
			return false; 
		}
		
		/* 카테고리를 반드시 선택해 주세요. */
		var category = $('#category').val();
		if(category == '-') {
			swal('카테고리를 반드시 선택해 주세요.');
			$('#category').focus();
			return false;
		}
		
		
		
		/* 날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요. */
		var regdate = $('#inputdate').val();
		var regex1 = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/;
		var regex2 = /^\d{4}\-[01]\d{1}\-[0123]\d{1}$/;
		var result1 = regex1.test(regdate);
		var result2 = regex2.test(regdate);
		
		if(result1 == false && result2 == false){
			swal('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
			$('#inputdate').focus();
			return false;
		}
		
	}
</script>

<style type="text/css">
h2, p {
	margin: 15px;
}

.input-group {
	margin: 15px;
}

.input-group-text {
	display: block;
	margin-left: auto;
	margin-right: auto;
}

#buttonset {
	margin-top: 25px;
}

.radio_gender, .checkbox_hobby {
	font-size: 0.9rem; /* 주위 글꼴의 1.1배 */

}

#productPnum{ /* 상품번호 안보이게 지정 */
	display: none;
	visibility: hidden;
}

</style>
</head>
<body>

	<div class="main container-xxl py-5">
	<div class="container my-5 py-5">
		<div class="insert-title text-left">
			<h2>알고계신 맛집을 공유해주세요.</h2>
		</div>
		<div class="mainBox container my-5 py-5 wow fadeInUp" data-wow-delay="0.3s">
		<form class="text-left container my-5 py-5" action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="prInsert">
			<span><span class="caution">* </span> 필수 입력사항 입니다.</span><br><br>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>작성자명 : </label>
			  <input type="text" class="form-control short-input" id="title" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님" disabled="disabled" >
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>맛집 이름 : </label>
			  <input type="text" class="form-control short-input" id="title">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>카테고리 : </label>
			  <input type="text" class="form-control short-input" id="title">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>영업시간 : </label>
			  <input type="text" class="form-control short-input" id="title">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>브레이크타임 : </label>
			  <input type="text" class="form-control short-input" id="title">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>전화번호 : </label>
			  <input type="text" class="form-control short-input" id="title">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>메뉴(메뉴1 / 메뉴2 / ... 형식으로 입력해주세요.) : </label>
			  <input type="text" class="form-control long-input" id="title">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>주소 : </label>
			  <input type="text" class="form-control long-input" id="title">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>대표이미지 파일 : </label>
			  <input type="file" class="form-control-file border">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title">추가이미지 파일 : </label>
			  <input type="file" class="form-control-file border">
			  <input type="file" class="form-control-file border">
			  <input type="file" class="form-control-file border">
			  <input type="file" class="form-control-file border">
			</div>
			
			
			<div id="buttonset" class="input-group my-5 py-5">
				<button type="submit" class="btn btn-primary" onclick="return validCheck();">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
		</div>
	</div>
	</div>
				
</body>
</html>