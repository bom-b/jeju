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
<link href="<%=appName%>/assets/css_eventmain/nicepage.css"
	rel="stylesheet" media="screen">
<link href="<%=appName%>/assets/css_eventmain/Page-2.css"
	rel="stylesheet" media="screen">
<link href="<%=appName%>/assets/css_eventmain/Page-4.css"
	rel="stylesheet" media="screen">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	function openContent() {
		document.getElementById("detailContent").style.display = "block";
	}
	$(function() {
		// 이미지 슬라이드 컨트롤를 사용하기 위해서 carousel를 실행
		$('#carouselDiv').carousel({
			// 슬리아딩 자동 순환 지연 시간
			interval : 2000,
			// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
			pause : "hover",
			// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
			wrap : true
		});
	});
</script>
<style type="text/css">
#detailContent {
	display: none
}
</style>
</head>
<body data-path-to-root="./" class="u-body u-xl-mode" data-lang="en">
	<!--  이미지와 간단설명 start -->
	<section class="u-clearfix u-section-1" id="sec-d4a9">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div
				class="u-custom-color-4 u-expanded-width-lg u-expanded-width-md u-expanded-width-xl u-expanded-width-xs u-shape u-shape-rectangle u-shape-1"></div>
			<img src="<%=appName%>/assets/img/event_img/morae.png" alt=""
				class="u-image u-image-contain u-image-default u-image-1"
				data-image-width="500" data-image-height="396"> <img
				src="<%=appName%>/assets/img/event_img/${requestScope.eventDetail.eimage1}"
				alt="" class="u-image u-image-default u-image-2"
				data-image-width="400" data-image-height="400"> <img
				src="<%=appName%>/assets/img/event_img/eventlogo.png" alt=""
				class="u-image u-image-contain u-image-default u-image-3"
				data-image-width="120" data-image-height="120">
			<div class="u-container-style u-expanded-width-xs u-group u-group-1">
				<div class="u-container-layout u-valign-top-lg u-container-layout-1">
					<h1 class="u-text u-text-custom-color-13 u-title u-text-1">
						<span>${requestScope.eventDetail. ename}</span>
					</h1>

					<c:set var="data" value="${requestScope.eventDetail}" />
					<c:if test="${fn:length(data.econtent)>=100 }">
						<p class="u-large-text u-text u-text-variant u-text-2">${fn:substring(data.econtent,0,100)}......</p>
						<a href="#"
							class="u-btn u-button-style u-custom-color-11 u-text-white u-btn-1"
							onclick="openContent()">자세히 보기</a>
					</c:if>
					<c:if test="${fn:length(data.econtent)<100 }">
						<p class="u-large-text u-text u-text-variant u-text-2">${requestScope.eventDetail.econtent}</p>
						<a href=""
							class="u-btn u-button-style u-custom-color-11 u-text-white u-btn-1"
							style="display: none;">자세히 보기</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!--     자세한 설명 start -->
	<section class="u-clearfix u-section-2" id="detailContent">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div
				class="u-custom-color-4 u-shape u-shape-rectangle u-text-custom-color-4 u-shape-1"></div>
			<div
				class="u-align-left u-container-style u-expanded-width-xs u-group u-group-1">
				<div class="u-container-layout u-container-layout-1">
					<div
						class="u-align-left u-border-2 u-border-palette-3-base u-line u-line-vertical u-line-1"></div>
					<p class="u-large-text u-text u-text-variant u-text-2">${requestScope.eventDetail.econtent}</p>
				</div>
			</div>
		</div>
	</section>
	<!--     자세한 설명 end -->
	<div class="container post" style="margin-top: 120px;">
		<div>
			<div class="carousel">
				<ul class="slides" style="border-radius: 20px;">
					<input type="radio" name="radio-buttons" id="img-1" checked />
					<li class="slide-container">
						<div class="slide-image">
							<img
								src="<%=appName%>/assets/img/event_img/${requestScope.eventDetail.eimage1}">
						</div>
						<div class="carousel-controls">
							<label for="img-3" class="prev-slide"> <span>&lsaquo;</span>
							</label> <label for="img-2" class="next-slide"> <span>&rsaquo;</span>
							</label>
						</div>
					</li>
					<input type="radio" name="radio-buttons" id="img-2" />
					<li class="slide-container">
						<div class="slide-image">
							<img
								src="<%=appName%>/assets/img/event_img/${requestScope.eventDetail.eimage2}">
						</div>
						<div class="carousel-controls">
							<label for="img-1" class="prev-slide"> <span>&lsaquo;</span>
							</label> <label for="img-3" class="next-slide"> <span>&rsaquo;</span>
							</label>
						</div>
					</li>
					<input type="radio" name="radio-buttons" id="img-3" />
					<li class="slide-container">
						<div class="slide-image">
							<img
								src="<%=appName%>/assets/img/event_img/${requestScope.eventDetail.eimage3}">
						</div>
						<div class="carousel-controls">
							<label for="img-2" class="prev-slide"> <span>&lsaquo;</span>
							</label> <label for="img-1" class="next-slide"> <span>&rsaquo;</span>
							</label>
						</div>
					</li>
					<div class="carousel-dots">
						<label for="img-1" class="carousel-dot" id="img-dot-1"></label> <label
							for="img-2" class="carousel-dot" id="img-dot-2"></label> <label
							for="img-3" class="carousel-dot" id="img-dot-3"></label>
					</div>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>