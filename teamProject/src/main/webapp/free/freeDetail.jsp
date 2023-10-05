<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/bootstrap5.jsp"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 게시판 메인 전용 부트스트랩 -->
<link rel="stylesheet"
	href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">

<!-- SimpleLightbox CSS 파일 추가 -->
<link rel="stylesheet" href="path/to/simple-lightbox.min.css">

<!-- 맛집 전용 style.css -->
<link href="<%=appName%>/assets/css_food/foodDetail_Insert.css"
	rel="stylesheet">

<style type="text/css">
.container {
	margin: 10px;
}

#backButton {
	margin: auto;
}

.emoticon {
	text-decoration: none;
}
</style>


<script type="text/javascript">
		/* 삭제버튼 클릭 */
		/* on() 메소드는 선택된 요소에 이벤트 핸들러 함수를 연결시켜 주는 기능을 합니다. */
		/* cnum이라는 속성을 개발자가 지정해 두었습니다. */
		$(document).on('click', '.delete_btn', function(){
			if(confirm('선택하신 항목을 삭제하시겠습니까?')){
				$.ajax({
					url:'<%=notWithFormTag%>frdelete', 
					data:'cnum=' + $(this).attr('cnum') ,
					type:'get', 
					dataType:'text',
					success:function(result, status){
						console.log(result);	
						console.log(status);
						getListComment() ; 
					}
				});
			}
		});
		$(document).ready(function(){
			getListComment();
			
			/* 사용자가 댓글을 입력하고, 전송 버튼을 눌렀습니다. */
			$('#comment_form').submit(function(){				
				/* 댓글 입력 없이 전송 버튼을 누른 경우 */
				if(!$('#comment_content').val()){
					alert('댓글 내용을 입력해주세요.');
					$('#comment_content').focus() ;
					return false ;
				}
				
				/* post 방식으로 데이터를 전송합니다. */
				var URL = '<%=notWithFormTag%>frcmInsert';
			var parameters = $('#comment_form').serialize();
			/* alert(parameters); */
			$.post(URL, parameters, function(data) {
				getListComment(); /* 목록 갱신하기 */
				$('#comment_content').val('');
				return true;

			}).fail(function() {
				alert('댓글 작성에 실패하였습니다.');
				return false;
			});
			return false;
		});
	}
		var commentNum = 0; // 댓글 개수
		
		//댓글리스트 가져오기
		function getListComment(){
		    /* 댓글창 비우기 */
		    $('#comment_list').empty();
		    /* $.ajax() 함수를 이용하여 데이터 보여 주기 */
		    $.ajax({
		        url:'<%=notWithFormTag%>frcmList', 
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
		                url: '<%=notWithFormTag%>frcmDelete',
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
</head>
<body>
	<!-- 헤더 Start -->
	<div class="container-xxl py-5 bg-dark  mb-5" data-wow-delay="0.3s"
		style="background-image:url('<%=appName%>/assets/img/freeboardMain.jpg');  ">
		<div class="container my-5  wow fadeInUp">
			<div class="row align-items-center g-5">
				<div class="col-lg-6 text-center text-lg-start">
					<h1 class="display-3 text-white" style="margin-bottom: 20px;">
						자유게시판</h1>
					<h5 style="color: white; text-align: center;">제주도의 관한 궁금한점!
						하고싶은 이야기! 모두해보세요!</h5>
					<p class="medium-paragraph"></p>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 End -->

	<div class="main container-xxl ">
		<div class="text-left container my-5 "></div>
		<div class="mainBox container my-5  wow fadeInUp"
			data-wow-delay="0.3s">
			<div class="content col-sm-7">
				<div class="title">
					<span class="title " style="margin-left: 5px; display: block;">
						${requestScope.bean.oname}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>작성자: </strong></span> <img class=""
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbcdHQb%2FbtsuG4zaJd7%2F9MkJVs5zrmwJYsBcTMSJJ0%2Fimg.png"
						height="25px;" width="25px;"> <span class="">${requestScope.bean.id}</span>

				</div>
				<div class="contents">
					<span class="sub-title"><strong>카테고리: </strong></span> <span
						class="">${requestScope.bean.pcategory}</span> <span
						class="sub-title"><strong>&nbsp;&nbsp;조회수: </strong></span> <span
						class="">${requestScope.bean.readhit}</span> &nbsp;&nbsp; <span
						class="sub-title"><strong>작성날짜: </strong></span> <span class="">${requestScope.bean.oregdate}</span>
				</div>

				<div class="contents">
					<div class="display-content" style="height: 300px; width: auto;">${requestScope.bean.ocontent}</div>
				</div>


				<!-- openForum 이미지 시작 -->
				<div id="backButton" style="text-align: left;">
					<!-- 이미지 1 -->
					<a data-wow-delay="0.3s"
						href="<%=appName%>/upload/${requestScope.bean.oimage1}"
						data-lightbox="my-gallery"> <img
						src="<%=appName%>/upload/${requestScope.bean.oimage1}"
						width="100px" height="100px" alt="이미지 1">
					</a>

					<!-- 이미지 2 -->
					<a href="<%=appName%>/upload/${requestScope.bean.oimage2}"
						data-lightbox="my-gallery"> <img
						src="<%=appName%>/upload/${requestScope.bean.oimage2}"
						width="100px" height="100px" alt="이미지 2">
					</a>

					<!-- 이미지 3 -->
					<a href="<%=appName%>/upload/${requestScope.bean.oimage3}"
						data-lightbox="my-gallery"> <img
						src="<%=appName%>/upload/${requestScope.bean.oimage3}"
						width="100px" height="100px" alt="이미지 3">
					</a>

					<!-- 이미지 4 -->
					<a href="<%=appName%>/upload/${requestScope.bean.oimage4}"
						data-lightbox="my-gallery"> <img
						src="<%=appName%>/upload/${requestScope.bean.oimage4}"
						width="100px" height="100px" alt="이미지 4">
					</a>

					<!-- 이미지 5 -->
					<a href="<%=appName%>/upload/${requestScope.bean.oimage5}"
						data-lightbox="my-gallery"> <img
						src="<%=appName%>/upload/${requestScope.bean.oimage5}"
						width="100px" height="100px" alt="이미지 5">
					</a>
				</div>
			</div>

		</div>
		<div class="thumb container-xxl wow fadeInUp" data-wow-delay="0.5s">
			<div class="container   text-right">
				<a style="text-decoration: none;"
					href="<%=notWithFormTag%>frEmoticon&ono=${requestScope.bean.ono}&id=${sessionScope.loginfo.id}&writer=${requestScope.bean.id}">
					<button type="submit" class="btn btn-warning follower">
						<span> <img class="thumbnail-content"
							src="<%=appName%>/assets/img/thumb.png" alt="recommand"
							style="width: 20px;"> <span class=""> 추천하기 </span> <span
							class="">${requestScope.bean.olikes}</span>
						</span>
					</button>
					<div class="text-end">
						<!-- 수정 버튼 표시 조건문 -->
						<c:if test="${sessionScope.loginfo.id==bean.id}">
							<a
								href="<%=notWithFormTag%>frUpdate&ono=${bean.ono}${requestScope.pageInfo.flowParameter}"
								class="btn btn-primary btn-sm">수정</a>
							<!-- 삭제 버튼 -->
							<a
								href="<%=notWithFormTag%>frDelete&ono=${bean.ono}${requestScope.pageInfo.flowParameter}"
								class="btn btn-danger btn-sm">삭제</a>
						</c:if>

					</div>
				</a>
			</div>
		</div>
	</div>







	<%-- 댓글 영역(Comment Zone) --%>
	<div class=" container-xxl py-5">
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
						<form id="comment_form" method="post" role="form"
							class="form-horizontal">
							<input type="hidden" name="ono" id="ono"
								value="${requestScope.bean.ono}"> <input type="hidden"
								name="id" id="id" value="${sessionScope.loginfo.id}">
							<table class="table">
								<thead>
								</thead>
								<tbody>
									<tr>
										<td class="text-left"><label for="content"
											class="menubox-sub">작성자</label></td>
										<td><input type="text" name="fakeid" id="fakeid"
											class="form-control" size="5" disabled="disabled"
											value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님">
										</td>
									</tr>
									<tr>
										<td class="text-left"><label for="content"
											class="menubox-sub">댓글내용</label></td>
										<td class="text-left">
											<div>
												<c:if test="${whologin ne 0}">
													<textarea name="content" rows="3" cols="50"
														id="comment_content"></textarea>
												</c:if>
												<c:if test="${whologin eq 0}">
													<textarea name="content" rows="3" cols="50"
														id="comment_content" disabled="disabled">댓글을 작성하시려면 로그인이 필요합니다.</textarea>
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

			</div>
		</div>
	</div>
	<!-- SimpleLightbox JavaScript 파일 추가 -->
	<script src="path/to/simple-lightbox.min.js"></script>
</body>
</html>