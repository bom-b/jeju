<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%-- 홈 전용 style.css --%>
<link href="<%=appName%>/assets/css/homestyle.css" rel="stylesheet">

<%-- 홈 전용 home.js --%>
<script src="<%=appName%>/assets/js/home.js"></script>

<script type="text/javascript">

</script>

<style type="text/css">
/* 지마켓 산스체 */
@font-face {
    font-family: 'Gmarket-s';
    font-weight: 300;
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansLight.eot');
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansLight.eot?#iefix') format('embedded-opentype'),
         url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansLight.woff2') format('woff2'),
         url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansLight.woff') format('woff'),
         url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansLight.ttf') format("truetype");
    font-display: swap;
} 
@font-face {
    font-family: 'Gmarket-m';
    font-weight: 500;
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansMedium.eot');
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansMedium.eot?#iefix') format('embedded-opentype'),
         url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansMedium.woff2') format('woff2'),
         url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansMedium.woff') format('woff'),
         url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansMedium.ttf') format("truetype");
    font-display: swap;
} 
@font-face {
    font-family: 'Gmarket-l';
    font-weight: 700;
    font-style: normal;
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansBold.eot');
    src: url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansBold.eot?#iefix') format('embedded-opentype'),
         url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansBold.woff2') format('woff2'),
         url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansBold.woff') format('woff'),
         url('https://cdn.jsdelivr.net/gh/webfontworld/gmarket/GmarketSansBold.ttf') format("truetype");
    font-display: swap;
} 

@font-face{
font-family:'SDMiSaeng'; /*글꼴*/
src: local('SDMiSaeng'),
	url('SDMiSaeng.eot'),
	url('SDMiSaeng.woff') format('woff'),
	url('assets/font-awesome/fonts/SDMiSaeng.ttf') format('truetype');
}

.sdms-font{
	font-family: 'SDMiSaeng', sans-serif;/*웹 폰트 지정*/
}

.gmarket-s {
	font-family: 'Gmarket-s';
}

.gmarket-m {
	font-family: 'Gmarket-m';
}

.gmarket-l {
	font-family: 'Gmarket-l';
}

</style>

</head>
<body>
	<!-- Top content -->
	<div class="top-content">
	    <div class="container">
	        <div class="row">
	            <div class="col-sm-12 text wow fadeInLeft">
	                <h1 class="sdms-font" style="font-size: 100px">혼저옵서예~</h1>
	                <div class="description">
	                	<p class="medium-paragraph sdms-font" style="font-size: 50px; color: white;">
	                 	안녕하우꽈~
	                	</p>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 이달의 행사 (행사 등록 최신순 top3 추출) -->	
	<div class="event-box container-xxl py-5">
		<div class="carousel-container-pa container my-5 py-5">
			<div class="carousel-container">
			  <h4 class="gmarket-m event-title text-left" >제주도의 행사를 만나보세요! (최신게시물은 사진이 없어 추후 최신순으로 배치예정)</h4>
			  <div class="carousel-imgs">
			  		<div class="carousel-img visible">
				  		<a href="<%=notWithFormTag%>evDetail&eno=${requestScope.eventList[0].eno}">
				  			<img src="<%=appName%>/upload/${requestScope.eventList[0].eimage2}" alt="최근게시물의 이미지1"/>
				  		</a>
			  		</div>
				  	<div class="carousel-img hidden">
						<a href="<%=notWithFormTag%>evDetail&eno=${requestScope.eventList[1].eno}">
					  		<img src="<%=appName%>/upload/${requestScope.eventList[1].eimage2}" alt="최근게시물의 이미지2"/>
					  	</a>
			  		</div>
				  	<div class="carousel-img hidden">
						<a href="<%=notWithFormTag%>evDetail&eno=${requestScope.eventList[2].eno}">
				  			<img src="<%=appName%>/upload/${requestScope.eventList[2].eimage2}" alt="최근게시물의 이미지3"/>
					  	</a>
			  		</div>
			  </div>
			    <a class="prev arrow">&#10094;</a>
			    <a class="next arrow">&#10095;</a>
			  <div class="slide-numbers">
			      <span class="dot active"></span>
			      <span class="dot"></span>
			      <span class="dot"></span>
			  </div>
			  <div class="carousel-captions">
				  <p class="gmarket-m event-captions carousel-captionx visible">${requestScope.eventList[0].startdate} ~ ${requestScope.eventList[0].enddate}<br>${requestScope.eventList[0].ename}</p>
				  <p class="gmarket-m event-captions carousel-captionx hidden">${requestScope.eventList[1].startdate} ~ ${requestScope.eventList[1].enddate}<br>${requestScope.eventList[1].ename}</p>
				  <p class="gmarket-m event-captions carousel-captionx hidden">${requestScope.eventList[2].startdate} ~ ${requestScope.eventList[2].enddate}<br>${requestScope.eventList[2].ename}</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 이달의 행사 -->
	
   	<!-- 이달의 맛집과 관광지 -->
	<div class="foodtour-box container-xxl py-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<h3 class="gmarket-m textsize25 text-left">이달의 베스트</h3>
				<h5 class="gmarket-s text-left">회원님들이 가장 많이 추천한 게시물 입니다.</h5>
				<hr class="subtitle-hr">
				<div class="col-sm-6 foodtour-bean"> 
					<div>
						<p class="gmarket-m foodtour-subtitle text-left" >맛집</p>
						<div class="col-sm-6 foodtour-bean text-left">
							<a href="<%=notWithFormTag%>fdDetail&no=7">
								<img class="thum-image" alt="" src="<%=appName%>/upload/bagda01.png" alt="sub-image">
							</a>
							
							<p class="gmarket-m foodtour-subcon text-left" >바그다드</p>
							<p class="gmarket-s foodtour-subcon text-left" >한식</p>
						</div>
						<div class="col-sm-6 foodtour-bean text-left">
							<a href="<%=notWithFormTag%>fdDetail&no=7">
								<img class="thum-image" alt="" src="<%=appName%>/upload/bagda01.png" alt="sub-image">
							</a>
							
							<p class="gmarket-m foodtour-subcon text-left" >바그다드</p>
							<p class="gmarket-s foodtour-subcon text-left" >한식</p>
						</div>
						<div class="col-sm-6 foodtour-bean text-left">
							<a href="<%=notWithFormTag%>fdDetail&no=7">
								<img class="thum-image" alt="" src="<%=appName%>/upload/bagda01.png" alt="sub-image">
							</a>
							
							<p class="gmarket-m foodtour-subcon text-left" >바그다드</p>
							<p class="gmarket-s foodtour-subcon text-left" >한식</p>
						</div>
						<div class="col-sm-6 foodtour-bean text-left">
							<a href="<%=notWithFormTag%>fdDetail&no=7">
								<img class="thum-image" alt="" src="<%=appName%>/upload/bagda01.png" alt="sub-image">
							</a>
							
							<p class="gmarket-m foodtour-subcon text-left" >바그다드</p>
							<p class="gmarket-s foodtour-subcon text-left" >한식</p>
						</div>
					</div>     	
				</div>
				<div class="col-sm-6 foodtour-bean"> 
					<div>
						<p class="gmarket-m foodtour-subtitle text-left" >관광지</p>
						<div class="col-sm-6 foodtour-bean text-left">
							<a href="<%=notWithFormTag%>fdDetail&no=7">
								<img class="thum-image" alt="" src="<%=appName%>/upload/bagda01.png" alt="sub-image">
							</a>
							
							<p class="gmarket-s foodtour-subcon text-left" >바그다드</p>
							<p class="gmarket-s foodtour-subcon text-left" >한식</p>
						</div>
						<div class="col-sm-6 foodtour-bean text-left">
							<a href="<%=notWithFormTag%>fdDetail&no=7">
								<img class="thum-image" alt="" src="<%=appName%>/upload/bagda01.png" alt="sub-image">
							</a>
							
							<p class="gmarket-s foodtour-subcon text-left" >바그다드</p>
							<p class="gmarket-s foodtour-subcon text-left" >한식</p>
						</div>
						<div class="col-sm-6 foodtour-bean text-left">
							<a href="<%=notWithFormTag%>fdDetail&no=7">
								<img class="thum-image" alt="" src="<%=appName%>/upload/bagda01.png" alt="sub-image">
							</a>
							
							<p class="gmarket-s foodtour-subcon text-left" >바그다드</p>
							<p class="gmarket-s foodtour-subcon text-left" >한식</p>
						</div>
						<div class="col-sm-6 foodtour-bean text-left">
							<a href="<%=notWithFormTag%>fdDetail&no=7">
								<img class="thum-image" alt="" src="<%=appName%>/upload/bagda01.png" alt="sub-image">
							</a>
							
							<p class="gmarket-s foodtour-subcon text-left" >바그다드</p>
							<p class="gmarket-s foodtour-subcon text-left" >한식</p>
						</div>
					</div>     	
				</div>
			</div>
		</div>
	</div>
	<!-- 이달의 맛집과 관광지 -->
	
	<!-- 자유게시판과 회원랭킹 -->	
	<div class="container-xxl py-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-sm-8"> 
					<div>
						<p>자유게시판 베스트 8</p>
					</div>     	
				</div>
				<div class="col-sm-4">
					<div>
						<p>회원랭킹 4</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 자유게시판과 회원랭킹 -->	

	 <!-- Footer -->
	 <footer>
	  <div class="container">
	  	<div class="row">
	  		<div class="col-sm-12 footer-copyright">
	             	<i class="fa fa-love"></i><a class="sdms-font" style="font-size: 30px; color: dark;" href="https://www.jeju.go.kr/index.htm">제주도청으로</a></a>
	             </div>
	         </div>
	  </div>
	 </footer>
</body>
</html>