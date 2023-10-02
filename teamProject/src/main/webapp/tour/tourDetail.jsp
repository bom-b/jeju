<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 페이지</title>


<script type="text/javascript">

</script>

<style type="text/css">
/* 메인사진과 메인설명 */
.main{
	margin-top: 100px;
	margin-bottom: 20px;
	
}

.mainBox {
	/* border: 2px solid rgb(255, 232, 221); /* 테두리 두께와 색상 설정 */
	border: 2px solid #f2f2f2;
    border-radius: 5px;
    background-color: #f2f2f2;
	padding: 50px; /* 테두리와 내용 사이의 간격 설정 */

}

.writerBox {
	/* border: 2px solid rgb(255, 232, 221);
	border: 2px solid #f2f2f2;
    border-radius: 5px;
    background-color: #f2f2f2;
	padding-left: 15px; 
	padding-right: 50px; */
	
	display: inline-block; /* 내용물 크기에 따라 동적으로 조절 */
	margin-bottom: 10px;

}

.menubox {
	margin-top: 20px;
	border: 2px solid  #e6e6e6; 
    border-radius: 5px;
    background-color: white;
	padding-top: 10px; 
	padding-bottom: 10px;
	display: inline-block; /* 내용물 크기에 따라 동적으로 조절 */
}

.menubox-sub {
	display: block;
    align-items: center; /* 수직 정렬 */
    white-space: nowrap; /* 텍스트 한 줄로 표시 */
}

.commentBox {
	margin-top: 100px;
}

.content{
	align: left;
	text-align: left;
	padding-left: 50px;
	
}

.mainimage{
	padding: 1px;
}

.title {
	font-size: 25px;
	font-weight: bold;
	margin-bottom: 20px;
}

.sub-title.writer {
    font-weight: bold !important;
}

.contents {
	margin-bottom: 10px;
}

/* 추천버튼 */
.thumb {
	margin-bottom: 15px
}

/* 댓글창 */
.table-hover {
	border-spacing: 30px; /* 행과 열 사이의 여백 설정 */

}

.comment {
	padding-top: 20px !important;
	padding-bottom: 30px !important;
}

.regdate{
	font-size: 12px;
}

#insertComment {
	margin-top: 100px;
}

#fakeid {
    width: 250px;
}

/* 이미지 사이즈 맞추기 */
.main-image {
width: 350px;
height: 350px;
overflow: hidden;
background-size: cover;
background-position: center;
object-fit: cover; /* 이미지 비율 유지하며 크기 조절 */
}

.sub-image {
width: 250px;
height: 250px;
overflow: hidden;
background-size: cover;
background-position: center;
object-fit: cover;
}
</style>

</head>
<body>
<!-- 메인사진과 메인설명 -->
	<div class="main container-xxl py-5">
		<div class="text-left container my-5 py-5">
		
			<!-- 작성자와 작성일자 -->
			<div class="writerBox wow fadeInUp" data-wow-delay="0.1s">
				<div class="contents" >
					<span class="sub-title"><strong>작성자: </strong></span>
					<img class="" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbcdHQb%2FbtsuG4zaJd7%2F9MkJVs5zrmwJYsBcTMSJJ0%2Fimg.png" height="25px;" width="25px;">
					<span class="">${requestScope.bean.id}</span>
				</div>
				<div class="">
					<span class="sub-title"><strong>작성일자: </strong></span>
					<span class="">${requestScope.bean.regdate}</span>
				</div>
			</div>
			<!-- 작성자와 작성일자 -->
			
		</div>
		<div class="mainBox container my-5 py-5 wow fadeInUp" data-wow-delay="0.3s">
			<div class="col-sm-5">
				<img class="main-image" src="<%=appName%>/upload/${requestScope.bean.timage1}">
			</div>
			<div class="content col-sm-7">
				<div class="title">
					<span class="title text-primary">${requestScope.bean.tname}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>주소 : </strong></span> 
					<span class="">${requestScope.bean.tplace}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>개장 시간 : </strong></span> 
					<span class="">${requestScope.bean.ttime}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>연락처: </strong></span> 
					<span class="">${requestScope.bean.tphoneno}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>입장료: </strong></span> 
					<span class="">${requestScope.bean.tprice}</span>
				</div>	
				</div>
			</div>
		</div>
<!-- 메인사진과 메인설명 -->	

	<!-- 추천버튼 -->
	<div class="thumb container-xxl py-5 wow fadeInUp" data-wow-delay="0.5s">
		<div class="container my-5 py-5 text-right">
		<c:if test="${sessionScope.loginfo.id eq requestScope.bean.id}">
				<a href="<%=notWithFormTag%>trDelete&tno=${requestScope.bean.tno}">
				<button type="submit" class="btn btn-danger follower">
					<span>
						<span class=""> 삭제하기 </span>
					</span>
				</button>
				</a>
				<a href="<%=notWithFormTag%>trUpdate&tno=${requestScope.bean.tno}">
				<button type="submit" class="btn btn-info follower">
					<span>
						<span class=""> 수정하기 </span>
					</span>
				</button>
				</a>
			</c:if>
			<a href="<%=notWithFormTag%>trLikes&tno=${requestScope.bean.tno}&id=${sessionScope.loginfo.id}">
			<button type="submit" class="btn btn-warning follower">
				<span>
					<img class="thumbnail-content" src="<%=appName%>/assets/img/thumb.png" alt="recommand" style="width: 20px;">
					<span class=""> 추천하기 </span>
					<span class="">${requestScope.bean.tlikes}</span>
				</span>
			</button>
			</a>
		</div>
	</div>
<!-- 추천버튼 -->

<!-- 서브사진들 -->
	<div class="container-xxl py-5">
		<div class="container my-5 py-5 py-5 wow fadeInUp" data-wow-delay="0.6s">
			<div class="row align-items-center g-5">
				<div class="col-sm-3">
					<c:if test="${requestScope.bean.timage2 ne null}">
						<img class="sub-image" alt="" src="<%=appName%>/upload/${requestScope.bean.timage2}">
					</c:if>
				</div>
				<div class="col-sm-3">
					<c:if test="${requestScope.bean.timage3 ne null}">
						<img class="sub-image" alt="" src="<%=appName%>/upload/${requestScope.bean.timage3}">
					</c:if>
				</div>
				<div class="col-sm-3">
					<c:if test="${requestScope.bean.timage4 ne null}">
						<img class="sub-image" alt="" src="<%=appName%>/upload/${requestScope.bean.timage4}">
					</c:if>
				</div>
				<div class="col-sm-3">
					<c:if test="${requestScope.bean.timage5 ne null}">
						<img class="sub-image" alt="" src="<%=appName%>/upload/${requestScope.bean.timage5}">
					</c:if>
				</div>
			</div>
		</div>
	</div>
<!-- 서브사진들 -->	
	
<!-- 댓글창과 지도 -->	
	<div class="commentBox container-xxl py-5">
		<div class="container my-5 py-5">
			<div class="row align-items-center g-5">
				<div class="col-sm-8  wow fadeInUp" data-wow-delay="0.8s">
					<p class="text-left"><strong>댓글 (3)</strong></p>
	                <table class="table table-hover">
	                <thead>
                        <tr>
                            <th colspan="2" style="display: none;">작성자</th>
                            <th colspan="8" style="display: none;">내용</th>
                            <th colspan="2" style="display: none;">추천 및 삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="text-left">
                            <td colspan="2" class="comment">
	                            <strong>kim9</strong><br/>
	                            <span class="regdate">2023.09.23</span>
                            </td>
                            <td colspan="8" class="comment">정말 좋은곳이네요~!</td>
                            <td colspan="2" class="comment">
	                            <button type="submit" class="btn btn-outline-dark form-control-sm" onclick="">
									삭제
								</button>
                            </td>
                        </tr>
                        <tr class="text-left">
                           <td colspan="2" class="comment">
	                            <strong>kim9</strong><br/>
	                            <span class="regdate">2023.09.24</span>
                            </td>
                            <td colspan="8" class="comment">여기 사진 갬성 뒤지네여</td>
                            <td colspan="2" class="comment">
	                            <button type="submit" class="btn btn-outline-dark form-control-sm" onclick="">
									삭제
								</button>
                            </td>
                        </tr>
                        <tr class="text-left">
                           <td colspan="2" class="comment">
	                            <strong>kim9</strong><br/>
	                            <span class="regdate">2023.09.19</span>
                            </td>
                            <td colspan="8" class="comment">굿굿</td>
                            <td colspan="2" class="comment">
	                            <button type="submit" class="btn btn-outline-dark form-control-sm" onclick="">
									삭제
								</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- 댓글작성폼 -->	
                <div id="insertComment">
                <p class="text-left"><strong>댓글작성</strong></p>
		           <form id="comment_form" method="post" role="form" class="form-horizontal" >
				   <table class="table">
				       <thead>
				       </thead>
				       <tbody>
				         <tr>
				           <td class="text-left">
				              <label for="content" class="menubox-sub">작성자</label>              
				           </td>
				           <td>
				            <input type="hidden" name="tno" value="${bean.tno}" />
				            <input type="text" name="fakeid" id="fakeid" class="form-control" size="5" 
				               disabled="disabled" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님">                           
				            <input type="hidden" name="id" id="id" value="${sessionScope.loginfo.id}">
				            <input type="hidden" name="comment_Type" id="comment_Type" value="">
				           </td>
				         </tr>
				         <tr>
				           <td class="text-left">
				              <label for="content" class="menubox-sub">댓글내용</label>
				           </td>
				           <td class="text-left">
					           <div>
					           	<textarea name="content" rows="3" cols="50" id="content" ></textarea>
					           </div>
					           <div>
					           	<button type="button" id="submitComment" class="btn btn-warning">등록</button> 
					           </div>   
				           </td>
				         </tr>
				       </tbody>
				   </table>
				</form>
		      </div>
            </div>
				<div class="col-sm-4 wow fadeInUp" data-wow-delay="0.8s">
					<div class="col-md-6 maps">
						<p class="text-left"><strong>위치</strong></p>
						<div id="map" style="width: 200%; height: 500px;"></div>

						<!-- JavaScript 코드를 추가하여 지도를 초기화 -->
						<script>
							function initMap() {
								var mapOptions = {
									center : {
										lat : 33.3617,
										lng : 126.5292
									}, // 제주도의 위도와 경도를 설정
									zoom : 10, // 지도 확대 레벨 설정
									mapTypeId : google.maps.MapTypeId.ROADMAP
								// 지도 타입 설정
								};

								var map = new google.maps.Map(document
										.getElementById('map'), mapOptions);

								// 마커 추가 예제 (제주도 중심에 마커 추가)
								var marker = new google.maps.Marker({
									position : {
										lat : 33.3617,
										lng : 126.5292
									},
									map : map,
									title : '제주도'
								});
							}
						</script>
						<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCoHXS6bdXJxmAi4oxnKq8H_gcGbb9h5js&callback=initMap" async defer></script>
						
					</div>
				</div>
			</div>
<!-- 댓글창과 지도 -->	
	
</body>
</html>