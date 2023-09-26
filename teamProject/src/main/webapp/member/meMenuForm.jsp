<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@ include file="/common/bootstrap5.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 게시판 메인 전용 부트스트랩 -->
<link rel="stylesheet" href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">

<!-- 게시판 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_memenucss/memainstyle.css" rel="stylesheet">
<style>
	.memenu-container {
    	display: flex;
    	flex-direction: column;
    	justify-content: center;
    	align-items: center;
    	height: 100vh;
    	/* Set the background image and adjust its size */
    	background-image: url('assets/img/loginbackground.jpeg');
    	background-size: cover;
    	background-repeat: no-repeat;
    	background-position: center center;
		}
        .bottom_button { margin-top: 20px; } /* Increase the margin-top for spacing */
        @font-face{
		font-family:'SDMiSaeng'; /*글꼴*/
		src: local('SDMiSaeng'),
			url('SDMiSaeng.eot'),
			url('SDMiSaeng.woff') format('woff'),
			url('assets/font-awesome/fonts/SDMiSaeng.ttf') format('truetype');
		}

		.sdms-font{
			font-family: 'SDMiSaeng', sans-serif;/*웹 폰트 지정*/
			color: orange;
		}
</style>
</head>
<body>
	<div class="memenu-container py-5">
	    <div class="container">
	    <h2 class="sdms-font" style="font-size: 100px">회원메뉴</h2>
	        <div class="row g-4">	            
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
	                <div class="bn-melogout banner-item rounded pt-3">
	                    <div class="p-5">
	                        <a class="banner-text text-white" href="<%=notWithFormTag%>meLogout">로그아웃</a>                        
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
	                <div class="bn-meinfo banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <a class="banner-text text-white" href="<%=notWithFormTag%>meDetail">회원정보</a>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
	                <div class="bn-meupdate banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <a class="banner-text text-white" href="<%=notWithFormTag%>meUpdate">정보수정</a>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
	                <div class="bn-medelete banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <a class="banner-text text-white" href="<%=notWithFormTag%>meDelete">회원탈퇴</a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>