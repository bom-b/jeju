<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/common/bootstrap5.jsp"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>

<!-- style.css -->
<link href="<%=appName%>/assets/css_food/foodDetail_Insert.css"
	rel="stylesheet">
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
 
	 // 폼 유효성 검사
    function validCheck() {
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

        alert('수정이 완료되었습니다.');

        // 일정 시간 후 메시지 자동으로 사라지도록 설정
        setTimeout(function () {
            $('.alert').fadeOut('slow');
        }, 3000); // 3초 후에 메시지 사라짐
    }
  		}
  	</script>
</head>
<body>
	<div class="main container-xxl py-5">
		<div class="container my-5 py-5">
			<div class="insert-title text-left wow fadeInUp"
				data-wow-delay="0.1s">
				<h2>게시물 등록</h2>
			</div>
			<div class="mainBox container my-5 py-5 wow fadeInUp"
				data-wow-delay="0.1s">
				<form class="text-left container my-5 py-5"
					action="<%=withFormTag%>" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="command" value="frUpdate"> <span><span
						class="caution">* </span> 필수 입력사항 입니다.</span><br>
					<br>
					<div class="form-group my-5 py-5">
						<label for="title"><span class="caution">* </span>작성자명 : </label>
						<input type="text" class="form-control short-input" id="fakeid"
							name="fakeid"
							value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님"
							disabled="disabled"> <input type="hidden" id="id"
							name="id" value="${sessionScope.loginfo.id}">
					</div>

					<div class="form-group my-5 py-5">
						<label for="title"><span class="caution">* </span>글 제목 : </label>
						<input id="oname" name="oname" type="text"
							class="form-control short-input" placeholder="글 제목을 입력하여 주세요">
					</div>

					<div class="form-group my-5 py-5">
						<label for="ocontent"><span class="caution">* </span>글 내용</label>
						<input id="ocontent" name="ocontent" type="text"
							class="form-control short-input" placeholder="글 내용을 입력하여 주세요">
					</div>
					<div class="form-group">
						<label for="pcategory">카테고리 : </label> <select id="pcategory"
							name="pcategory" class="form-control short-input">
							<option value="잡담">잡담</option>
							<option value="정보공유">정보공유</option>
							<option value="질문">질문</option>
						</select>
					</div>
					<div class="form-group my-5 py-5">
						<span class="caution">* </span>이미지 파일 (자유) </label> <input type="file"
							class="form-control-file border" id="oimage1" name="oimage1">
						<input type="file" class="form-control-file border" id="oimage2"
							name="oimage2"> <input type="file"
							class="form-control-file border" id="oimage3" name="oimage3">
						<input type="file" class="form-control-file border" id="oimage4"
							name="oimage4"> <input type="file"
							class="form-control-file border" id="oimage5" name="oimage5">
					</div>
					<div class="form-group my-5 py-5">
						<label for="oregdate"><span class="caution">* </span>작성일 :
						</label> <input type="text" class="form-control short-input" id="oregdate"
							name="oregdate" readonly>
					</div>

					<script type="text/javascript">
    // 현재 날짜를 가져오는 함수
    function getCurrentDate() {
        var currentDate = new Date();
        var year = currentDate.getFullYear();
        var month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더하고 2자리로 포맷팅
        var day = String(currentDate.getDate()).padStart(2, '0'); // 날짜를 2자리로 포맷팅
        return year + '/' + month + '/' + day;
    }

    // 작성일 입력란에 현재 날짜 채우기
    document.getElementById("oregdate").value = getCurrentDate();
</script>

					<div id="buttonset" class="input-group">
						<button type="submit" class="btn btn-primary btn-lg"
							onclick="return validCheck();">수정</button>
						&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
					</div>
			</div>
			</form>
		</div>
</body>
</html>