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
<!-- 달력 -->
<script type="text/javascript" src="<%=appName%>/assets/css_eventmain/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#startdate').datepicker({
			  changeMonth: true,
			  changeYear: true
	});
	$('#enddate').datepicker({
		  changeMonth: true,
		  changeYear: true
	});
	 $.datepicker.setDefaults({
		 dateFormat: 'yy-mm-dd', //Input Display Format 변경
			 monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	 });
})
function readURL(input) {
  if (input.files && input.files[0]) {
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
</script>
</head>
<body>
	<!-- contact section start -->
	<div class="contact_section">
		<div class="container">
			<div class="contact_section_2">
				<div class="row">
					<div class="col-md-12">
						<h1 class="contact_taital">행사 등록</h1>
						<form action="">
							<div class="mail_section_1">
							<input type="text" class="mail_text_date" placeholder="시작 날짜" name="startdate" id="startdate">
							<input type="text" class="mail_text_date" placeholder="종료 날짜" name="enddate" id="enddate">
								<input type="text" class="mail_text" placeholder="행사명" name="ename">
								<input type="text" class="mail_text" placeholder="주최측 번호" name="ephoneno">
								<input type="text" class="mail_text" placeholder="행사 위치" name="eplace"><br/>
								<input class="mail_text" type="file" id="eimage1" name="eimage1" onchange="readURL(this);" style="margin:20px auto 0px auto">		
								<img id="image_section" class="image_preview" style="display: none;"/><br/>
								<textarea class="massage-bt" placeholder="행사내용" rows="5" id="econtent" name="econtent"></textarea>
								<div class="order_bt">
									<a href="#">등록</a>
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