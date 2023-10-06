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
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
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
			swal('시작 날짜를 입력해주세요.');
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

		var isCheck = false; /* 확장자 체크에 충족하면 true가 됩니다. */
		const imgCheck = [ '.png', '.jpg' ]; /* 확장자 체크용 배열 */
		for (var i = 0; i < imgCheck.length; i++) {
			if (eimage + i[i].endsWith(imgCheck[i])) {
				isCheck = true;
				break;
			}
		}
		if (isCheck == false) {
			swal('이미지의 확장자는 png 또는 jpg 형식이어야 합니다.');
			return false;
		}
		var cnt = 0;
		for (var i = 1; i <= 5; i++) {
			alert('');
			if ($('#eimage' + i).val() != '') {
				cnt++;
				console.log("cnt >>>> " + cnt);
			}
		}
		if (cnt <= 3 || cnt == 0) {
			swal('이미지는 3개 이상 추가해야 등록 가능해요.');
			return false;
		}
	}
	/* function addElement() {
	 base++
	 var element = document.createElement("input");
	 element.type="file";
	 element.id = 'eimage1'+base;
	 document.body.appendChild(element)
	 } */
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
						<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
							<input type="hidden" name="command" value="evInsert">
							<!-- <input type="hidden" name="confirmDate" id="confirmDate" value="allDate"> -->
							<div class="mail_section_1">
								<input type="text" class="mail_text_date" placeholder="시작 날짜" name="startdate" id="startdate">
								<input type="text" class="mail_text_date" placeholder="종료 날짜" name="enddate" id="enddate">
								<input type="text" class="mail_text" placeholder="행사명" name="ename" id="ename">
								<input type="text" class="mail_text" placeholder="주최측 번호가 없으면 넣지 않으셔도 됩니다." name="ephoneno" id="ephoneno">
								<input type="text" class="mail_text" placeholder="행사 위치" name="eplace" id="eplace">
								<br />
								<textarea class="massage-bt" placeholder="행사내용" rows="5" id="econtent" name="econtent"></textarea>
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
								<!-- 	 <button onclick='addElement()'>+Add input</button> -->

								<div class="order_bt">
									<button type="submit" onclick="return validCheck();">등록</button>
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