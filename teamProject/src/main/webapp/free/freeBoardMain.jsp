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
   });

   function searchevery() { /* 전체 검색 */
      location.href = '<%=notWithFormTag%>frMain';
      }
      
   function gotofrInsert() {
       // 여기에 writeForm 함수의 내용을 작성
       // 글 쓰기 동작 구현
       location.href = "<%=notWithFormTag%>
   frInsert";
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
					<div class="row">
						<div class="search-box col-sm-12">
							<select class="form-control-sm" id="mode" name="mode">
								<option value="all" selected="selected">--- 검색옵션 ---
								<option value="name">글제목
								<option value="company">글내용
								<option value="category">작성자
							</select> <input class="form-control-sm" type="text" name="keyword"
								id="keyword" placeholder="키워드 입력">
							<button type="submit" class="btn btn-warning form-control-sm"
								onclick="">검색</button>
							<button type="button" class="btn btn-warning form-control-sm"
								onclick="searchevery();">전체 검색</button>
							<button type="button" class="btn btn-secondary form-control-sm"
								onclick="gotofrInsert();">글 쓰기</button>

						</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 검색창 End -->

	<!-- 게시물 목록 Start -->
	<div class="container-xxl py-5"
		style="margin-left: 100px; margin-right: 100px;">
		<div class="container">
			<div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
				<ul
					class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
					<li class="nav-item"><a
						class="category d-flex align-items-center text-start mx-3 ms-0 pb-3 active"
						data-bs-toggle="pill" href="#tab-1">
							<div class="ps-3">
								<h2 class="category-text">전체</h2>
							</div>
					</a></li>
					<li class="nav-item"><a
						class="category d-flex align-items-center text-start mx-3 pb-3"
						data-bs-toggle="pill" href="#tab-2">
							<div class="ps-3">
								<h2 class="category-text">정보공유</h2>
							</div>
					</a></li>
					<li class="nav-item"><a
						class="category d-flex align-items-center text-start mx-3 me-0 pb-3"
						data-bs-toggle="pill" href="#tab-3">
							<div class="ps-3">
								<h2 class="category-text">질문</h2>
							</div>
					</a></li>
					<li class="nav-item"><a
						class="category d-flex align-items-center text-start mx-3 me-0 pb-3"
						data-bs-toggle="pill" href="#tab-4">
							<div class="ps-3">
								<h2 class="category-text">잡담</h2>
							</div>
					</a></li>
				</ul>
				<!--전체의 게시물 목록을 출력하는 부분 -->
				<c:forEach var="bean" items="${requestScope.datalist}">
					<div class="tab-content">
						<div id="tab-1" class="tab-pane p-0 active">
							<div class="row g-2">
								<div class="col-lg-12">
									<div class="freeBoard d-flex align-items-center">
										<a href="<%=notWithFormTag%>frDetail&ono=${bean.ono}"> <img
											src="<%= appName  %>+ '/' + ${bean.oimage1}" alt="게시물 이미지"
											width="65px;" class="post-image">

											<div class="w-100 d-flex flex-column text-start ps-4">
												<h5
													class="d-flex justify-content-between border-bottom pb-2">
													<div>
														<span class="badge bg-secondary">${bean.pcategory}</span>
														<span class="thumbnail-title text-primary">${bean.oname}</span>
													</div>
													<span> <img class="thumbnail-content"
														src="<%=appName%>/assets/img/thumb.png" alt="recommand"
														style="width: 20px;"> <small
														class="thumbnail-content">5</small>
													</span>
												</h5>
												<small class="thumbnail-content">${bean.ocontent}</small>
												<div class="text-end">
													<!-- 수정 버튼 표시 조건문 -->
													<c:if test="${sessionScope.loginfo.id==bean.id}">
														<a
															href="<%=notWithFormTag%>frUpdate&ono=${bean.ono}${requestScope.pageInfo.flowParameter}"
															class="btn btn-primary btn-sm">수정</a>
													</c:if>
												</div></a> </a>
									</div>
				</c:forEach>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<!-- 게시물 목록 End -->
	<div class="pagination">${requestScope.pageInfo.pagingHtml}</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>