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

	$(document).ready(function(){
		
		getListComment();
		
		/* 사용자가 댓글을 입력하고, 전송 버튼을 눌렀습니다. */
		$('#comment_form').submit(function(){
			
			// 댓글 입력 없이 전송 버튼을 누른 경우
			if(!$('#comment_content').val()){
				Swal.fire('댓글 내용을 입력해주세요.');
				$('#comment_content').focus() ;
				return false ;
			}
			
			// post 방식으로 데이터를 전송합니다.
			var URL = '<%=notWithFormTag%>fdcmInsert' ;
			var parameters = $('#comment_form').serialize() ;

			$.post(URL, parameters, function(data){
				getListComment(); // 목록 갱신하기
				$('#comment_content').val('');		
				return true ;
				
			}).fail(function(){
				Swal.fire('댓글 작성에 실패하였습니다.');
				return false ;
			});
			return false ;
		});
		
	});

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
	
	  if (deleteLink) { // 요소가 존재하는지 확인
	    deleteLink.addEventListener("click", function(event) {
	      event.preventDefault();
	
	      Swal.fire({
	        title: "게시글을 삭제하시겠습니까?",
	        icon: "warning",
	        showCancelButton: true,
	        confirmButtonText: "확인",
	        cancelButtonText: "취소"
	      }).then((result) => {
	        if (result.isConfirmed) {
	          window.location.href = deleteLink.href;
	        }
	      });
	    });
	  }
	});
	
	/* 여기부터는 댓글 관련 코드 */
	
	var commentNum = 0; // 댓글 개수
	
	//댓글리스트 가져오기
	function getListComment(){
	    /* 댓글창 비우기 */
	    $('#comment_list').empty();
	    /* $.ajax() 함수를 이용하여 데이터 보여 주기 */
	    $.ajax({
	        url:'<%=notWithFormTag%>fdcmList', 
	        data:'boardno=' + '${requestScope.bean.no}',
	        type:'get', 
	        dataType:'json',
	        success:function(result, status){
	            console.log(result);
	            
	            // result의 길이를 commentNum에 할당
	            commentNum = result.length;
	            
	            // 댓글 개수를 업데이트
	            updateCommentCount();
	            
	            if (commentNum > 0) { // 댓글이 있을 경우
	                $.each(result, function(idx){ /* idx는 색인 번호 */
	                    var cno = result[idx].cno ;
	                    var id = result[idx].id ;
	                    var content = result[idx].content ;
	                    var regdate = result[idx].regdate ;
	                    addNewItem(cno, id, content, regdate);
	                });
	            } else { // 댓글이 없을 경우
	                addEmptyComment();
	            }
	        },
	        error:function(result, status){
	            console.log(result);
	            console.log(status);
	        }
	    });
	}
	
	// 댓글 개수 업데이트 함수
	function updateCommentCount() {
	    // commentNum의 값을 <p> 요소에 할당
	    $('.comment-count').text('댓글 (' + commentNum + ')');
	}
	
	// 댓글을 한개씩 동적으로 추가하기
	function addNewItem(cno, id, content, regdate){
		// 댓글을 위한 새로운 테이블 행 (<tr>) 요소 생성
	    var tr = document.createElement('tr');
	    tr.className = 'text-left';

	    // 작성자 정보를 위한 첫 번째 셀 (<td>) 생성
	    var td1 = document.createElement('td');
	    td1.colSpan = 2;
	    td1.className = 'comment';

	    // ID를 표시할 강조 (<strong>) 요소 생성
	    var strong = document.createElement('strong');
	    strong.textContent = id;
	    td1.appendChild(strong);
	    td1.appendChild(document.createElement('br'));

	    // 작성일자를 표시할 스팬 (<span>) 요소 생성
	    var spanRegdate = document.createElement('span');
	    spanRegdate.className = 'regdate';
	    spanRegdate.textContent = regdate;
	    td1.appendChild(spanRegdate);

	    // 댓글 내용을 위한 두 번째 셀 (<td>) 생성
	    var td2 = document.createElement('td');
	    td2.colSpan = 8;
	    td2.className = 'comment';
	    td2.textContent = content;
	    
		// 삭제 버튼을 위한 세 번째 셀 (<td>) 생성
	    var td3 = document.createElement('td');
	    td3.colSpan = 2;
	    td3.className = 'comment text-right delete-button';

	    if ('${sessionScope.loginfo.id}' === id) { // 로그인 정보와 댓글 작성자가 같을 경우
	    	// 삭제 버튼 생성
		    var deleteButton = document.createElement('button');
		    deleteButton.id = 'delete-comment';
		    deleteButton.type = 'button';
		    deleteButton.className = 'btn btn-outline-dark form-control-sm';
		    deleteButton.textContent = '삭제';
		    
			 // 댓글 번호를 data-cno 속성으로 버튼에 할당
		    deleteButton.setAttribute('cno', cno);
		    
		 	// 삭제 버튼을 세 번째 셀에 추가
		    td3.appendChild(deleteButton);
	    } else { // 로그인 정보와 댓글 작성자가 같지 않을 경우
	    	td3.textContent = '';
	    }
	    
	    // 세 개의 셀을 테이블 행에 추가
	    tr.appendChild(td1);
	    tr.appendChild(td2);
	    tr.appendChild(td3);

	    // 댓글 목록에 테이블 행을 추가
	    var commentList = document.getElementById('comment_list');
	    commentList.appendChild(tr);
	}
	
	// 댓글이 없을 경우 없다는 문구 보여주기
	function addEmptyComment() {
		// 새로운 테이블 행 (<tr>) 요소 생성
	    var tr = document.createElement('tr');
	    tr.className = 'text-left';

	    // 댓글 없음 메시지를 위한 셀 (<td>) 생성
	    var td = document.createElement('td');
	    td.colSpan = 12;
	    td.className = 'comment';
	    td.textContent = '아직 댓글이 존재하지 않습니다.';

	    // 셀을 테이블 행에 추가
	    tr.appendChild(td);
		
		// 댓글 목록에 테이블 행을 추가
	    var commentList = document.getElementById('comment_list');
	    commentList.appendChild(tr);
	}
	
	/* 댓글 삭제 버튼 클릭 */
	$(document).on('click', '#delete-comment', function(){
	    Swal.fire({
	    	title: "댓글을 삭제하시겠습니까?",
	        icon: "warning",
	        showCancelButton: true,
	        confirmButtonText: "확인",
	        cancelButtonText: "취소"
	    }).then((result) => {
	        if (result.isConfirmed) {
	            // 확인 버튼을 눌렀을 때의 동작
	            $.ajax({
	                url: '<%=notWithFormTag%>fdcmDelete',
	                data: 'cno=' + $(this).attr('cno'),
	                type: 'get',
	                dataType: 'text',
	                success: function(result, status) {
	                    console.log(result);
	                    console.log(status);
	                    getListComment(); // 목록 갱신하기
	                }
	            });
	        }
	    });
	});
	
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
					<span class="sub-title" style="font-weight: bold;">작성자: </span>
					<img class="" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbcdHQb%2FbtsuG4zaJd7%2F9MkJVs5zrmwJYsBcTMSJJ0%2Fimg.png" height="25px;" width="25px;">
					<span class="">${requestScope.bean.id}</span>
				</div>
				<div class="">
					<span class="sub-title" style="font-weight: bold;">작성일자: </span>
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
					<span class="sub-title" style="font-weight: bold;">주소: </span> 
					<span class="">${requestScope.bean.place}</span>
				</div>
				<div class="contents">
					<span class="sub-title" style="font-weight: bold;">영업시간: </span> 
					<span class="">${requestScope.bean.time}</span>
				</div>
				<div class="contents">
					<span class="sub-title" style="font-weight: bold;">브레이크타임: </span> 
					<span class="">${requestScope.bean.breaktime}</span>
				</div>
				<div class="contents">
					<span class="sub-title" style="font-weight: bold;">연락처: </span> 
					<span class="">${requestScope.bean.phoneno}</span>
				</div>
				<div class="menubox wow fadeInUp" data-wow-delay="0.1s">
					<div class="menubox-sub col-sm-3">
						<span class="menubox-sub sub-title" style="font-weight: bold;">대표 메뉴: </span> 
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
					<p class="text-left comment-count" style="font-weight: bold;"></p>
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
						<p class="text-left" style="font-weight: bold;">댓글작성</p>
						<form id="comment_form" method="post" role="form" class="form-horizontal">
							<input type="hidden" name="no" id="no" value="${requestScope.bean.no}" > 
							<input type="hidden" name="id" id="id" value="${sessionScope.loginfo.id}" >
							<table class="table">
								<thead>
								</thead>
								<tbody>
									<tr>
										<td class="text-left">
											<label for="content" class="menubox-sub">작성자</label>
										</td>
										<td>
											<input type="text" name="fakeid" id="fakeid" class="form-control" size="5" disabled="disabled" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님">
										</td>
									</tr>
									<tr>
										<td class="text-left">
											<label for="content" class="menubox-sub">댓글내용</label>
										</td>
										<td class="text-left">
											<div>
												<c:if test="${whologin ne 0}">
													<textarea name="content" rows="3" cols="50" id="comment_content"></textarea>
												</c:if>
												<c:if test="${whologin eq 0}">
													<textarea name="content" rows="3" cols="50" id="comment_content" disabled="disabled">댓글을 작성하시려면 로그인이 필요합니다.</textarea>
												</c:if>
											</div>
											<div>
												<c:if test="${whologin ne 0}">
													<button type="submit" id="submit" class="btn btn-warning">등록</button>
												</c:if>
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
					<p class="text-left" style="font-weight: bold;">위치</p>
					<div class="col-md-6 maps" >
			       		 <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d11880.492291371422!2d12.4922309!3d41.8902102!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x28f1c82e908503c4!2sColosseo!5e0!3m2!1sit!2sit!4v1524815927977" frameborder="0" style="border:0" allowfullscreen></iframe>
			      	</div>
				</div>
			</div>
		</div>
	</div>
<!-- 댓글창과 지도 -->	

<%-- 사진 크게보기 --%>
	<script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.umd.js"></script>
	<script>
	      Fancybox.bind('[data-fancybox="gallery"]', {
	      });    
	</script>
<%-- 사진 크게보기 --%>

<%-- 페이지 로드 시 자동으로 함수 호출 --%>
<!-- 	<script type="text/javascript">
	    document.addEventListener("DOMContentLoaded", function() {
	        getListComment(); 
	        
	    });
	    
	</script> -->
<%-- 페이지 로드 시 자동으로 함수 호출 --%>
</body>
</html>