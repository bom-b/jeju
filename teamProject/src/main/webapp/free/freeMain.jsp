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

<!-- 게시판 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_boardmain/style.css"
	rel="stylesheet">
<script type="text/javascript">
      $(document).ready(function(){
         var optionList = $('#mode option');
         for(var i=0 ; i<optionList.length ; i++){
            if(optionList[i].value == '${requestScope.pageInfo.mode}'){
               optionList[i].selected = true ;
            }   
         }
   $('#keyword').val('${requestScope.pageInfo.keyword}');

      $("#mode").change(function() {
         if ($(this).val() != 'all') {
            $('#keyword').attr('disabled', false);
         } else {
            $('#keyword').val('');
            $('#keyword').attr('disabled', true);
         }
      });

  	// 각 배너에 이벤트 리스너 추가
		$(".tab-link").click(function () {
			// 변수 i 에 href의 값을 할당하여 그에 해당하는 번호 구하기
			var i = $(this).attr("href");
			var j = 0;
			
			if (i === "#tab-1") {
				j = 1;
			} else if (i === "#tab-2") {
				j = 2;
			} else if (i === "#tab-3") {
				j = 3;
			} else if (i === "#tab-4") {
				j = 4;
			}
			
          // 모든 탭 링크에서 'active' 클래스를 제거
          $(".tab-pane").removeClass("active");
          $(".nav-item a").removeClass("active");
          
          // 해당하는 카테고리에 'active' 클래스를 추가
          $(".select-" + j).addClass("active");
          
          // 해당하는 탭 내용을 표시
          $(i).addClass("active");
		   });
      });
		
  	// 전체 검색
  	function searchAll() {
  	location.href = '<%=notWithFormTag%>frMain';
  	}
  	
 // 글쓰기
  	function writeForm() {
  		location.href = '<%=notWithFormTag%>frInsert';
	}
</script>
<style type="text/css">
body {
	font-family: 'Jua', sans-serif;
}

.display-3 {
	font-size: 50px;
	color: white;
	text-align: center;
}

/* 검색 옵션 select에 스타일 적용 */
#mode {
	width: 150px; /* 너비 설정 */
	margin-right: 10px; /* 오른쪽 여백 설정 */
}

/* 검색어 입력 필드에 스타일 적용 */
#keyword {
	width: 200px; /* 너비 설정 */
	margin-right: 10px; /* 오른쪽 여백 설정 */
}

/* 검색 버튼에 스타일 적용 */
.btn {
	font-size: 14px; /* 글꼴 크기 설정 */
	padding: 8px 16px; /* 내부 여백 설정 */
}

/* 검색 버튼 색상 변경 */
.btn-warning {
	background-color: #ff9800; /* 주황색 배경색 */
	border-color: #ff9800; /* 주황색 테두리 색상 */
	color: #fff; /* 텍스트 색상을 흰색으로 설정 */
}

/* 검색창 내용을 중앙 정렬 */
.search-box {
	
}

/* 검색 버튼 마진 조정 */
.search-box button {
	margin-left: 10px; /* 왼쪽 여백 설정 */
}

.freeBoard:hover {
	/* 호버 시 적용될 스타일을 여기에 추가합니다. */
	background-color: #ff9800; /* 예시: 배경색을 바꿉니다. */
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
	transition: background-color 0.3s, box-shadow 0.3s; /* 부드러운 전환 효과 */
}

.freeboardform {
	position: relative;
	min-height: 1px;
}
</style>
</head>
<body>
	<!-- 헤더 Start -->
	<div class="container-xxl py-5 bg-dark  mb-5"
		style="background-image:url('<%=appName%>/assets/img/freeboardMain.jpg');  ">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-lg-6 text-center text-lg-start">
					<h1 class="display-3 text-white" style="margin-bottom: 20px;">
						자유게시판</h1>
					<h5 style="color: white; text-align: center;">제주도의 관한 궁금한점!
						하고싶은 이야기! 모두해보세요!</h5>
					<p class="medium-paragraph"></p>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 End -->

	<!-- 검색창 start -->
	<div class="container-xxl py-5 text-center">
		<div class="container">
			<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">
				<form class="search-box" name="myform" action="<%=withFormTag%>"
					method="get">
					<input type="hidden" name="command" value="frMain">
					<div class="row">
						<div class="search-box col-sm-12">
							<select class="form-control-sm " id="mode" name="mode">
								<%--<option value="all" selected="selected">--- 검색옵션 -----%>
								<option value="oname">글 제목
								<option value="ID">작성자
							</select> <input class="form-control-sm" type="text" name="keyword"
								id="keyword" placeholder="키워드 입력">
							<button type="submit" class="btn btn-warning form-control-sm "
								onclick="">검색</button>
							<button type="button" class="btn btn-warning form-control-sm "
								onclick="searchAll();">초기화</button>
							<button type="button" class="btn btn-secondary form-control-sm "
								onclick="writeForm();">글 쓰기</button>
							<span id="pagingStatus">${requestScope.pageInfo.pagingStatus}
							</span>
						</div>
					</div>
				</form>
			</div>
			<div class=" wow fadeInUp" data-wow-delay="0.3s">
				<c:if test="${not empty requestScope.pageInfo_pcategory.keyword}">
					<p class="serch-result">
						<c:if test="${requestScope.pageInfo.mode eq 'oname'}">
						  글제목
						</c:if>
						<c:if test="${requestScope.pageInfo.mode eq 'ID'}">
						    작성자
						</c:if>
						<strong>'${requestScope.pageInfo_pcategory.keyword}'</strong> 에 대한
						검색결과입니다.
					</p>
				</c:if>
			</div>
		</div>
	</div>
	<!-- 검색창 End -->

	<!-- 게시물 목록 Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
				<ul
					class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">

					<!-- 카테고리 목록 Start -->
					<li class="nav-item"><a
						class="select-1 category d-flex align-items-center text-start mx-3 ms-0 pb-3 active"
						data-bs-toggle="pill" href="#tab-1"> <!--  <i class="fa fa-utensils fa-2x text-primary"></i> -->
							<div class="ps-3">
								<h2 class="category-text ">
									<strong>전체</strong>
								</h2>
							</div>
					</a></li>
					<li class="nav-item"><a
						class="select-2 category d-flex align-items-center text-start mx-3 pb-3"
						data-bs-toggle="pill" href="#tab-2"> <!-- <i class="fa fa-hamburger fa-2x text-primary"></i> -->
							<div class="ps-3">
								<h2 class="category-text ">
									<strong>잡담</strong>
								</h2>
							</div>
					</a></li>
					<li class="nav-item"><a
						class="select-3 category d-flex align-items-center text-start mx-3 me-0 pb-3"
						data-bs-toggle="pill" href="#tab-3"> <!-- <i class="fa fa-coffee fa-2x text-primary"></i> -->
							<div class="ps-3">
								<h2 class="category-text ">
									<strong>질문</strong>
								</h2>
							</div>
					</a></li>
					<li class="nav-item"><a
						class="select-4 category d-flex align-items-center text-start mx-3 me-0 pb-3"
						data-bs-toggle="pill" href="#tab-4"> <!-- <i class="fa fa-beer fa-2x text-primary"></i> -->
							<div class="ps-3">
								<h2 class="category-text ">
									<strong>정보공유</strong>
								</h2>
							</div>
					</a></li>
				</ul>
				<!-- 카테고리 목록 End -->

				<div class="tab-content">

					<!-- 전체게시물 동적으로 표시하기 -->
					<div id="tab-1" class="tab-pane p-0 active">
						<div class="row g-4">
							<c:if test="${empty requestScope.datalist}">
								<p>게시글이 존재하지 않습니다.</p>
							</c:if>
							<c:forEach var="bean" items="${requestScope.datalist}">
								<div class="col-lg-12">
									<div class="d-flex align-items-center">
										<div class="thumnail_img flex-shrink-0 img-fluid rounded"
											style="background-image: url('<%=appName%>/upload/${bean.oimage1 }');"></div>
										<div class="w-100 d-flex flex-column text-start ps-4">
											<h5 class="d-flex justify-content-between border-bottom pb-2">
												<a href="<%=notWithFormTag%>frDetail&ono=${bean.ono}"> <span
													class="thumbnail-title text-primary  thum_title">${bean.oname }</span>
												</a> <span class="badge badge-secondary">${bean.pcategory }</span>
											</h5>
											<small class="thumbnail-content  thum_contents">${bean.ocontent }</small>
											<div class="text-end"></div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						${requestScope.pageInfo.pagingHtml}
					</div>

					<!-- 잡담 게시물 동적으로 표시하기 -->
					<div id="tab-2" class="tab-pane p-0">
						<div class="row g-4">
							<c:if test="${empty requestScope.ta_datalist}">
								<p>'잡담' 카테고리의 검색결과가 존재하지 않습니다.</p>
							</c:if>
							<c:forEach var="bean" items="${requestScope.ta_datalist}">
								<div class="col-lg-12">
									<div class="d-flex align-items-center">
										<div class="thumnail_img flex-shrink-0 img-fluid rounded"
											style="background-image: url('<%=appName%>/upload/${bean.oimage1 }');"></div>
										<div class="w-100 d-flex flex-column text-start ps-4">
											<h5 class="d-flex justify-content-between border-bottom pb-2">
												<a href="<%=notWithFormTag%>frDetail&ono=${bean.ono}"> <span
													class="thumbnail-title text-primary  thum_title">${bean.oname }</span>
												</a><span class="badge badge-secondary">${bean.pcategory }</span>
											</h5>
											<small class="thumbnail-content  thum_contents">${bean.ocontent}</small>
											<div class="text-end"></div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						${requestScope.pageInfo_ta.pagingHtml}
					</div>

					<!-- 질문 게시물 동적으로 표시하기 -->
					<div id="tab-3" class="tab-pane p-0">
						<div class="row g-4">
							<c:if test="${empty requestScope.qu_datalist}">
								<p>'질문' 카테고리의 검색결과가 존재하지 않습니다.</p>
							</c:if>
							<c:forEach var="bean" items="${requestScope.qu_datalist }">
								<div class="col-lg-12">
									<div class="d-flex align-items-center">
										<div class="thumnail_img flex-shrink-0 img-fluid rounded"
											style="background-image: url('<%=appName%>/upload/${bean.oimage1 }');"></div>
										<div class="w-100 d-flex flex-column text-start ps-4">
											<h5 class="d-flex justify-content-between border-bottom pb-2">
												<a href="<%=notWithFormTag%>frDetail&ono=${bean.ono}"> <span
													class="thumbnail-title text-primary  thum_title">${bean.oname }</span>
												</a><span class="badge badge-secondary">${bean.pcategory }</span>
											</h5>
											<small class="thumbnail-content  thum_contents">${bean.ocontent }</small>
											<div class="text-end"></div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						${requestScope.pageInfo_qu.pagingHtml}
					</div>

					<!-- 정보게시물 동적으로 표시하기 -->
					<div id="tab-4" class="tab-pane p-0">
						<div class="row g-4">
							<c:if test="${empty requestScope.qu_datalist}">
								<p>'정보' 카테고리의 검색결과가 존재하지 않습니다.</p>
							</c:if>
							<c:forEach var="bean" items="${requestScope.infor_datalist }">
								<div class="col-lg-12">
									<div class="d-flex align-items-center">
										<div class="thumnail_img flex-shrink-0 img-fluid rounded"
											style="background-image: url('<%=appName%>/upload/${bean.oimage1 }');"></div>
										<div class="w-100 d-flex flex-column text-start ps-4">
											<h5 class="d-flex justify-content-between border-bottom pb-2">
												<a href="<%=notWithFormTag%>frDetail&ono=${bean.ono}"> <span
													class="thumbnail-title text-primary  thum_title">${bean.oname }</span>
												</a><span class="badge badge-secondary">${bean.pcategory }</span>
											</h5>
											<small class="thumbnail-content  thum_contents">${bean.ocontent }</small>
											<div class="text-end"></div>
										</div>
									</div>
								</div>

							</c:forEach>

						</div>
						${requestScope.pageInfo_infor.pagingHtml}
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 게시물 목록 End -->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>