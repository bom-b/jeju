<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../common/bootstrap5.jsp" %>
<%@ include file="./../common/common.jsp" %>
<%@ page import="com.jeju.model.dao.TourDao" %>
<%@ page import="com.jeju.model.bean.Tour"%>
<%
	int tno = 1;
	TourDao dao = new TourDao();
	Tour bean = dao.GetDataByPk(tno);
	
%>    
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
  	</style>
	<script type="text/javascript">
  		$(document).ready(function(){
  			/* value 속성의 값이 일치하는 항목에 대하여 체크 on 시킵니다. */
  			$('option[value="<%=bean.getTcategory()%>"]').attr('selected', true);
  		});
  	</script>  	
  	
  	
</head>
<body>
	<div class="container">
		<h2>관광지 글 수정</h2>
		<p>관리자가 이전에 등록한 관광지글을 수정하는 페이지입니다.</p>
		<form action="">
			<div class="input-group">
				<span class="input-group-text">관광지 글번호</span>
				<input disabled="disabled" class="form-control" type="number" id="fakepnum" name="fakepnum" value="<%=bean.getTno()%>">				
				<input type="number" id="tno" name="tno" value="<%=bean.getTno()%>">
			</div>
			<div class="input-group">
				<span class="input-group-text">관광지 이름</span>
				<input class="form-control" type="text" id="name" name="name" value="<%=bean.getTname()%>">				
			</div>
			<div class="input-group">
				<span class="input-group-text">개장 시간</span>
				<input class="form-control" type="text" id="ttime" name="ttime" value="<%=bean.getTtime()%>">				
			</div>
			<div class="input-group">
				<span class="input-group-text">연락처</span>
				<input class="form-control" type="number" id="tphoneno" name="tphoneno" value="<%=bean.getTphoneno()%>">				
			</div>
			<div class="input-group">
				<span class="input-group-text">입장료</span>
				<input class="form-control" type="file" id="tprice" name="tprice" value="<%=bean.getTprice()%>">				
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
				<input class="form-control" type="datetime" id="regdate" name="regdate" value="<%=bean.getRegdate()%>">				
			</div>
			<div class="input-group">
				<button type="submit" class="btn btn-primary">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-primary">초기화</button>				
			</div>
		</form>
	</div>
</body>
</html>