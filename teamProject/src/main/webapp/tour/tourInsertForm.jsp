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
<link href="<%=appName%>/assets/css_tour/tourDetail_Insert.css" rel="stylesheet">
<link href="<%=appName%>/assets/css/font-All.css" rel="stylesheet">

<script>

	/* Tour validation check */
	function validCheck(){
		
		/* 관광지 이름을 작성하셔야 합니다. */
		var name = $('#ttitle').val();
		if(name.length < 1){
			swal('관광지 이름을 작성해주세요.');
			$('#ttitle').focus();
			return false; 
		}
		
		/* 카테고리를 선택해 주세요. */
		var category = $('#tcategory').val();
		if(category == '-') {
			swal('카테고리를 선택해 주세요.');
			$('#tcategory').focus();
			return false;
		}
		
		/* 영업시간을 작성해주세요. */
		var name = $('#ttime').val();
		if(name.length < 1){
			swal('영업시간을 작성해주세요.');
			$('#ttime').focus();
			return false; 
		}
		
		/* 브레이크타임을 작성해주세요. */
		var name = $('#tbreaktime').val();
		if(name.length < 1){
			swal('브레이크타임을 작성해주세요.');
			$('#tbreaktime').focus();
			return false; 
		}
		
		/* 전화번호를 작성해주세요. */
		var name = $('#tphoneno').val();
		if(name.length < 1){
			swal('전화번호를 작성해주세요.');
			$('#tphoneno').focus();
			return false; 
		}
		
		/* 메뉴를 작성해주세요. */
		var name = $('#tmenu').val();
		if(name.length < 1){
			swal('메뉴를 작성해주세요.');
			$('#tmenu').focus();
			return false; 
		}
		
		/* 주소를 작성해주세요. */
		var name = $('#tplace').val();
		if(name.length < 1){
			swal('주소를 작성해주세요.');
			$('#tplace').focus();
			return false; 
		}
		
		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#timage1').prop('files')[0];
		if(!selectedFile){
			swal('대표이미지 파일을 업로드 해주세요.');
			$('#timage1').focus();
			return false; 
		}
		
		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#timage2').prop('files')[0];
		if(!selectedFile){
			swal('이미지는 대표이미지 포함 최소 3장 이상 업로드 해주세요.');
			$('#timage2').focus();
			return false; 
		}
		
		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#timage3').prop('files')[0];
		if(!selectedFile){
			swal('이미지는 대표이미지 포함 최소 3장 이상 업로드 해주세요.');
			$('#timage3').focus();
			return false; 
		}
		
		/* 이미지의 확장자는 png 또는 jpg 형식이어야 합니다. */
		var fileName = selectedFile.name;
		var fileExtension = fileName.split('.').pop().toLowerCase();
		if (fileExtension !== 'png' && fileExtension !== 'jpg') {
			swal('이미지의 확장자는 png 또는 jpg 형식이어야 합니다.');
			$('#timage1').focus();
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
			<h2>알고계신 관광지를 공유해주세요.</h2>
		</div>
		<div class="mainBox container my-5 py-5 wow fadeInUp" data-wow-delay="0.1s">
		<form class="text-left container my-5 py-5" action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="trInsert">
			<span><span class="caution">* </span> 필수 입력사항 입니다.</span><br><br>
			<div class="form-group my-5 py-5">
			  <label for="title"><span class="caution">* </span>작성자명 : </label>
			  <input type="text" class="form-control short-input" id="fakeid" name="fakeid" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님" disabled="disabled" >
			  <input type="hidden" id="id" name="id" value="${sessionScope.loginfo.id}">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="ttitle"><span class="caution">* </span>관광지 이름 : </label>
			  <input type="text" class="form-control short-input" id="ttitle" name="ttitle">
			</div>
			<div class="form-group">
			  <label for="tcategory">카테고리 : </label>
			  <select class="form-control short-input" id="tcategory" name="tcategory">
			    <option value="ac">액티비티 체험</option>
			    <option value="or">오름 명소</option>
			    <option value="sea">해수욕장</option>
			    <option value="te">테마파크</option>
			  </select>
			</div>
			<div class="form-group my-5 py-5">
			  <label for="ttime"><span class="caution">* </span>영업시간 : </label>
			  <input type="text" class="form-control short-input" id="ttime" name="ttime">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="tbreaktime"><span class="caution">* </span>브레이크타임 : </label>
			  <input type="text" class="form-control short-input" id="tbreaktime" name="tbreaktime">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="tphoneno"><span class="caution">* </span>전화번호 : </label>
			  <input type="text" class="form-control short-input" id="tphoneno" name="tphoneno">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="tmenu"><span class="caution">* </span>가격표(가격표1 : 20000원 / 가격표2 : 15000원 / ... 형식으로 입력해주세요.) : </label>
			  <input type="text" class="form-control long-input" id="tmenu" name="tmenu">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="tplace"><span class="caution">* </span>주소 : </label>
			  <input type="text" class="form-control long-input" id="tplace" name="tplace">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="timage1"><span class="caution">* </span>대표이미지 파일 : </label>
			  <input type="file" class="form-control-file border" id="timage1" name="timage1">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="timage2"><span class="caution">* </span>필수 추가이미지 파일 : </label>
			  <input type="file" class="form-control-file border" id="timage2" name="timage2">
			  <input type="file" class="form-control-file border" id="timage3" name="timage3">
			</div>
			<div class="form-group my-5 py-5">
			  <label for="timage4">선택 추가이미지 파일 : </label>
			  <input type="file" class="form-control-file border" id="timage4" name="timage4">
			  <input type="file" class="form-control-file border" id="timage5" name="timage5">
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