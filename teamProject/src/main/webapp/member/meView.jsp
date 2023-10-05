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
	color: 
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
<!-- 메인사진과 메인설명 -->
	<div class="main container-xxl py-5">
		<div class="text-left container my-5 py-5">
			<h4 class="sdms-font font-black event-title text-left" style="font-size: 30px;">'${requestScope.bean.id}'님의 페이지 입니다.</h4>
		</div>
		<div class="mainBox container my-5 py-5 wow fadeInUp" data-wow-delay="0.1s">
			
			<div class="col-sm-5">
				
				<img class="main-image" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbcdHQb%2FbtsuG4zaJd7%2F9MkJVs5zrmwJYsBcTMSJJ0%2Fimg.png" alt="main-image">
				
			</div>
			<div class="content col-sm-7">
				<div class="title">
					<span class="gmarket-m sub-title" style="font-weight: bold;">ID : </span> 
					<span class="title text-primary">${requestScope.bean.id}</span>
				</div>
				<div class="title">
					<span class="gmarket-m sub-title" style="font-weight: bold;">등급포인트 : </span> 
					<span class="title text-primary">${requestScope.bean.id}</span>
				</div>
			</div>
		</div>
	</div>
<!-- 메인사진과 메인설명 -->	
</body>
</html>