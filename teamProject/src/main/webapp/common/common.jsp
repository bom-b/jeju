<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<%-- jstl을 위한 태그 라이브러리 선언 --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.jeju.model.bean.Member"%>

<!-- whologin 변수는 현재 로그인 상태를 알려 주는 변수입니다. -->
<!-- 미로그인(0) 일반 사용자(1) 관리자(2) -->
<c:set var="whologin" value="0"/>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.id == 'admin'}">
		<c:set var="whologin" value="2"/>
	</c:if>
	<c:if test="${sessionScope.loginfo.id != 'admin'}">
		<c:set var="whologin" value="1"/>
	</c:if>
</c:if>

<%
	// appName : 애플리케이션 이름(프로젝트 이름_Teacher)
	String appName = request.getContextPath();
	String mappingName = "/jeju" ;  // in FrontController.java file
	
	// form 태그에서 사용할 변수
	String withFormTag = appName + mappingName ;
	
	// form 태그가 아닌 영역에서 사용할 변수
	String notWithFormTag = appName + mappingName + "?command=";
	
	//out.print("프로젝트 이름 : " + appName + "<br/>") ;
	//out.print("mappingName : " + mappingName + "<br/>") ;
	//out.print("withFormTag : " + withFormTag + "<br/>") ;
	//out.print("notWithFormTag : " + notWithFormTag + "<br/>") ;
%>	

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>혼저옵서예~</title>
	<!-- 이 파일은 모든 문서에서 공용으로 참조할 파일입니다.  -->
	<!-- 자바 관련 변수 및 패키지 임포트, 네비게이션 바, jstl 등등 -->
	<!-- for sweet alert -->
	<script src="assets/js/sweetalert.js"></script>
	<link rel="shortcut icon" href="/assets/ico/icon.png">
	<style type="text/css">
		.alert-dismissible{margin: 10px;}
		.alert-danger{
			margin: 20px;
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
			color: orange;
		}
	</style>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-no-bg" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1" >
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="home.jsp" >1</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="top-navbar-1">
					<ul class="nav navbar-nav navbar-right navbar-search-button">
						<li><a class="search-button" href="#"><i class="fa fa-search"></i></a></li>
					</ul>
					<form class="navbar-form navbar-right navbar-search-form disabled wow fadeInLeft" role="form" action="" method="post">
						<div class="form-group">
							<input type="text" name="search" placeholder="Search..." class="search form-control">
						</div>
					</form>
					<ul class="nav navbar-nav navbar-right navbar-menu-items wow fadeIn">
						<li>
						<c:if test="${whologin eq 0}">
							<a class="nav-link sdms-font" style="font-size: 25px" href="<%=notWithFormTag%>meLogin">로그인</a>
						</c:if>
						<c:if test="${whologin ne 0}">
							<a class="nav-link sdms-font" style="font-size: 25px" href="<%=notWithFormTag%>meMenu">${sessionScope.loginfo.name}님 어서오세요!</a>
						</c:if>
						</li>
						<li><a class="sdms-font" style="font-size: 25px" href="<%=notWithFormTag%>fdMain">맛집</a></li>
						<li><a class="sdms-font" style="font-size: 25px" href="<%=notWithFormTag%>trMain">관광지</a></li>
					    <li><a class="sdms-font" style="font-size: 25px" href="<%=notWithFormTag%>evMain&confirmDate=allDate">행사</a></li>
						<li><a class="sdms-font" style="font-size: 25px" href="<%=notWithFormTag%>frMain">자유게시판</a></li>
					</ul>
					
				</div>
			</div>
		</nav>
	<%-- <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="home.jsp">TlqkfdhodksehlsirhRotoirlifdl</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item">
						<c:if test="${whologin eq 0}">
							<a class="nav-link" href="#">로그인</a>
						</c:if>
						<c:if test="${whologin ne 0}">
							<a class="nav-link" href="#">${sessionScope.loginfo.name}님</a>
						</c:if>
					</li>
					
					<!-- member section -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown">회원</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin eq 0}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meInsert">회원 가입</a></li>								
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meLogin">로그인</a></li>
							</c:if>		
							<c:if test="${whologin ne 0}">				
								<li><a class="dropdown-item" href="#">정보 수정</a></li>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meLogout">로그 아웃</a></li>
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meDetail&id=${sessionScope.loginfo.id}">상세 보기</a></li>
								<li><a class="dropdown-item" href="#">탈퇴하기</a></li>
							</c:if>
							<c:if test="${whologin eq 2}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>meList">목록 보기</a></li>
							</c:if>
						</ul>
					</li>
					
					<!-- board section -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown">게시물</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin ne 0}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>boInsert">게시물 등록</a></li>
							</c:if>
							<li><a class="dropdown-item" href="<%=notWithFormTag%>boList">목록 보기</a></li>
						</ul>
					</li>
					
					<!-- product section -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown">상품</a>
						<ul class="dropdown-menu">
							<c:if test="${whologin eq 2}">
								<li><a class="dropdown-item" href="<%=notWithFormTag%>prInsert">상품 등록</a></li>
							</c:if>
							<li><a class="dropdown-item" href="<%=notWithFormTag%>prList">목록 보기</a></li>
						</ul>
					</li>		
					
					<!-- view section -->
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown">데이터 보기</a>
						<ul class="dropdown-menu">
							<li>
								<a class="dropdown-item" href="<%=notWithFormTag%>vwList">목록 보기
								</a>
							</li>
						</ul>
					</li>	
					
				</ul>
			</div>
		</div>
	</nav> --%>
	
	<c:if test="${not empty sessionScope.alertMessage}">
		<%-- 사용자에게 주의/경고/오류 등을 알려 주기 위한 Alert Box --%>
		<div class="alert alert-danger alert-dismissible">
	    	<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
	    	<strong>경고 메시지</strong> ${sessionScope.alertMessage}
	  	</div>
	</c:if>
	<%-- 보여준 Alert Box를 session 영역에서 제거합니다. --%>
	<c:remove var="alertMessage" scope="session"/> 
</body>
</html>
