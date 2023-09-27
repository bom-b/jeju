<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  	<style type="text/css">
  		/* box model에 대한 공부가 필요합니다. */
  		.container{margin-top: 10px;}
  		.input-group{margin: 7px;}
  		.input-group-text{
  			display: block;
  			margin-left: auto;
  			margin-right: auto;
  		}
  		#buttonset{margin-top: 15px;}
  		.radio_gender, .checkbox_hobby{font-size: 1.1rem;} /* 주위 글꼴의 1.1배 */
  		
  		#productPnum{display: none;visibility: hidden;} /* 상품 번호는 안보이게 지정*/
  		
  	</style>
  	<script type="text/javascript">
  		$(document).ready(function(){ 
  	  		$('#inputdate').datepicker({dateFormat: "yy/mm/dd"});
  	  		
			/* $("#category").prepend('<option value="aaa">bbb</option>'); */			
			/* $('option').eq(2).attr('selected', true) ; */
  		});
  		
  		function validCheck(){

  			var timage1 = $('#timage1').val();
  			if(image01 == ''){
  				alert('이미지는 필수 사항입니다.');
  				return false ;
  			}
  			var timage2 = $('#image2').val();
  			if(image01 == ''){
  				alert('이미지는 필수 사항입니다.');
  				return false ;
  			}
  			var timage3 = $('#image3').val();
  			if(image01 == ''){
  				alert('이미지는 필수 사항입니다.');
  				return false ;
  			}
  			var timage4 = $('#image4').val();
  			if(image01 == ''){
  				alert('이미지는 필수 사항입니다.');
  				return false ;
  			}
  			var timage5 = $('#image5').val();
  			if(image01 == ''){
  				alert('이미지는 필수 사항입니다.');
  				return false ;
  			}
  			
  			var tprice = $('#tprice').val();  			
  			if(tprice == ''){
  				alert('단가는 필수 입력 사항입니다.');
  				return false ;
  			} 			  		

  			/* var category = $('#category').val();
  			if(category == '-'){ /* 코딩할 때 option의 value 속성을 하이폰으로 설정했습니다. 
  				alert('카테고리를 선택해 주세요.');
	  			$('#category').focus();
	  			return false ;
  			}  */ 	
  			
  			var regdate = $('#regdate').val();
  			
  			var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/ ;
  			var result = regex.test(regdate) ;
  			
  			if(result == false){
  				alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
  				$('#regdate').focus() ;
  				return false ;
  			} 
  		}
  	</script>  	
</head>
<body>
	<div class="container">
		<h2>관광지 등록</h2>
		<form action="<%=withFormTag%>" method="post" enctype="multipart/form-data">
			<input type="hidden" name="command" value="trInsert">
			<div id="tournum" class="input-group">
				<span class="input-group-text">관광지 글번호</span>
				<input class="form-control" type="text" id="tno" name="tno">				
			</div>
			<div class="input-group">
				<span class="input-group-text">작성자</span> 
				
				<c:set var="userInfo" value="${sessionScope.loginfo.name}(${sessionScope.loginfo.id})"/>
				
				<input id="fakeid" name="fakeid" disabled="disabled" 
					type="text" class="form-control" placeholder="" value="${userInfo}">
				
				<input id="id" name="id" type="hidden" value="${sessionScope.loginfo.id}">
				
			</div>
			<div class="input-group">
				<span class="input-group-text">관광지 이름</span>
				<input class="form-control" type="text" id="tname" name="tname">				
			</div>
			<div class="input-group">
				<span class="input-group-text">개장시간</span>
				<input class="form-control" type="text" id="ttime" name="ttime">				
			</div>
			<div class="input-group">
				<span class="input-group-text">연락처</span>
				<input class="form-control" type="number" id="tphoneno" name="tphoneno">				
			</div>
			<div class="input-group">
				<span class="input-group-text">입장료</span>
				<input class="form-control" type="text" id="tprice" name="tprice">				
			</div>
			<div class="input-group">
				<span class="input-group-text">위치(text)</span>
				<input class="form-control" type="text" id="tplace" name="tplace">				
			</div>
			<div class="input-group">
				<span class="input-group-text">위치(위성)</span>
				<input class="form-control" type="text" id="tmap" name="tmap">				
			</div>
			<div class="input-group">
				<span class="input-group-text">추천수</span>
				<input class="form-control" type="text" id="tlikes" name="tlikes">				
			</div>
			<div class="input-group">
				<span class="input-group-text">관광지이미지1</span>
				<input class="form-control" type="file" id="timage1" name="timage1">				
			</div>
			<div class="input-group">
				<span class="input-group-text">관광지이미지2</span>
				<input class="form-control" type="file" id="timage2" name="timage2">				
			</div>
			<div class="input-group">
				<span class="input-group-text">관광지이미지3</span>
				<input class="form-control" type="file" id="timage3" name="timage3">				
			</div>
			<div class="input-group">
				<span class="input-group-text">관광지이미지4</span>
				<input class="form-control" type="file" id="timage4" name="timage4">				
			</div>
			<div class="input-group">
				<span class="input-group-text">관광지이미지5</span>
				<input class="form-control" type="file" id="timage5" name="timage5">				
			</div>
			<div class="input-group">
				<span class="input-group-text">작성 일자</span>
				<input class="form-control" type="datetime" id="regdate" name="regdate">				
			</div>
			<span class="input-group-text sdms-font" style="font-size: 30px">관광지 카테고리</span>
                <div class="form-control">
                    <label class="radio-inline radio_gender sdms-font" style="font-size: 20px">
                        &nbsp;<input type="radio" id="tcategory1" name="tcategory" value="액티비티 체험">액티비티 체험
                    </label>
                    <label class="radio-inline radio_gender sdms-font" style="font-size: 20px">
                        &nbsp;<input type="radio" id="tcategory2" name="tcategory" value="오름 명소">오름 명소
                    </label>
                    <label class="radio-inline radio_gender sdms-font" style="font-size: 20px">
                        &nbsp;<input type="radio" id="tcategory3" name="tcategory" value="해수욕장">해수욕장
                    </label>
                    <label class="radio-inline radio_gender sdms-font" style="font-size: 20px">
                        &nbsp;<input type="radio" id="tcategory4" name="tcategory" value="테마파크">테마파크
                    </label>
                    
                </div>
			
			<%-- <div class="input-group">
				<span class="input-group-text">카테고리</span>
				<select id="category" name="category" class="form-select">
					<c:forEach var="category" items="${requestScope.categories}"> 
						<option value="${category.engname}">${category.korname}</option>
					</c:forEach>
				</select>				
			</div>
			 --%>
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary btn-lg"
					onclick="return validCheck();"> 
					등록
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-secondary btn-lg">초기화</button>
			</div>
		</form>
	</div>
</body>
</html>