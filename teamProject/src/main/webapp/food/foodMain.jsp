<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 게시판 메인 전용 부트스트랩 -->
<link rel="stylesheet" href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">

<!-- 게시판 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_food/foodStyle.css" rel="stylesheet">

<style type="text/css">
	@font-face{
	font-family:'SDMiSaeng'; /*글꼴*/
	src: local('SDMiSaeng'),
		url('SDMiSaeng.eot'),
		url('SDMiSaeng.woff') format('woff'),
		url('assets/font-awesome/fonts/SDMiSaeng.ttf') format('truetype');
	}
	
	.sdms-font{
		font-family: 'SDMiSaeng', sans-serif;/*웹 폰트 지정*/
		color: black;
	}
	
	/* 썸네일 폰트사이즈 */
	/* .thum_title {
		font-size: 25px;
	}
	
	.thum_contents {
		font-size: 22px;
	} */
	
	/* 아아 */
	
</style>

<script type="text/javascript">
	$(document).ready(function(){
		// mode 값 유지하기
		var optionList = $('#mode option'); // mode 안에 있는 옵션 태그들을 옵션리스트 변수에 대입
		for(var i=0; i < optionList.length; i++) {
			if (optionList[i].value == '${requestScope.pageInfo.mode}') {
				optionList[i].selected = true;
			}
		}
		
		// keyword 값 유지하기
		$('#keyword').val('${requestScope.pageInfo.keyword}')
		
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
		location.href = '<%=notWithFormTag%>boList';
	}
	
	// 글쓰기
	function writeForm() {
		location.href = '<%=notWithFormTag%>fdInsert&id=${sessionScope.loginfo.id}';
	}
</script>

</head>
<body>
 	
 	<!-- 헤더 Start -->
	<div class="container-xxl py-5 bg-dark hero-header mb-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-lg-6 text-center text-lg-start">
					<h1 class="display-3 text-white " style="margin-bottom: 20px;">
						맛집
					</h1>
                    	<p class="medium-paragraph">제주도의 맛집들을 카테고리 별로 만나보세요!</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 End -->

	<!-- 배너 Start -->
	<div class="container-xxl py-5">
	    <div class="container">
	        <div class="row g-4">
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
	            	<!-- <a class="text-start" id="tab-link-1" data-bs-toggle="pill" href="#tab-1"> -->
	            	<a class="tab-link text-start" href="#tab-1">
	                <div class="bn-korean banner-item rounded pt-3">
	                <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white ">한식</h1>
	                    </div>
	                </div>
	                </a>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
	            	<a class="tab-link text-start" href="#tab-2">
	                <div class="bn-yansik banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white ">세계음식</h1>
	                    </div>
	                </div>
	                </a>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
	            	<a class="tab-link text-start" href="#tab-3">
	                <div class="bn-cafe banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white ">카페</h1>
	                    </div>
	                </div>
	                </a>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
	            	<a class="tab-link text-start" href="#tab-4">
	                <div class="bn-beer banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white ">술집</h1>
	                    </div>
	                </div>
	                </a>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 배너 End -->
	
	<!-- 검색창 start -->
	<div class="container-xxl py-5 text-center">	
		<div class="container">		
			<div class="row g-4 wow fadeInUp" data-wow-delay="0.3s">	
			<form class="search-box" name="myform" action="<%=withFormTag%>" method="get">
				<div class="row">
					<div class="search-box col-sm-12" >
						<select class="form-control-sm " id="mode" name="mode">
							<option value="all" selected="selected">--- 검색옵션 ---
							<option value="title">맛집이름
							<option value="ID">작성자
						</select>
						<input class="form-control-sm" type="text" 
							name="keyword" id="keyword" placeholder="키워드 입력">
						<button type="submit" class="btn btn-warning form-control-sm " onclick="">검색</button>
						<button type="button" class="btn btn-warning form-control-sm "  onclick="searchAll();">초기화</button>
						<button type="button" class="btn btn-secondary form-control-sm "  onclick="writeForm();">글 쓰기</button>
						<span id="pagingStatus">${requestScope.pageInfo.pagingStatus} </span>
				</div>
			</form>	
			</div>					
		</div>
	</div>
	<!-- 검색창 End -->
	
	<!-- 게시물 목록 Start -->
	<div class="container-xxl py-5">
	    <div class="container">
	        <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
	            <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
	            	
	            	<!-- 카테고리 목록 Start -->
	                <li class="nav-item">
	                    <a class="select-1 category d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
	                       <!--  <i class="fa fa-utensils fa-2x text-primary"></i> -->
	                        <div class="ps-3">
	                            <h2 class="category-text "><strong>한식</strong></h2>
	                        </div>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="select-2 category d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
	                        <!-- <i class="fa fa-hamburger fa-2x text-primary"></i> -->
	                        <div class="ps-3">
	                            <h2 class="category-text "><strong>세계음식</strong></h2>
	                        </div>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="select-3 category d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
	                        <!-- <i class="fa fa-coffee fa-2x text-primary"></i> -->
	                        <div class="ps-3">
	                            <h2 class="category-text "><strong>카페</strong></h2>
	                        </div>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="select-4 category d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-4">
	                        <!-- <i class="fa fa-beer fa-2x text-primary"></i> -->
	                        <div class="ps-3">
	                            <h2 class="category-text "><strong>술집</strong></h2>
	                        </div>
	                    </a>
	                </li>
	            </ul>
	            <!-- 카테고리 목록 End -->
	            
	            <div class="tab-content">
	            
	            	<!-- 한식 게시물 동적으로 표시하기 -->
	                <div id="tab-1" class="tab-pane p-0 active">
	                    <div class="row g-4">
	                    
							<c:forEach var="bean" items="${requestScope.ko_datalist }">
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <div class="thumnail_img flex-shrink-0 img-fluid rounded" style="background-image: url('<%=appName%>/upload/${bean.image1 }');"></div>
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                    	<a href="<%=notWithFormTag%>fdDetail&no=${bean.no}">
	                                        <span class="thumbnail-title text-primary  thum_title">${bean.title }</span>
	                                        </a>
	                                    </h5>
	                                    <small class="thumbnail-content  thum_contents">${bean.place }</small>
	                                    <small class="thumbnail-content  thum_contents">${bean.menu }</small>
	                                </div>
	                            </div>
	                        </div>
	                       </c:forEach>
	                       
	                    </div>
	                    ${requestScope.PageInfo_ko.pagingHtml} 
	                </div>
	             
	                <!-- 세계음식 게시물 동적으로 표시하기 -->
	                <div id="tab-2" class="tab-pane p-0">
	                    <div class="row g-4">
	                    
							<c:forEach var="bean" items="${requestScope.fo_datalist }">
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <div class="thumnail_img flex-shrink-0 img-fluid rounded" style="background-image: url('<%=appName%>/upload/${bean.image1 }');"></div>
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                    	<a href="<%=notWithFormTag%>fdDetail&no=${bean.no}">
	                                        <span class="thumbnail-title text-primary  thum_title">${bean.title }</span>
	                                        </a>
	                                    </h5>
	                                    <small class="thumbnail-content  thum_contents">${bean.place }</small>
	                                    <small class="thumbnail-content  thum_contents">${bean.menu }</small>
	                                </div>
	                            </div>
	                        </div>
	                       </c:forEach>
	                       
	                    </div>
	                    ${requestScope.PageInfo_fo.pagingHtml} 
	                </div>
	                
	                <!-- 카페 게시물 동적으로 표시하기 -->
	                <div id="tab-3" class="tab-pane p-0">
	                    <div class="row g-4">
	                    
							<c:forEach var="bean" items="${requestScope.ca_datalist }">
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <div class="thumnail_img flex-shrink-0 img-fluid rounded" style="background-image: url('<%=appName%>/upload/${bean.image1 }');"></div>
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                    	<a href="<%=notWithFormTag%>fdDetail&no=${bean.no}">
	                                        <span class="thumbnail-title text-primary  thum_title">${bean.title }</span>
	                                        </a>
	                                    </h5>
	                                    <small class="thumbnail-content  thum_contents">${bean.place }</small>
	                                    <small class="thumbnail-content  thum_contents">${bean.menu }</small>
	                                </div>
	                            </div>
	                        </div>
	                       </c:forEach>
	                       
	                    </div>
	                    ${requestScope.PageInfo_ca.pagingHtml} 
	                </div>
	                
	                <!-- 술집 게시물 동적으로 표시하기 -->
	                <div id="tab-4" class="tab-pane p-0">
	                    <div class="row g-4">
	                    
							<c:forEach var="bean" items="${requestScope.be_datalist }">
	                        <div class="col-lg-12">
	                            <div class="d-flex align-items-center">
	                                <div class="thumnail_img flex-shrink-0 img-fluid rounded" style="background-image: url('<%=appName%>/upload/${bean.image1 }');"></div>
	                                <div class="w-100 d-flex flex-column text-start ps-4">
	                                    <h5 class="d-flex justify-content-between border-bottom pb-2">
	                                    	<a href="<%=notWithFormTag%>fdDetail&no=${bean.no}">
	                                        <span class="thumbnail-title text-primary  thum_title">${bean.title }</span>
	                                        </a>
	                                    </h5>
	                                    <small class="thumbnail-content  thum_contents">${bean.place }</small>
	                                    <small class="thumbnail-content  thum_contents">${bean.menu }</small>
	                                </div>
	                            </div>
	                        </div>
	                       </c:forEach>
	                       
	                    </div>
	                    ${requestScope.PageInfo_be.pagingHtml} 
	                </div>
	                
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 게시물 목록 End -->
	
	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    
	
</body>
</html>