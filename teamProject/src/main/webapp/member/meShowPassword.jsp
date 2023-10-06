<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@ include file="/common/bootstrap5.jsp" %>
<%@page import="com.jeju.model.bean.Member"%>
<%@page import="com.jeju.model.dao.MemberDao"%>

<%
    // 아이디를 request parameter로 받아오기
    String id = request.getParameter("id");
    
    // 아이디를 사용하여 회원의 비밀번호를 데이터베이스에서 가져옴
    MemberDao memberDao = new MemberDao();
    Member member = memberDao.getDataByPrimaryKey(id);
    String password = member.getPassword();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 확인</title>
</head>
<body>
    <div class="container">
        <h2>입력하신 아이디의 비밀번호는 다음과 같습니다.</h2>
        <table class="table">
            <thead></thead>
            <tbody>
                <tr>
                    <td align="center">입력하신 아이디</td>
                    <td><%= id %></td>
                </tr>
                <tr>
                    <td align="center">비밀번호</td>
                    <td><%= password %></td>
                </tr>
            </tbody>
        </table>
        <div id="backButton">
            <button type="button" class="btn btn-primary" onclick="history.back();">
                돌아가기
            </button>
        </div>
    </div>
</body>
</html>
