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
<link rel="stylesheet" href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">
<link href="<%=appName%>/assets/css_boardmain/style.css" rel="stylesheet">
<!-- 게시판 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_eventmain/eventmain.css" rel="stylesheet">
<link href="<%=appName%>/assets/css_eventmain/nicepage.css" rel="stylesheet" media="screen">
<link href="<%=appName%>/assets/css_eventmain/Page-2.css" rel="stylesheet" media="screen">
<link href="<%=appName%>/assets/css_eventmain/Page-4.css" rel="stylesheet" media="screen">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<%-- 카카오지도 관련 코드 --%>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey= e9690708443890b865a0c886aadfeff8"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9690708443890b865a0c886aadfeff8&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9690708443890b865a0c886aadfeff8&libraries=services,clusterer,drawing"></script>

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
* {
		    font-family: 'TheJamsil400';
}
</style>
</head>
<body class="u-body u-xl-mode" data-lang="en" >
	<!-- 헤더 Start -->
	<div class="container-xxl py-5 bg-dark event-detail-header mb-5 ">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-lg-6 text-center text-lg-start">
						<h1 class="display-3 text-white" style="margin-bottom: 15px; font-size: 64px;font-family: 'TheJamsil100';font-weight: inherit;">상세정보</h1>
					<p class="medium-paragraph" style="font-size: 18px;">제주도의 행사를 자세히 알아보아요</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 End -->
	<!--  이미지와 간단설명 start -->
	<div class="container" style="background-color: #faf1e4">
	<section class="u-clearfix u-section-1" id="sec-d4a9">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-custom-color-4 u-expanded-width-lg u-expanded-width-md u-expanded-width-xl u-expanded-width-xs u-shape u-shape-rectangle u-shape-1"></div>
			<%-- <img src="<%=appName%>/assets/img/event_img/morae.png" alt=""
				class="u-image u-image-contain u-image-default u-image-1"
				data-image-width="500" data-image-height="396">  --%><img
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
	<section class="u-clearfix u-grey-90 u-section-1" id="sec-8486">
      <div class="u-clearfix u-sheet u-valign-middle-lg u-valign-middle-md u-valign-middle-xl u-sheet-1">
        <div class="u-expanded-width u-list u-list-1">
          <div class="u-repeater u-repeater-1">
            <div class="u-container-align-center u-container-style u-image u-image-round u-list-item u-radius-50 u-repeater-item u-shading u-image-1" data-image-width="1500" data-image-height="1000">
              <div class="u-container-layout u-similar-container u-valign-middle u-container-layout-1">
                <h6 class="u-align-center u-text u-text-default u-text-1"> Food Sourcing</h6>
              </div>
            </div>
            <div class="u-container-align-center u-container-style u-image u-image-round u-list-item u-radius-50 u-repeater-item u-shading u-image-2" data-image-width="2250" data-image-height="1500">
              <div class="u-container-layout u-similar-container u-valign-middle u-container-layout-2">
                <h6 class="u-align-center u-text u-text-default u-text-2"> Menu Development</h6>
              </div>
            </div>
            <div class="u-container-align-center u-container-style u-image u-image-round u-list-item u-radius-50 u-repeater-item u-shading u-image-3" data-image-width="1500" data-image-height="1000">
              <div class="u-container-layout u-similar-container u-valign-middle u-container-layout-3">
                <h6 class="u-align-center u-text u-text-default u-text-3"> Restaurant</h6>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	<%-- <div class="container post" style="margin-top: -500px;">
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
	</div> --%>

	    <section class="u-clearfix mapCss" id="carousel_4cef">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="data-layout-selected u-clearfix u-expanded-width u-layout-wrap u-layout-wrap-1">
          <div class="u-layout">
            <div class="u-layout-row col-md-8">
              <div class="u-align-left u-container-style u-layout-cell u-left-cell u-size-30 u-layout-cell-1">
                <div class="u-container-layout u-valign-middle u-container-layout-1">
                  <p class="u-text u-text-2">${requestScope.eventDetail.eplace}</p>
               <p class="u-text u-text-2">${requestScope.eventDetail.ephoneno}</p>
                  <p class="u-text u-text-4">
                  <a href="javascript:history.back();"
							class="u-btn u-button-style u-custom-color-11 u-text-white u-btn-1">뒤로가기</a>
                  </p>
                </div>
              </div>
              <div class="u-container-style u-layout-cell u-right-cell u-size-30 u-layout-cell-2">
                <div class="u-container-layout u-container-layout-2">
                  <div class="u-expanded  u-map">
                    	<!-- 지도 -->
				<div class="map-zone col-sm-5 wow fadeInUp" data-wow-delay="0.3s" style="padding-right:30px; margin-bottom: 60px;">
					<div class="col-md-4" >
			       		  <div id="map" style="width: 600px; height: 450px;"></div>
			      	</div>
				</div>
				<!-- 지도 -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>


</div>
<%-- 지도 --%>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${requestScope.eventDetail.eplace}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	        	content: '<div style="width:150px;text-align:center;padding:6px 0;">${requestScope.eventDetail.eplace}</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
<%-- 지도 --%>
</body>
</html>