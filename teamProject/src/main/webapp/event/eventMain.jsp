<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/common/bootstrap5.jsp"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 맛집에서 따온 메인 전용 부트스트랩과 css-->
<link rel="stylesheet" href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">
<link href="<%=appName%>/assets/css_boardmain/style.css" rel="stylesheet">
<!-- 행사 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_eventmain/eventmain.css" rel="stylesheet">
<!-- 달력 -->
<link rel="stylesheet" type="text/css" href="<%=appName%>/assets/css_eventmain/flatpickr.css">
<script src="<%=appName%>/assets/css_eventmain/flatpickr.js"></script>

<style type="text/css">
.green-background {
	background-color: #84c0a0;
}

</style>
<script type="text/javascript">
	function seChange(obj) {
		var selectBox = obj;
		var selected = selectBox.options[selectBox.selectedIndex].value;
		var subText = document.getElementById("keyword");
		var dateHidden = document.getElementById("dateHidden");

		if (selected == 'subject') {
			subText.style.display = "inline";
			dateHidden.style.display = "none";

		} else {
			subText.style.display = "none";
			dateHidden.style.display = "inline";

		}
	}
	$(document).ready(function(){
		
		
	});
	$( ".startDate" ).change(function() {
		  alert( "Handler for .change() called." );
		});
	/* flatpickr("input[type=datetime-local]",{}); */

	/* 	var startDateInput = document.getElementById('startDate');
	 alert(startDateInput);
	 flatpickr(startDateInput, {
	 dateFormat: 'Y-m-d',
	 enableTime: false,
	 minDate: 'today',
	 defaultDate: 'today',
	 locale: 'ko',
	
	 }); */
</script>
</head>
<body>

	<!-- 헤더 Start -->
	<div class="container-xxl py-5 bg-dark event-header mb-5 ">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-lg-6 text-center text-lg-start">
					<h1 class="display-3 text-white" style="margin-bottom: 20px;">행사</h1>
					<p class="medium-paragraph">제주도의 행사들을 만나보세요!</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 End -->



	<!-- 검색창 start -->
	<div class="container-xxl py-5 text-center">
		<div class="container">
			<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">
				<form class="search-box" name="myform" action="<%=withFormTag%>" method="get">
					<div class="row">
						<div class="search-box col-sm-12">
							<select class="form-control-sm" id="search" name="search" onchange="seChange(this)">
								<option value="subject">제목
								<option value="date">날짜
							</select>
							<input class="form-control-sm" type="text" name="keyword" id="keyword" placeholder="키워드 입력">
							
							<div style="display: none" id="dateHidden">
								<input class="form-control-sm" type="text" name="startDate" id="startDate" placeholder="시작 날짜">

								<input class="form-control-sm" type="text" name="endDate" id="endDate" placeholder="종료 날짜">
							</div>

							<button type="submit" class="btn green-background form-control-sm" onclick="">검색</button>
							<button type="button" class="btn green-background form-control-sm" onclick="searchAll();">전체 검색</button>
							<c:if test="${whologin eq 2}">
								<button type="button" class="btn btn-secondary form-control-sm" onclick="writeForm();">글 쓰기</button>
							</c:if>
						</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 검색창 End -->
	<div class="container-xxl pt-5">
		<ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
			<li class="nav-item"><a class="category d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
					<!-- 	<i class="fa far fas fa-calendar-day fa-2x text-primary" style="color: red;"></i> -->
					<i class="fa fa-phone-square"></i>
					<div class="ps-3">
						<h2 class="category-text">전체</h2>
					</div>
				</a></li>
			<li class="nav-item"><a class="category d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
					<i class="fa far fa-calendar-check"></i>
					<div class="ps-3">
						<h2 class="category-text">진행 중</h2>
					</div>
				</a></li>
			<li class="nav-item"><a class="category d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
					<!-- 				<i class="fa far fa-calendar-times fa-2x text-primary"></i> -->
					<i class="fa far fa-calendar-times"></i>
					<div class="ps-3">
						<h2 class="category-text">종료</h2>
					</div>
				</a></li>
		</ul>
	</div>
	<!-- 게시물 목록 Start -->
	<section class="contest-waiting">
		<div class="container-xxl">
			<div class="row">
				<c:forEach var="bean" items="${requestScope.eventList }">
					<div class="col-lg-4 col-sm-6">
						<div class="waiting-item">
							<a href="<%=notWithFormTag%>evDetail&eno=${bean.eno}">
								<img src="<%=appName%>/assets/img/event_img/${bean.eimage1 } " alt="">
							</a>
							<div class="down-content">
								<p>${bean.startdate }~${bean.enddate }</p>
								<h4>${bean.ename }</h4>
								<!-- 	<ul class="info">
								<li><i class="fa fas fa-phone-square fa-2x text-primary" style="text-align: center;"></i> 064-1234-1234</li>
							</ul> -->
								<span class="price"><i class="fa fas fa-map-marker-alt" style="text-align: center;"></i> <em>${bean.eplace}</em></span>
								<br />
								<!-- 	<span class="deadline">Deadline: <em>4 Days</em></span> -->

							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 페이지 start -->
				<div class="col-lg-12">
					<ul class="pagination">
						<li><a href="#">
								<i class="fa fa-arrow-left"></i>
							</a></li>
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">
								<i class="fa fa-arrow-right"></i>
							</a></li>
					</ul>
				</div>
				<!-- 페이지 end -->
			</div>
		</div>
	</section>
</body>
</html>