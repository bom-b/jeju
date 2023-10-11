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
<link rel="stylesheet" href="<%=appName%>/assets/css_eventmain/jquery-ui.css">
<link href="<%=appName%>/assets/css_boardmain/style.css" rel="stylesheet">
<!-- 행사 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_eventmain/eventmain.css" rel="stylesheet">
<!-- 달력 -->
<script type="text/javascript" src="<%=appName%>/assets/css_eventmain/jquery-ui.min.js"></script>


<style type="text/css">
* {
	font-family: 'TheJamsil300';
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	const tabList = document.querySelectorAll('.tab_menu .list li');
	  const contents = document.querySelectorAll('.tab_menu .cont_area .cont')
	  let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)

	  for(var i = 0; i < tabList.length; i++){
	    tabList[i].querySelector('.btn').addEventListener('click', function(e){
	      e.preventDefault();
	      for(var j = 0; j < tabList.length; j++){
	        // 나머지 버튼 클래스 제거
	        tabList[j].classList.remove('is_on');

	        // 나머지 컨텐츠 display:none 처리
	        contents[j].style.display = 'none';
	      }

	      // 버튼 관련 이벤트
	      this.parentNode.classList.add('is_on');
	
	      // 버튼 클릭시 컨텐츠 전환
	      activeCont = this.getAttribute('href');
	  
	  
	      document.querySelector(activeCont).style.display = 'block';
	    });
	  }
	
	  tabList[0].querySelector('.btn').click();
	  

	 
});

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
	

	function writeForm(){ /* 글쓰기 */
		location.href = '<%=notWithFormTag%>evInsert';
	}
</script>
</head>
<body>

	<!-- 헤더 Start -->
	<div class="container-xxl py-5 bg-dark event-header mb-5 ">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-lg-6 text-center text-lg-start">
					<h1 class="display-3 text-white" style="margin-bottom: 15px; font-size: 64px; font-family: 'TheJamsil100'; font-weight: inherit;">행사</h1>
					<p class="medium-paragraph" style="font-size: 18px;">제주도의 행사들을 만나보세요!</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 End -->
	<div class="container" style="background-color: #faf1e4">
		<div class="container-xxl py-5 text-center" style="background-color: #faf1e4">
			<!-- 검색창 start -->
			<div class="container">
				<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">
					<form class="search-box" name="myform" action="<%=withFormTag%>" method="get">
						<input type="hidden" name="command" value="evMain">
						<div class="row">
							<div class="search-box col-sm-12">
								<select class="form-control-sm" id="mode" name="mode" style="font-size: 14px;">
									<option value="all" selected="selected">선택해주세요.
									<option value="ename">행사명
									<option value="eplace">위치
								</select>
								<input class="form-control-sm" type="text" name="keyword" id="keyword" placeholder="키워드 입력" style="font-size: 14px;">

								<button type="submit" class="btn form-control-sm" onclick="" style="font-size: 16px; background-color: #9eb384; color: #ffffff">검색</button>
								<!-- 	<button type="button" class="btn btn-secondary form-control-sm" onclick="searchAll();" style="margin-top: -10px; font-size: 2rem; font-family: 'SDMiSaeng';">전체 검색</button> -->
								<c:if test="${whologin eq 2}">
									<button type="button" class="btn form-control-sm" onclick="writeForm();" style="font-size: 16px; background-color: #9eb384; color: #ffffff">추가하기</button>
								</c:if>

								<span id="pagingStatus" style="margin-left: 10px; font-size: 16px;">${requestScope.pageInfoAll.pagingStatus}</span>
							</div>
					</form>
				</div>
			</div>
			<!-- 검색창 end -->
			<!-- 메뉴 시작 -->
			<div class="tab_menu" style="margin-top: 20px;">
				<ul class="list nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
					<li class="is_on nav-item"><a class="btn category d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab1">
							<i class="fa fas fa-calendar-check fa-3x"></i>
							<div class="ps-3">
								<h2 class="category-text">전체</h2>
							</div>
						</a></li>
					<li class="nav-item"><a class="btn category d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab2">
							<i class="fa fas fa-calendar-check fa-3x"></i>
							<div class="ps-3">
								<h2 class="category-text">진행중</h2>
							</div>
						</a></li>
					<li class="nav-item"><a class="btn category d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab3">
							<i class="fa fas fa-calendar-times fa-3x"></i>
							<div class="ps-3">
								<h2 class="category-text">종료</h2>
							</div>
						</a></li>
					<li class="nav-item"><a class="btn category d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab4">
							<i class="fa fas fa-calendar-plus fa-3x"></i>
							<div class="ps-3">
								<h2 class="category-text">예정중</h2>
							</div>
						</a></li>
				</ul>
				<!-- 게시물 목록 Start -->
				<!-- 전체List start-->
				<div class="cont_area contest-waiting">
					<div class="cont container-xxl" id="tab1">
						<div class="row">
							<c:if test="${empty requestScope.eventAllList}">
								<p>행사가 없습니다.</p>
							</c:if>
							<c:forEach var="bean" items="${requestScope.eventAllList }">
								<div class="col-lg-4">
									<div class="waiting-item">
										<img src="<%=appName%>/assets/img/event_img/${bean.eimage1 } " alt="">
										<div class="down-content">
											<p style="font-size: 20px; font-family: 'TheJamsil300';">${bean.startdate } ~ ${bean.enddate }</p>
											<a href="<%=notWithFormTag%>evDetail&eno=${bean.eno}">
												<h4 style="word-break: break-all;">${bean.ename }</h4>
											</a>
											<span class="price" style="word-break: break-all;"> <i class="fa fas fa-map-marker-alt fa-2x" style="text-align: center; font-size: 17px;"></i> <em>${bean.eplace}</em></span>
											<br />
											<span id="deleteSpan"> <c:if test="${whologin eq 2}">
													<a class="btn btn-info" href="<%=notWithFormTag%>evUpdate&eno=${bean.eno}${requestScope.pageInfo.flowParameter}" style="margin-top: 15px; background-color: #9eb384; border: 0px;">
														<h4 style="font-size: 17px; font-family: 'TheJamsil300';">수정</h4>
													</a>
													<a class="btn btn-info" href="<%=notWithFormTag%>evDelete&eno=${bean.eno}${requestScope.pageInfo.flowParameter}" style="margin-top: 15px; background-color: #9eb384; border: 0px;">
														<h4 style="font-size: 17px; font-family: 'TheJamsil300';">삭제</h4>
													</a>
												</c:if>
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- 진행중 List start-->
					<div class="cont container-xxl" id="tab2">
						<div class="row">
							<c:if test="${empty requestScope.eventPrList}">
								<p>현재 진행중인 행사가 없습니다.</p>
							</c:if>
							<c:forEach var="bean" items="${requestScope.eventPrList }">
								<div class="col-lg-4">
									<div class="waiting-item">
										<img src="<%=appName%>/assets/img/event_img/${bean.eimage1 } " alt="">
										<div class="down-content">
											<p style="font-size: 20px; font-family: 'TheJamsil300';">${bean.startdate } ~ ${bean.enddate }</p>
											<a href="<%=notWithFormTag%>evDetail&eno=${bean.eno}">
												<h4 style="word-break: break-all;">${bean.ename }</h4>
											</a>
											<span class="price" style="word-break: break-all;"> <i class="fa fas fa-map-marker-alt fa-2x" style="text-align: center; font-size: 17px;"></i> <em>${bean.eplace}</em></span>
											<br />
											<span id="deleteSpan"> <c:if test="${whologin eq 2}">
													<a class="btn btn-info" href="<%=notWithFormTag%>evUpdate&eno=${bean.eno}${requestScope.pageInfo.flowParameter}" style="margin-top: 15px; background-color: #9eb384; border: 0px;">
														<h4 style="font-size: 17px; font-family: 'TheJamsil300';">수정</h4>
													</a>
													<a class="btn btn-info" href="<%=notWithFormTag%>evDelete&eno=${bean.eno}${requestScope.pageInfo.flowParameter}" style="margin-top: 15px; background-color: #9eb384; border: 0px;">
														<h4 style="font-size: 17px; font-family: 'TheJamsil300';">삭제</h4>
													</a>
												</c:if>
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- 진행중 List end-->

					<!-- 종료 List start-->
					<div class="cont container-xxl" id="tab3">
						<div class="row">
							<c:if test="${empty requestScope.eventEndList}">
								<p>현재 종료된 행사가 없습니다.</p>
							</c:if>
							<c:forEach var="bean" items="${requestScope.eventEndList }">
								<div class="col-lg-4">
									<div class="waiting-item">
										<img src="<%=appName%>/assets/img/event_img/${bean.eimage1 } " alt="">
										<div class="down-content">
											<p style="font-size: 20px; font-family: 'TheJamsil300';">${bean.startdate } ~ ${bean.enddate }</p>
											<a href="<%=notWithFormTag%>evDetail&eno=${bean.eno}">
												<h4 style="word-break: break-all;">${bean.ename }</h4>
											</a>
											<span class="price" style="word-break: break-all;"> <i class="fa fas fa-map-marker-alt fa-2x" style="text-align: center; font-size: 17px;"></i> <em>${bean.eplace}</em></span>
											<br />
											<span id="deleteSpan"> <c:if test="${whologin eq 2}">
													<a class="btn btn-info" href="<%=notWithFormTag%>evUpdate&eno=${bean.eno}${requestScope.pageInfo.flowParameter}" style="margin-top: 15px; background-color: #9eb384; border: 0px;">
														<h4 style="font-size: 17px; font-family: 'TheJamsil300';">수정</h4>
													</a>
													<a class="btn btn-info" href="<%=notWithFormTag%>evDelete&eno=${bean.eno}${requestScope.pageInfo.flowParameter}" style="margin-top: 15px; background-color: #9eb384; border: 0px;">
														<h4 style="font-size: 17px; font-family: 'TheJamsil300';">삭제</h4>
													</a>
												</c:if>
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<!-- 종료 List end-->
					<!-- 예정중 List start-->
					<div class="cont container-xxl" id="tab4">
						<div class="row">
							<c:if test="${empty requestScope.eventFuList}">
								<p>현재 예정중인 행사가 없습니다.</p>
							</c:if>
							<c:forEach var="bean" items="${requestScope.eventFuList }">
									<div class="col-lg-4">
									<div class="waiting-item">
										<img src="<%=appName%>/assets/img/event_img/${bean.eimage1 } " alt="">
										<div class="down-content">
											<p style="font-size: 20px; font-family: 'TheJamsil300';">${bean.startdate } ~ ${bean.enddate }</p>
											<a href="<%=notWithFormTag%>evDetail&eno=${bean.eno}">
												<h4 style="word-break: break-all;">${bean.ename }</h4>
											</a>
											<span class="price" style="word-break: break-all;"> <i class="fa fas fa-map-marker-alt fa-2x" style="text-align: center; font-size: 17px;"></i> <em>${bean.eplace}</em></span>
											<br />
											<span id="deleteSpan"> <c:if test="${whologin eq 2}">
													<a class="btn btn-info" href="<%=notWithFormTag%>evUpdate&eno=${bean.eno}${requestScope.pageInfo.flowParameter}" style="margin-top: 15px; background-color: #9eb384; border: 0px;">
														<h4 style="font-size: 17px; font-family: 'TheJamsil300';">수정</h4>
													</a>
													<a class="btn btn-info" href="<%=notWithFormTag%>evDelete&eno=${bean.eno}${requestScope.pageInfo.flowParameter}" style="margin-top: 15px; background-color: #9eb384; border: 0px;">
														<h4 style="font-size: 17px; font-family: 'TheJamsil300';">삭제</h4>
													</a>
												</c:if>
											</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					${requestScope.pageInfoAll.pagingHtml}

				</div>
				<!-- 예정중 List end-->
			</div>
		</div>
	</div>
</body>
</html>