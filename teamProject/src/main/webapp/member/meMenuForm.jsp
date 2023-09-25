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
<link href="<%=appName%>/assets/css_boardmain/style.css" rel="stylesheet">
</head>
<body>
	<div class="container-xxl py-5">
	    <div class="container">
	        <div class="row g-4">	            
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
	                <div class="bn-yansik banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white">로그아웃</h1>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
	                <div class="bn-cafe banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white">회원정보</h1>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
	                <div class="bn-beer banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white">정보수정</h1>
	                    </div>
	                </div>
	            </div>
	            <div class="col-lg-6 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
	                <div class="bn-beer banner-item rounded pt-3">
	                    <div class="p-5">
	                        <i class="text-primary mb-4"></i>
	                        <h1 class="banner-text text-white">회원탈퇴</h1>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>