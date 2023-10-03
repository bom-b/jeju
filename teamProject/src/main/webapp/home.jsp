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

<script type="text/javascript">

</script>

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
	color: orange;
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
	
	<!-- 이달의 행사 -->	
	<div class="container-xxl py-5">
		<div class="container my-5 py-5">
		
			
				
		</div>
	</div>
	
	<div class="container-xxl py-5">
		<div class="container my-5 py-5">


		</div>
	</div>
	<!-- 이달의 행사 -->
	
   	<!-- 이달의 맛집과 관광지 -->
	<div class="container-xxl py-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<h3 class="text-left">이달의 베스트</h3>
				<hr class="subtitle-hr">
				<div class="col-sm-6 "> 
					<div>
						<p>맛집 베스트 6</p>
					</div>     	
				</div>
				<div class="col-sm-6">
					<div>
						<p>관광지 베스트 6</p>
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