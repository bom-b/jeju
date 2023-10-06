<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@ include file="/common/bootstrap5.jsp" %>
<%@page import="com.jeju.model.bean.Member"%>
<%@page import="com.jeju.model.dao.MemberDao"%>

<%
    // 아이디를 request parameter로 받아오기
    String id = request.getParameter("id");
    
    // 아이디를 사용하여 회원의 질문을 데이터베이스에서 가져옴
    MemberDao memberDao = new MemberDao();
    Member member = memberDao.getDataByPrimaryKey(id);
    String mquestion = member.getMquestion();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
</head>
<body>
    <div class="container">
        <h2>비밀번호를 찾기 위해 질문에 답을 해주세요.</h2>
        <form action="<%=notWithFormTag%>mePasswordRecovery2" method="post">
            <table class="table">
                <thead></thead>
                <tbody>
                    <tr>
                        <td align="center">입력하신 아이디</td>
                        <td><input type="text" name="id" value="<%= id %>" readonly></td>
                    </tr>
                    <tr>
                        <td align="center">비밀번호 찾기 질문</td>
                        <td><input type="text" name="mquestion" value="<%= mquestion %>" readonly></td>
                    </tr>
                    <tr>
                        <td align="center">비밀번호 찾기 질문 답</td>
                        <td><input type="text" name="manswer" required></td>
                    </tr>
                </tbody>
            </table>
            <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
        </form>
        <div id="backButton">
            <button type="button" class="btn btn-primary" onclick="history.back();">
                돌아가기
            </button>
        </div>
    </div>
</body>
</html>
