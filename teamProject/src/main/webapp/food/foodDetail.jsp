<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- 맛집 전용 style.css --%>
<link href="<%=appName%>/assets/css_food/foodDetail_Insert.css" rel="stylesheet">

<%-- 사진 크게보기 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.css" />

<%-- sweetalert 버전 2 --%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript">

	//댓글리스트 가져오기
	function getListComment(){
		$('#comment_list').empty();			
		/* $.ajax() 함수를 이용하여 데이터 보여 주기 */
		$.ajax({
			url:'<%=notWithFormTag%>fdcmList', 
			data:'boardno=' + '${requestScope.bean.no}',
			type:'get', 
			dataType:'json',
			success:function(result, status){
				console.log(result) ;
				
				$.each(result, function(idx){ /* idx는 색인 번호 */
					var cno = result[idx].cno ;
					var id = result[idx].id ;
					var content = result[idx].content ;
					var regdate = result[idx].regdate ;
					addNewItem(cno, id, content, regdate);
				})
			},
			error:function(result, status){
				console.log(result) ;
				console.log(status) ;
			}
		});
	}

	//메뉴 데이터 한줄씩 출력하기
	function splitString(inputString) {
	    var menuArray = inputString.split("/"); // "/"를 기준으로 문자열을 분할하여 배열로 반환
	    var resultElement = document.getElementById("result");
	    
	    // 분할된 메뉴 항목들을 출력
	    for (var i = 0; i < menuArray.length; i++) {
	    	var menuItem = document.createElement("span");
	    	menuItem.textContent = menuArray[i];
	    	resultElement.appendChild(menuItem);
	    	
	    	// 줄바꿈을 추가
	        var lineBreak = document.createElement("br"); // <br> 요소 생성
	        resultElement.appendChild(lineBreak); // 결과 요소에 추가
	    }
	}

	//삭제 경고
	document.addEventListener("DOMContentLoaded", function() {
	  var deleteLink = document.getElementById("deleteLink");
	  
	  deleteLink.addEventListener("click", function(event) {
	    // 이벤트의 기본 동작 (링크 이동)을 막습니다.
	    event.preventDefault();

	    Swal.fire({
	      title: "게시글을 삭제 하시겠습니까?",
	      icon: "warning",
	      showCancelButton: true,
	      confirmButtonText: "확인",
	      cancelButtonText: "취소"
	    }).then((result) => {
	      // 확인 버튼을 누를 경우 링크로 이동합니다.
	      if (result.isConfirmed) {
	        window.location.href = deleteLink.href;
	      }
	    });
	  });
	});
	
	
	
	// 댓글을 동적으로 추가하기
	function addNewItem(cno, id, content, regdate){
		var litag = $('<li>') ; /* 댓글의 외곽 li 태그  */
		litag.addClass('commentItem') ;
		
		var ptag = $('<p>') ; /* 작성자 정보가 들어갈 태그  */
		ptag.addClass('id') ;

		var spantag = $('<span>') ; /* 작성자 이름이 들어갈 태그  */
		spantag.addClass('name') ;
		spantag.html(id + "님") ;
		
		var spandate = $('<span>') ;  /* 작성 일자가 들어갈 태그  */
		spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" + regdate + '&nbsp;&nbsp;&nbsp;') ;
		
		/* 로그인한 사람이 작성한 댓글이면 삭제 가능 */
		if(id == '${sessionScope.loginfo.id}'){ 
			var inputtag = $('<input>') ; /* 삭제 버튼 */
			var attrlist = {'id':id, 'type':'button', 'value':'삭제', 'class':'btn btn-xs btn-outline-primary', 'cno':cno};
			inputtag.attr(attrlist);
			inputtag.addClass('delete_btn');
		}else{
			var inputtag = '' ;
		}
		
		var content_p = $('<p>') ; /* 작성한 댓글 내용 */
		content_p.html(content) ; 
		
		/* 조립하기(compose up) */
		ptag.append(spantag).append(spandate).append(inputtag);
		litag.append(ptag).append(content_p) ; 
		
		$('#comment_list').append(litag) ;
	}
	
</script>

<style type="text/css">
	
</style>

</head>
<body>
	
<!-- 메인사진과 메인설명 -->
	<div class="main container-xxl py-5">
		<div class="text-left container my-5 py-5">
		
			<!-- 작성자와 장성일자 -->
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
			<!-- 작성자와 장성일자 -->
			
		</div>
		<div class="mainBox container my-5 py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="col-sm-5">
				<a href="<%=appName%>/upload/${requestScope.bean.image1}" data-fancybox="gallery"  data-caption="${requestScope.bean.title}">
					<img class="main-image" src="<%=appName%>/upload/${requestScope.bean.image1}" alt="main-image">
				</a>
			</div>
			<div class="content col-sm-7">
				<div class="title">
					<span class="title text-primary">${requestScope.bean.title}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>주소: </strong></span> 
					<span class="">${requestScope.bean.place}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>영업시간: </strong></span> 
					<span class="">${requestScope.bean.time}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>브레이크타임: </strong></span> 
					<span class="">${requestScope.bean.breaktime}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>연락처: </strong></span> 
					<span class="">${requestScope.bean.phoneno}</span>
				</div>
				<div class="menubox wow fadeInUp" data-wow-delay="0.1s">
					<div class="menubox-sub col-sm-3">
						<span class="menubox-sub sub-title"><strong>대표 메뉴: </strong></span> 
					</div>
					<div id="result" class="col-sm-9 text-left " style="padding-left: 30px;">
						<script type="text/javascript">
							splitString("${requestScope.bean.menu}");
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 메인사진과 메인설명 -->	

<!-- 삭제, 추천버튼 -->
	<div class="thumb container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
		<div class="container my-5 py-5 text-right">
			<c:if test="${sessionScope.loginfo.id eq requestScope.bean.id}">
				<a href="<%=notWithFormTag%>fdDelete&no=${requestScope.bean.no}" id="deleteLink">
				<button type="submit" class="btn btn-danger follower">
					<span>
						<span class=""> 삭제하기 </span>
					</span>
				</button>
				</a>
				<a href="<%=notWithFormTag%>fdUpdate&no=${requestScope.bean.no}">
				<button type="submit" class="btn btn-info follower">
					<span>
						<span class=""> 수정하기 </span>
					</span>
				</button>
				</a>
			</c:if>
			<a href="<%=notWithFormTag%>fdLikes&no=${requestScope.bean.no}&id=${sessionScope.loginfo.id}&writer=${requestScope.bean.id}">
			<button type="submit" class="btn btn-warning follower">
				<span>
					<img class="thumbnail-content" src="<%=appName%>/assets/img/thumb.png" alt="recommand" style="width: 20px;">
					<span class=""> 추천하기 </span>
					<span class="">${requestScope.bean.likes}</span>
				</span>
			</button>
			</a>
		</div>
	</div>
<!-- 삭제, 추천버튼 -->

<!-- 서브사진들 -->
	<div class="container-xxl py-5">
		<div class="container my-5 py-5 py-5 wow fadeInUp" data-wow-delay="0.2s">
			<div class="row align-items-center g-5">
				<div class="col-sm-3">
					<c:if test="${requestScope.bean.image2 ne null}">
						<a href="<%=appName%>/upload/${requestScope.bean.image2}" data-fancybox="gallery" data-caption="${requestScope.bean.title}">
							<img class="sub-image" alt="" src="<%=appName%>/upload/${requestScope.bean.image2}" alt="sub-image">
						</a>
					</c:if>
				</div>
				<div class="col-sm-3">
					<c:if test="${requestScope.bean.image3 ne null}">
						<a href="<%=appName%>/upload/${requestScope.bean.image3}" data-fancybox="gallery" data-caption="${requestScope.bean.title}">
							<img class="sub-image" alt="" src="<%=appName%>/upload/${requestScope.bean.image3}" alt="sub-image">
						</a>
					</c:if>
				</div>
				<div class="col-sm-3">
					<c:if test="${requestScope.bean.image4 ne null}">
						<a href="<%=appName%>/upload/${requestScope.bean.image4}" data-fancybox="gallery" data-caption="${requestScope.bean.title}">
							<img class="sub-image" alt="" src="<%=appName%>/upload/${requestScope.bean.image4}" alt="sub-image">
						</a>
					</c:if>
				</div>
				<div class="col-sm-3">
					<c:if test="${requestScope.bean.image5 ne null}">
						<a href="<%=appName%>/upload/${requestScope.bean.image5}" data-fancybox="gallery" data-caption="${requestScope.bean.title}">
							<img class="sub-image" alt="" src="<%=appName%>/upload/${requestScope.bean.image5}" alt="sub-image">
						</a>
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
				<div class="col-sm-8  wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-left"><strong>댓글 (3)</strong></p>
	                <table class="table table-hover">
	                <thead>
                        <tr>
                            <th colspan="2" style="display: none;">작성자</th>
                            <th colspan="8" style="display: none;">내용</th>
                            <th colspan="2" style="display: none;">추천 및 삭제</th>
                        </tr>
                    </thead>
                    <tbody id="comment_list">
						<%-- 여기에 동적으로 요소들을 추가합니다. --%>
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
				            <input type="hidden" name="no" value="${bean.no}" />
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
            <!-- 댓글작성폼 -->	       	
				
				<div class="col-sm-4 wow fadeInUp" data-wow-delay="0.3s">
					<p class="text-left"><strong>위치</strong></p>
					<div class="col-md-6 maps" >
			       		 <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d11880.492291371422!2d12.4922309!3d41.8902102!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x28f1c82e908503c4!2sColosseo!5e0!3m2!1sit!2sit!4v1524815927977" frameborder="0" style="border:0" allowfullscreen></iframe>
			      	</div>
				</div>
			</div>
		</div>
	</div>
<!-- 댓글창과 지도 -->	

<!-- 사진 크게보기 -->
	<script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.umd.js"></script>
	<script>
	      Fancybox.bind('[data-fancybox="gallery"]', {
	      });    
	</script>
<!-- 사진 크게보기 -->
	
</body>
</html>