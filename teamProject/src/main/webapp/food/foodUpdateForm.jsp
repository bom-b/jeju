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
	
		/* 이전에 선택했던 카테고리 정보가 자동으로 선택되어 있도록 합니다. */
		var category = '${requestScope.bean.category}';
		var engName = '';
		if (category === "한식") {
		    engName = "ko";
		} else if (category === "세계음식") {
		    engName = "fo";
		} else if (category === "카페") {
		    engName = "ca";
		} else if (category === "술집") {
		    engName = "be";
		}
		
		var optionList = $('#category option');
	
		$('#category option').each(function(){
	        if($(this).val() == engName){
	            $(this).prop('selected', true);
	        }
	    });
		
	});


	/* form validation check */
	function validCheck(){
		
		/* 맛집 이름을 작성하셔야 합니다. */
		var name = $('#title').val();
		if(name.length < 1){
			swal('맛집 이름을 작성해주세요.');
			$('#title').focus();
			return false; 
		}
		
		/* 카테고리를  선택해 주세요. */
		var category = $('#category').val();
		if(category == '-') {
			swal('카테고리를 선택해 주세요.');
			$('#category').focus();
			return false;
		}
		
		/* 영업시간을 작성해주세요. */
		var name = $('#time').val();
		if(name.length < 1){
			swal('영업시간을 작성해주세요.');
			$('#time').focus();
			return false; 
		}
		
		/* 브레이크타임을 작성해주세요. */
		var name = $('#breaktime').val();
		if(name.length < 1){
			swal('브레이크타임을 작성해주세요.');
			$('#breaktime').focus();
			return false; 
		}
		
		/* 전화번호를 작성해주세요. */
		var name = $('#phoneno').val();
		if(name.length < 1){
			swal('전화번호를 작성해주세요.');
			$('#phoneno').focus();
			return false; 
		}
		
		/* 메뉴를 작성해주세요. */
		var name = $('#menu').val();
		if(name.length < 1){
			swal('메뉴를 작성해주세요.');
			$('#menu').focus();
			return false; 
		}
		
		/* 주소를 작성해주세요. */
		var name = $('#place').val();
		if(name.length < 1){
			swal('주소를 작성해주세요.');
			$('#place').focus();
			return false; 
		}
		
		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#image1').prop('files')[0];
		if(!selectedFile){
			swal('대표이미지 파일을 업로드 해주세요.');
			$('#image1').focus();
			return false; 
		}
		
		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#image2').prop('files')[0];
		if(!selectedFile){
			swal('이미지는 대표이미지 포함 최소 3장 이상 업로드 해주세요.');
			$('#image2').focus();
			return false; 
		}
		
		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#image3').prop('files')[0];
		if(!selectedFile){
			swal('이미지는 대표이미지 포함 최소 3장 이상 업로드 해주세요.');
			$('#image3').focus();
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
	}
</script>

<style type="text/css">

</style>
</head>
<body>

	<div class="main container-xxl py-5">
	<div class="container my-5 py-5">
		<div class="insert-title text-left wow fadeInUp" data-wow-delay="0.1s">
			<h2>게시글 수정</h2>
		</div>
		<div class="mainBox container my-5 py-5 wow fadeInUp" data-wow-delay="0.1s">
		<form class="text-left container my-5 py-5" action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="fdUpdate">
			<input type="hidden" name="no" value="${requestScope.bean.no}">
			<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>"> 
			<input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
			<input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
			<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
			
			<span><span class="caution">* </span> 필수 입력사항 입니다.</span><br><br>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>작성자명 : </label>
			  <input type="text" class="form-control short-input" id="fakeid" name="fakeid" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님" disabled="disabled" >
			  <input type="hidden" id="id" name="id" value="${sessionScope.loginfo.id}">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>맛집 이름 : </label>
			  <input type="text" class="form-control short-input" id="title" name="title" value="${requestScope.bean.title}">
			</div>
			<div class="form-group">
			  <label for="category">카테고리 : </label>
			  <select class="form-control short-input" id="category" name="category">
			    <option value="ko">한식</option>
			    <option value="fo">세계음식</option>
			    <option value="ca">카페</option>
			    <option value="be">술집</option>
			  </select>
			</div>
			<div class="form-group my-5 py-5">
			  <label for="time"><span class="caution">* </span>영업시간 : </label>
			  <input type="text" class="form-control short-input" id="time" name="time" value="${requestScope.bean.time}">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="breaktime"><span class="caution">* </span>브레이크타임 : </label>
			  <input type="text" class="form-control short-input" id="breaktime" name="breaktime" value="${requestScope.bean.breaktime}">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="phoneno"><span class="caution">* </span>전화번호 : </label>
			  <input type="text" class="form-control short-input" id="phoneno" name="phoneno" value="${requestScope.bean.phoneno}">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="menu"><span class="caution">* </span>메뉴(메뉴1 / 메뉴2 / ... 형식으로 입력해주세요.) : </label>
			  <input type="text" class="form-control long-input" id="menu" name="menu" value="${requestScope.bean.menu}">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="place"><span class="caution">* </span>주소 : </label>
			  <input type="text" class="form-control long-input" id="place" name="place" value="${requestScope.bean.place}">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="image1"><span class="caution">* </span>대표이미지 파일 : </label>
			  <input type="file" class="form-control-file border" id="image1" name="image1" value="${requestScope.bean.image1}">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="image2"><span class="caution">* </span>필수 추가이미지 파일 : </label>
			  <input type="file" class="form-control-file border" id="image2" name="image2" value="${requestScope.bean.image2}">
			  <input type="file" class="form-control-file border" id="image3" name="image3" value="${requestScope.bean.image3}">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="image4">선택 추가이미지 파일 : </label>
			  <input type="file" class="form-control-file border" id="image4" name="image4" value="${requestScope.bean.image4}">
			  <input type="file" class="form-control-file border" id="image5" name="image5" value="${requestScope.bean.image5}">
			</div>
			
			
			<div id="buttonset" class="input-group my-5 py-5">
				<button type="submit" class="btn btn-primary" onclick="return validCheck();">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>
			</div>
		</form>
		</div>
	</div>
	</div>
				
</body>
</html>