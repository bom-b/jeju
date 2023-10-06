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
	        	<h3 class="main-title gmarket-m textsize28 text-left wow fadeInDown" data-wow-delay="0.1s">제주도 여행의 모든것,</h3>
	            <div class="main-title2 col-sm-12 text wow fadeInLeft">
	                <h1 class="sdms-font text-left" style="font-size: 150px" data-wow-delay="0.3s">혼저옵서예</h1>
	                <div class="description">

	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 이달의 행사 (행사 등록 최신순 top3 추출) -->	
	<div class="event-box container-xxl py-5">
		<div class="carousel-container-pa container my-5 py-5">
			<div class="carousel-container">
			  <h4 class="sdms-font font-black event-title text-left" style="font-size: 30px;">운영자가 추천하는 제주도의 행사를 만나보세요!</h4>
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
		<h6 class="gmarket-s text-center" >(최신게시물은 사진이 없어 추후 최신순으로 변경예정. 현재 가장 오래된 순)</h6>
	</div>
	<!-- 이달의 행사 -->
	
   	<!-- 이달의 맛집과 관광지 -->
	<div class="foodtour-box container-xxl py-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<h3 class="sdms-font font-black text-left" style="font-size: 50px;">이달의 베스트!</h3>
				<h5 class="sdms-font font-gray text-left" style="font-size: 18px;">회원님들이 가장 많이 추천한 게시물 입니다.</h5>
				<hr class="subtitle-hr">
				<%-- 맛집 --%>
				<div class="col-sm-6 foodtour-bean"> 
					<div>
						<a href="<%=notWithFormTag%>fdMain">
							<p class="sdms-font foodtour-subtitle text-left" style="font-size: 40px;">맛집</p>
						</a>
						<c:forEach var="bean" items="${requestScope.foodList}">
							<div class="col-sm-6 foodtour-bean text-left">
								<a href="<%=notWithFormTag%>fdDetail&no=${bean.no}">
									<img class="thum-image" alt="" src="<%=appName%>/upload/${bean.image1}" alt="썸네일">
								</a>
								<p class="gmarket-m foodtour-subcon text-left" >${bean.title}</p>
								<p class="gmarket-s foodtour-subcon text-left" >${bean.category}</p>
							</div>
						</c:forEach>
						<%-- <a class="gmarket-m moreview text-left" >맛집 더보기</a> --%>
					</div>
				</div>
				
				<%-- 관광지 --%>
				<div class="col-sm-6 foodtour-bean"> 
					<div>
						<a href="<%=notWithFormTag%>trMain">
							<p class="sdms-font foodtour-subtitle text-left" style="font-size: 40px;">관광지</p>
						</a>
						<c:forEach var="bean" items="${requestScope.tourList}">
							<div class="col-sm-6 foodtour-bean text-left">
								<a href="<%=notWithFormTag%>trDetail&tno=${bean.tno}">
									<img class="thum-image" alt="" src="<%=appName%>/upload/${bean.timage1}" alt="썸네일">
								</a>
								<p class="gmarket-m foodtour-subcon text-left" >${bean.ttitle}</p>
								<p class="gmarket-s foodtour-subcon text-left" >${bean.tcategory}</p>
							</div>
						</c:forEach>
					</div>     	
				</div>
			</div>
		</div>
	</div>
	<!-- 이달의 맛집과 관광지 -->
	
	<!-- 자유게시판과 회원랭킹 -->	
	<div class="freemember-box container-xxl py-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-sm-8 free-bean"> 
					<div>
						<a href="<%=notWithFormTag%>frMain">
							<p class="sdms-font foodtour-subtitle text-left" style="font-size: 40px;">자유게시판 베스트</p>
						</a>	
						<hr class="subtitle-hr">
					</div>
					<div>	
						<table class="table table-hover">
							<tbody>
								<c:forEach var="bean" items="${requestScope.freeList}">
								<tr class="text-left">
		                           	<td colspan="1" class="col-sm-1 comment">
		                           		<span class="sdms-font font-white badge badge-secondary"  style="font-size: 20px;">${bean.pcategory}</span>
		                            </td>
		                            <td colspan="9" class="col-sm-9 comment">
		                            	<a href="<%=notWithFormTag%>frDetail&ono=${bean.ono}">
		                            		<span class="gmarket-m thumbnail-title text-primary  thum_title">${bean.oname}</span>
		                            	</a>
		                            </td>
		                            <td colspan="2" class="col-sm-2 comment text-right">
			                            <img class="thumbnail-content" src="<%=appName%>/assets/img/thumb.png" alt="recommand" style="width: 20px;">
			                            <span class="gmarket-l"> ${bean.olikes}</span>
		                            </td>
		                        </tr>
		                        </c:forEach>
	                        </tbody>
                        </table>	
					</div>     	
				</div>
				<div class="col-sm-4">
					<div class="memberBox">
						<div style="margin-bottom: 30px;">
							<h3 class="sdms-font textsize25 text-center" style="white-space: nowrap; font-size: 40px;">
								<img class="thumbnail-content" src="<%=appName%>/assets/img/crown.png" alt="crown.png" style="width: 30px;">
								회원랭킹
								<img class="thumbnail-content" src="<%=appName%>/assets/img/crown.png" alt="crown.png" style="width: 30px;">
							</h3>
							<h4 class="sdms-font text-center" style="white-space: nowrap; font-size: 30px;">
								top 10
							</h4>
						</div>
						<div>
							<table class="table table-borderless">
								<tbody>
									<c:forEach var="bean" items="${requestScope.memberList}">
									<tr class="non-border text-left">
			                           	<td colspan="1" class="non-border col-sm-1">
			                           		<c:if test="${bean.rank == 1}">
			                           			<img class="thumbnail-content" src="<%=appName%>/assets/img/gold.png" style="width: 15px;">
			                           		</c:if>
			                           		<c:if test="${bean.rank == 2}">
			                           			<img class="thumbnail-content" src="<%=appName%>/assets/img/silver.png" style="width: 15px;">
			                           		</c:if>
			                           		<c:if test="${bean.rank == 3}">
			                           			<img class="thumbnail-content" src="<%=appName%>/assets/img/bronze.png" style="width: 15px;">
			                           		</c:if>
			                           		<c:if test="${bean.rank > 3}">
			                           			<span class="gmarket-s badge badge-secondary" style="font-size:: 20px;">${bean.rank}</span>
			                           		</c:if>
			                            </td>
			                            <td colspan="11" class="non-border col-sm-11 text-center">
			                            	<a href="<%=notWithFormTag%>meView&id=${bean.id}">
			                            		<span class="gmarket-m font-blue" style="white-space: nowrap; font-size: 16px;">
			                            		<img class="" src="<%=appName%>/assets/img/${bean.ratingimg}" height="20px;" width="20px;" style="margin-right: 10px;">
			                            		  ${bean.id}
			                            		</span>
			                            	</a>
			                            </td>
			                        </tr>
			                        </c:forEach>
		                        </tbody>
	                        </table>	
						</div>
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
	             	<i class="fa fa-love"></i><a class="sdms-font" style="font-size: 30px; color: dark;" href="https://www.jeju.go.kr/index.htm">제주도청으로</a>
	             </div>
	         </div>
	 	 </div>
	 </footer>
</body>
</html>