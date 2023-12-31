<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 게시판 메인 전용 부트스트랩 -->
<link rel="stylesheet" href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">
<link href="<%=appName%>/assets/css_boardmain/style.css" rel="stylesheet">
<!-- 게시판 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_eventmain/eventmain.css" rel="stylesheet">
<link rel="stylesheet" href="<%=appName%>/assets/css_eventmain/selectbox.min.css">
<script type="text/javascript" src="<%=appName%>/assets/css_eventmain/selectbox.min.js"></script>
<!-- 달력 -->
<script type="text/javascript" src="<%=appName%>/assets/css_eventmain/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	/* 이전에 선택했던 카테고리 정보가 자동으로 선택되어 있도록 합니다. */
	var category = '${requestScope.bean.evsection}';
	var engName = '';
	if (category === "진행중") {
	    engName = "진행중";
	} else if (category === "종료") {
	    engName = "종료";
	} else if (category === "예정중") {
	    engName = "예정중";
	} 
	
	var optionList = $('#category option');

	$('#category option').each(function(){
        if($(this).val() == engName){
            $(this).prop('selected', true);
        }
    });
	
});
	$(function() {
		$('#startdate').datepicker({
			changeMonth : true,
			changeYear : true
		});
		$('#enddate').datepicker({
			changeMonth : true,
			changeYear : true
		});
		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd', //Input Display Format 변경
		/* 	monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], */
		});
	})
	function readURL(input) {
		if (input.files && input.files[1]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById("image_section").style.display = "block";
				document.getElementById('image_section').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('image_section').src = "";
		}
	}
	//var base = 0;
	function validCheck() {
		var startdate = $('#startdate').val();
		if (startdate.length == 0) {
			alert('시작 날짜를 입력해주세요.');
			$('#startdate').focus();
			return false;
		}
		var enddate = $('#enddate').val();
		if (enddate.length == 0) {
			swal('종료 날짜를 입력해주세요.');
			$('#enddate').focus();
			return false;
		}
		var ename = $('#ename').val();
		if (ename.length == 0) {
			swal('행사명을 입력해주세요.');
			$('#ename').focus();
			return false;
		}
		var eplace = $('#eplace').val();
		if (eplace.length == 0) {
			swal('행사위치를 입력해주세요.');
			$('#eplace').focus();
			return false;
		}
		var econtent = $('#econtent').val();
		if (econtent.length == 0) {
			swal('행사내용을 입력해주세요.');
			$('#econtent').focus();
			return false;
		}
		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#eimage1').prop('files')[0];
		if (!selectedFile) {
			swal('이미지는 최소 3장 이상 등록해주세요.');
			$('#eimage1').focus();
			return false;
		}

		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#eimage2').prop('files')[0];
		if (!selectedFile) {
			swal('이미지는 최소 3장 이상 등록해주세요.');
			$('#eimage2').focus();
			return false;
		}

		/* 이미지는 필수 입력 사항입니다. */
		var selectedFile = $('#eimage3').prop('files')[0];
		if (!selectedFile) {
			swal('이미지는 최소 3장 이상 등록해주세요.');
			$('#eimage3').focus();
			return false;
		}

		var isCheck = false; /* 확장자 체크에 충족하면 true가 됩니다. */

		const imgCheck = [ '.png', '.jpg' ]; /* 확장자 체크용 배열 */
		for (var i = 0; i < imgCheck.length; i++) {
			if (eimage + i[i].endsWith(imgCheck[i])) {
				isCheck = true;
				break;
			}
		}
</script>
<style type="text/css">
* {
	font-family: 'TheJamsil400';
}

input[type="submit"] {
	font-family: 'TheJamsil400';
	color: #757575;
	width: 100px;
	padding: 5px;
	font-size: 20px;
	cursor: pointer;
	border: 3px solid #84c0a0 !important;
	background: #ffffff;
	border-radius: 4px;
	box-shadow: 2px 2px 15px #ccc;
	transition: 150ms linear all;
}

input[type="submit"]:hover {
	background: #9eb384;
}

input[type="submit"]:focus, input[type="submit"]:active {
	outline: none;
}

.justwrap {
	margin-bottom: 50px;
}
</style>
</head>
<body>
	<!-- contact section start -->
	<div class="contact_section" style="margin-top: 130px;">
		<div class="container">
			<div class="contact_section_2">
				<div class="row">
					<div class="col-md-12">
						<h1 class="contact_taital">행사 수정</h1>
						<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
							<input type="hidden" name="command" value="evUpdate">
							<%-- 	<input type="text" name="evsection" value="${requestScope.bean.evsection}">  --%>
							<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
							<input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
							<input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
							<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">


							<input type="hidden" name="eno" value="<%=request.getParameter("eno")%>">
							<div class="mail_section_1">
								<input type="text" class="mail_text_date" name="startdate" id="startdate" value="${requestScope.bean.startdate }">
								<input type="text" class="mail_text_date" name="enddate" id="enddate" value="${requestScope.bean.enddate}">
								<input type="text" class="mail_text" name="ename" id="ename" value="${requestScope.bean.ename}">
								<input type="text" class="mail_text" name="ephoneno" id="ephoneno" value="${requestScope.bean.ephoneno }">
								<input type="text" class="mail_text" name="eplace" id="eplace" value="${requestScope.bean.eplace}">
								<br />
								
								<textarea class="massage-bt" placeholder="행사내용" rows="5" id="econtent" name="econtent" >${requestScope.bean.econtent}</textarea>
								<input class="mail_text" type="file" id="eimage1" name="eimage1" onchange="readURL(this);" style="margin: 20px auto 0px auto">
								<img id="image_section" class="image_preview" style="display: none; margin: 0 auto" />
								<br />
								<input class="mail_text" type="file" id="eimage2" name="eimage2" onchange="readURL(this);" style="margin: 0 auto">
								<img id="image_section" class="image_preview" style="display: none; margin: 0 auto" />
								<br />
								<input class="mail_text" type="file" id="eimage3" name="eimage3" onchange="readURL(this);" style="margin: 0 auto">
								<img id="image_section" class="image_preview" style="display: none; margin: 0 auto" />
								<br />
								<input class="mail_text" type="file" id="eimage4" name="eimage4" onchange="readURL(this);" style="margin: 0 auto">
								<img id="image_section" class="image_preview" style="display: none; margin: 0 auto" />
								<br />
								<input class="mail_text" type="file" id="eimage5" name="eimage5" onchange="readURL(this);" style="margin: 0 auto">
								<img id="image_section" class="image_preview" style="display: none; margin: 0 auto" />
								<br />
								<div>
									<!-- 	<label for="evsection" class="insertGu">구분</label> -->
									<select name="evsection" id="evsection" class="justselect">
										<option value="진행중">진행중</option>
										<option value="종료">종료</option>
										<option value="예정중">예정중</option>
									</select>
								</div>


								<div class="order_bt">
									<input type="submit" value="수정" onclick="return validCheck();">
									<!-- 	<button type="submit" >등록</button> -->
								</div>
							</div>
						</form>
					</div>
				</div>

				<!-- order section end -->
			</div>
		</div>
	</div>
	<!-- contact section end -->
</body>
</html>