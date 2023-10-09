<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 게시판 메인 전용 부트스트랩 -->
<link rel="stylesheet"
	href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">
<link href="<%=appName%>/assets/css_boardmain/style.css"
	rel="stylesheet">
<!-- 게시판 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_eventmain/eventmain.css"
	rel="stylesheet">
	<link rel="stylesheet" href="<%=appName%>/assets/css_eventmain/selectbox.min.css">
<script type="text/javascript" src="<%=appName%>/assets/css_eventmain/selectbox.min.js"></script>
<!-- 달력 -->
<script type="text/javascript"
	src="<%=appName%>/assets/css_eventmain/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var evsection = '${requestScope.bean.evsection}'
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
	
	}
</script>
<style type="text/css">
input[type="submit"] {
        margin: 10px 0 10px 3px;
        width: 100px;
        padding: 5px;
        font-size: 10pt;
        font-weight: bold;
        cursor: pointer;
        border: 1px solid #FF747D;
        background: #ffffff;
        border-radius: 5px;
        box-shadow: 2px 2px 15px #ccc;
        transition: 150ms linear all;
      }

      input[type="submit"]:hover {
        background: #FF747D;
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
	<div class="contact_section">
		<div class="container">
			<div class="contact_section_2">
				<div class="row">
					<div class="col-md-12">
						<h1 class="contact_taital">행사 수정</h1>
						<form action="<%=withFormTag%>" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="command" value="evUpdate"> 
			<input type="text" name="evsection" value="${requestScope.bean.evsection}"> 
							<input
								type="hidden" name="pageNumber"
								value="<%=request.getParameter("pageNumber")%>"> <input
								type="hidden" name="pageSize"
								value="<%=request.getParameter("pageSize")%>"> <input
								type="hidden" name="mode"
								value="<%=request.getParameter("mode")%>"> <input
								type="hidden" name="keyword"
								value="<%=request.getParameter("keyword")%>">
							<div class="mail_section_1">
								<input type="text" class="mail_text_date" name="startdate"
									id="startdate" value="${requestScope.bean.startdate }">
								<input type="text" class="mail_text_date" name="enddate"
									id="enddate" value="${requestScope.bean.enddate}"> <input
									type="text" class="mail_text" name="ename" id="ename"
									value="${requestScope.bean.ename}"> <input type="text"
									class="mail_text" name="ephoneno" id="ephoneno"
									value="${requestScope.bean.ephoneno }"> <input
									type="text" class="mail_text" name="eplace" id="eplace"
									value="${requestScope.bean.eplace}"> <br />
								<textarea class="massage-bt" rows="5" id="econtent"
									name="econtent" value="${requestScope.bean.econtent}">
								</textarea>
								<input class="mail_text" type="file" id="eimage1" name="eimage1" onchange="readURL(this);" style="margin: 20px auto 0px auto" value="${requestScope.bean.eimage1}">
									<br />
								<input class="mail_text" type="file" id="eimage2" name="eimage2" onchange="readURL(this);" style="margin: 0 auto" value="${requestScope.bean.eimage2}">
								<br />
								<input class="mail_text" type="file" id="eimage3" name="eimage3" onchange="readURL(this);" style="margin: 0 auto" value="${requestScope.bean.eimage3}">
								<br />
								<input class="mail_text" type="file" id="eimage4" name="eimage4" onchange="readURL(this);" style="margin: 0 auto" value="${requestScope.bean.eimage4}">
								<br />
								<input class="mail_text" type="file" id="eimage5" name="eimage5" onchange="readURL(this);" style="margin: 0 auto" value="${requestScope.bean.eimage5}">
								<br />			
								<label for="evsection" class="mail_text_date">구분</label>
									<select name="evsection" id="evsection" class="justselect">
										  <option value="진행중">진행중</option>
										  <option value="종료">종료</option>
										  <option value="예정중">예정중</option>
									</select>
								<div class="order_bt">
								     <input type="submit" value="등록" onclick="return validCheck();">
								<!-- 	<button type="submit" >등록</button> -->
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>