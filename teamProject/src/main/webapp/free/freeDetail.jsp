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
		
		function getListComment(){
			$('#comment_list').empty();			
			/* $.ajax() 함수를 이용하여 데이터 보여 주기 */
			$.ajax({
				url:'<%=notWithFormTag%>frMain', 
				data:'no=' + '${requestScope.bean.no}',
				type:'get', 
				dataType:'json',
				success:function(result, status){
					/* console.log('result는 넘어온 데이터 결과 값') ; */
					/* console.log(result) ; */
					
					$.each(result, function(idx){ /* idx는 색인 번호 */
						var cnum = result[idx].cnum ;
						var id = result[idx].id ;
						var content = result[idx].content ;
						var regdate = result[idx].regdate ;
						addNewItem(cnum, id, content, regdate);
					})
				},
				error:function(result, status){
					console.log(result) ;
					console.log(status) ;
				}
			});
		}
		
		function addNewItem(cnum, id, content, regdate){
			/* 댓글 1개를 추가해주는 함수입니다. */
			var litag = $('<li>') ; /* 댓글의 외곽 li 태그  */
			litag.addClass('commentItem') ;
			
			var ptag = $('<p>') ; /* 작성자 정보가 들어갈 태그  */
			ptag.addClass('id') ;

			var spantag = $('<span>') ; /* 작성자 이름이 들어갈 태그  */
			spantag.addClass('name') ;
			spantag.html(id + "님") ;
			
			var spandate = $('<span>') ;  /* 작성 일자가 들어갈 태그  */
			spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" + oregdate + '&nbsp;&nbsp;&nbsp;') ;
			
			
			var content_p = $('<p>') ; /* 작성한 댓글 내용 */
			content_p.html(content) ; 
			
			/* 조립하기(compose up) */
			ptag.append(spantag).append(spandate).append(inputtag);
			litag.append(ptag).append(content_p) ; 
			
			$('#comment_list').append(litag) ;
		}
	
		 
		
		$(document).ready(function(){
			getListComment();
			
			/* 사용자가 댓글을 입력하고, 전송 버튼을 눌렀습니다. */
			$('#comment_form').submit(function(){				
				/* 댓글 입력 없이 전송 버튼을 누른 경우 */
				if(!$('#content').val()){
					alert('댓글을 입력해 주셔야 합니다.');
					$('#content').focus() ;
					return false ;
				}
				
				/* post 방식으로 데이터를 전송합니다. */
				var URL = '<%=notWithFormTag%>
	frInsert';
			var parameters = $('#comment_form').serialize();
			/* alert(parameters); */
			$.post(URL, parameters, function(data) {
				getListComment(); /* 목록 갱신하기 */
				$('#content').val('');
				return true;

			}).fail(function() {
				alert('댓글 작성에 실패하였습니다.');
				return false;
			});
			return false;
		});
	});
		
	
</script>
</head>
<body>


	<div class="main container-xxl ">
		<div class="text-left container my-5 ">
			<!-- 작성자와 작성일자 -->
			<div class="writerBox wow fadeInUp" data-wow-delay="0.1s">
				<div class="contents">
					<span class="sub-title"><strong>작성자: </strong></span> <img class=""
						src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbcdHQb%2FbtsuG4zaJd7%2F9MkJVs5zrmwJYsBcTMSJJ0%2Fimg.png"
						height="25px;" width="25px;"> <span class="">${requestScope.bean.id}</span>
				</div>
				<div class="">
					<span class="sub-title"><strong>작성일자: </strong></span> <span
						class="">${requestScope.bean.oregdate}</span>
				</div>
			</div>
			<!-- 작성자와 장성일자 -->

		</div>
		<div class="mainBox container my-5  wow fadeInUp"
			data-wow-delay="0.3s">

			<div class="content col-sm-7">
				<div class="title">
					<span class="title " style="margin-left: 5px; display: block;"> ${requestScope.bean.oname}</span>
				</div>
				<div class="contents">
					<span class="sub-title"><strong>카테고리: </strong></span> <span
						class="">${requestScope.bean.pcategory}</span> <span
						class="sub-title"><strong>조회수: </strong></span> <span class="">${requestScope.bean.readhit}</span>

					<span class="sub-title"><strong>작성날짜: </strong></span> <span
						class="">${requestScope.bean.oregdate}</span>
				</div>

				<div class="contents">
					<div class="display-content" style="height: auto; width: auto;">${requestScope.bean.ocontent}</div>
				</div>


				<!-- openForum 이미지 시작 -->
				<div id="backButton" style="text-align: left;">
					<!-- 이미지 1 -->
					<a  data-wow-delay="0.3s" href="<%=appName%>/upload/${requestScope.bean.oimage1}"
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
		</div>
		
	</div>
	<div class="thumb container-xxl wow fadeInUp"
		data-wow-delay="0.5s">
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
			</a>
	</div>







	<%-- 댓글 영역(Comment Zone) --%>
	<!--  <ul id="comment_list">
		<%-- 여기에 동적으로 댓글들을 추가합니다. --%>
	</ul>-->

	<!-- 댓글작성폼 -->
	<div id="insertComment">
		<p class="text-left">
			<strong>댓글작성</strong>
		</p>
		<form id="comment_form" method="post" role="form"
			class="form-horizontal">
			<table class="table">
				<thead>
				</thead>
				<tbody>
					<tr>
						<td class="text-left"><label for="content"
							class="menubox-sub">작성자</label></td>
						<td><input type="hidden" name="ono" value="${bean.ono}" /> <input
							type="text" name="fakeid" id="fakeid" class="form-control"
							size="5" disabled="disabled"
							value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})님">
							<input type="hidden" name="id" id="id"
							value="${sessionScope.loginfo.id}"> <input type="hidden"
							name="comment_Type" id="comment_Type" value=""></td>
					</tr>
					<tr>
						<td class="text-left"><label for="content"
							class="menubox-sub">댓글내용</label></td>
						<td class="text-left">
							<div>
								<textarea name="content" rows="3" cols="50" id="content"></textarea>
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
	</div>
	<!-- SimpleLightbox JavaScript 파일 추가 -->
	<script src="path/to/simple-lightbox.min.js"></script>
</body>
</html>