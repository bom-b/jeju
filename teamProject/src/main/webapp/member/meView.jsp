<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- 전용 style.css --%>
<link href="<%=appName%>/assets/css/meView.css" rel="stylesheet">
<link href="<%=appName%>/assets/css/font-All.css" rel="stylesheet">

<style type="text/css">

</style>

<script>

$(document).ready(function () {
	var boLength = 0;

	var foodList = ${requestScope.foodList};
	var tourList = ${requestScope.tourList};
	var freeList = ${requestScope.freeList};

	// 각각의 리스트의 길이를 구합니다.
	var foodListLength = foodList.length;
	var tourListLength = tourList.length;
	var freeListLength = freeList.length;

	// 길이들을 합하여 결과값을 계산합니다.
	var boLength = foodListLength + tourListLength + freeListLength;

	// 결과값을 HTML 요소에 설정합니다.
	document.getElementById("resultSpan").textContent = boLength;
});

</script>

</head>
<body>
<!-- 회원등급 사진과 정보 -->
	<div class="main container-xxl py-5">
		<div class="text-left container my-5 py-5" style="margin-bottom: 20px;">
			<h4 class="sdms-font font-black event-title text-left" style="font-size: 30px;"><strong>${requestScope.bean.id}</strong>님의 페이지 입니다.</h4>
		</div>
		<div class="mainBox container my-5 py-5 wow fadeInUp" data-wow-delay="0.1s">
			
			<div class="col-sm-5">
				
				<img class="main-image" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbcdHQb%2FbtsuG4zaJd7%2F9MkJVs5zrmwJYsBcTMSJJ0%2Fimg.png" alt="main-image">
				
			</div>
			<div class="view-info content col-sm-7">
				<div class="meinfo">
					<span class="gmarket-m " style="font-size: 22px;">ID :  </span> 
					<span class="font-blue gmarket-m" style="font-size: 22px;">${requestScope.bean.id}</span>
				</div>
				<div class="meinfo">
					<span class="gmarket-m " style="font-size: 22px;">등급포인트 :  </span> 
					<span class="font-blue gmarket-m" style="font-size: 22px;">${requestScope.bean.mrating}</span>
				</div>
				<div class="meinfo" style="margin-top: 20px;">
					<span class="gmarket-m " style="font-size: 22px; margin-top: 20px;">작성한 게시글 수 :  </span> 
					<span class="font-blue gmarket-m" style="font-size: 22px;" id="resultSpan"></span>
				</div>
			</div>
		</div>
	</div>
<!-- 회원등급 사진과 정보 -->	

<!-- 작성한 게시물 -->	
	<div class="bo-box wow fadeInUp" data-wow-delay="0.1s">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-sm-10 free-bean"> 
					<div>
						<p class="sdms-font foodtour-subtitle text-left" style="font-size: 30px;">작성한 게시물</p>
						<hr class="subtitle-hr text-left" >
					</div>     	
					
					<!-- 카테고리 목록 Start -->
	            	<ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
	                <li class="nav-item">
	                    <a class="selectBO select-1 category d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
	                        <div class="ps-3">
	                            <h3 class="gmarket-m category-text">맛집</h2>
	                        </div>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="selectBO select-2 category d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
	                        <div class="ps-3">
	                            <h3 class="gmarket-m category-text">관광지</h2>
	                        </div>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="selectBO select-3 category d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
	                        <div class="ps-3">
	                            <h3 class="gmarket-m category-text">자유게시판</h2>
	                        </div>
	                    </a>
	                </li>
	            </ul>
	            <!-- 카테고리 목록 End -->
	            
	            <div class="tab-content">
	            
	            	<!-- 맛집 게시물 동적으로 표시하기 -->
	                <div id="tab-1" class="tab-pane p-0 active">
	                    <div class="row g-4">
	                    
	                    	<c:if test="${empty requestScope.foodList}">
							    <p class="empty-msg gmarket-s text-left" >'맛집' 게시판의 작성글이 존재하지 않습니다.</p>
							</c:if>
							
							<c:if test="${not empty requestScope.foodList}">
								<table class="table table-hover">
									<tbody>
										<c:forEach var="bean" items="${requestScope.foodList}">
											<tr class="text-left">
					                           	<td colspan="1" class="col-sm-1 comment">
					                           		<span class="sdms-font font-white badge badge-secondary"  style="font-size: 20px;">${bean.category}</span>
					                            </td>
					                            <td colspan="11" class="col-sm-9 comment">
					                            	<a href="<%=notWithFormTag%>fdDetail&no=${bean.no}">
					                            		<span class="gmarket-m thumbnail-title text-primary thum_title">${bean.title}</span>
					                            	</a>
					                            </td>
					                        </tr>
				                        </c:forEach>
			                        </tbody>
		                        </table>
	                        </c:if>	
	                       
	                    </div>
	                    ${requestScope.PageInfo_ko.pagingHtml} 
	                </div>
	             
	                <!-- 관광지 게시물 동적으로 표시하기 -->
	                <div id="tab-2" class="tab-pane p-0">
	                    <div class="row g-4">
	                    
	                    	<c:if test="${empty requestScope.tourList}">
							    <p class="empty-msg gmarket-s text-left" >'관광지' 게시판의 작성글이 존재하지 않습니다.</p>
							</c:if>
							
							<table class="table table-hover">
								<tbody>
									<c:forEach var="bean" items="${requestScope.tourList}">
										<tr class="text-left">
				                           	<td colspan="1" class="col-sm-1 comment">
				                           		<span class="sdms-font font-white badge badge-secondary"  style="font-size: 20px;">${bean.tcategory}</span>
				                            </td>
				                            <td colspan="11" class="col-sm-9 comment">
				                            	<a href="<%=notWithFormTag%>trDetail&tno=${bean.tno}">
				                            		<span class="gmarket-m thumbnail-title text-primary thum_title">${bean.ttitle}</span>
				                            	</a>
				                            </td>
				                        </tr>
			                        </c:forEach>
		                        </tbody>
	                        </table>	
	                       
	                    </div>
	                    ${requestScope.PageInfo_ko.pagingHtml}
	                </div>
	                
	                <!-- 자유게시판 게시물 동적으로 표시하기 -->
	                <div id="tab-3" class="tab-pane p-0">
	                    <div class="row g-4">
	                    
	                    	<c:if test="${empty requestScope.freeList}">
							    <p class="empty-msg gmarket-s text-left" >'자유게시판' 게시판의 작성글이 존재하지 않습니다.</p>
							</c:if>
							
							<table class="table table-hover">
								<tbody>
									<c:forEach var="bean" items="${requestScope.freeList}">
										<tr class="text-left">
				                           	<td colspan="1" class="col-sm-1 comment">
				                           		<span class="sdms-font font-white badge badge-secondary"  style="font-size: 20px;">${bean.pcategory}</span>
				                            </td>
				                            <td colspan="11" class="col-sm-9 comment">
				                            	<a href="<%=notWithFormTag%>frDetail&ono=${bean.ono}">
				                            		<span class="gmarket-m thumbnail-title text-primary thum_title">${bean.oname}</span>
				                            	</a>
				                            </td>
				                        </tr>
			                        </c:forEach>
		                        </tbody>
	                        </table>	
	                       
	                    </div>
	                    ${requestScope.PageInfo_ko.pagingHtml} 
	                </div>
	            </div>
	            
	            </div>
			</div>
		</div>
	</div>
<!-- 작성한 게시물 -->	
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>