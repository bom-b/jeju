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
		.container{margin: 10px;}
		#backButton{margin: auto;}
	</style>
</head>
<body>
	<div class="container">
		<h2>${requestScope.bean.name}님의 회원 정보</h2>
		<table class="table">
			<thead></thead>
			<tbody>
				<tr>
					<td align="center">아이디</td>
					<td>${requestScope.bean.id}</td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td>${requestScope.bean.name}</td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td>${requestScope.bean.password}</td>
				</tr>
				<tr>
					<td align="center">성별</td>
					<c:if test="${requestScope.bean.gender eq 'male'}">
						<td>남자</td>
					</c:if>	
					<c:if test="${requestScope.bean.gender eq 'female'}">
						<td>여자</td>
					</c:if>
				</tr>
				<tr>
					<td align="center">비밀번호 찾기 질문</td>
					<td>${requestScope.bean.mquestion}</td>
				</tr>
				<tr>
					<td align="center">비밀번호 찾기 질문 답</td>
					<td>${requestScope.bean.manswer}</td>
				</tr>
				<tr>
					<td align="center">핸드폰 번호</td>
					<td>${requestScope.bean.mphoneno}</td>
				</tr>
				<tr>
					<td align="center">회원등급</td>
					<td>${requestScope.bean.mrating}</td>
					<td>${requestScope.bean.ratingimg}</td>
				</tr>
				<tr>
					<td align="center">생일</td>
					<td>${requestScope.bean.birth}</td>
				</tr>							
			</tbody>
		</table>
		<div id="backButton">
			<button type="button" class="btn btn-primary" onclick="history.back();">
				돌아 가기 
			</button>
		</div>
	</div>
</body>
</html>