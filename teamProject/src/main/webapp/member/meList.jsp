<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp"%>
<%@ include file="/common/common.jsp"%>
<%@page import="com.jeju.model.dao.MemberDao"%>
<%@page import="com.jeju.model.bean.Member"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
    <style type="text/css">
        .container {
            margin-top: 10px;
            width: 100%;
            
        }

        .table td, .table th {
            vertical-align: middle;
            text-align: center; /* 가운데 정렬 추가 */
        }

        .table th {
            text-align: center;
        }

        .bottom_button {
            margin-top: 20px;
        } /* Increase the margin-top for spacing */

        @font-face {
            font-family: 'SDMiSaeng';
            /*글꼴*/
            src: local('SDMiSaeng'), url('SDMiSaeng.eot'), url('SDMiSaeng.woff') format('woff'),
            url('assets/font-awesome/fonts/SDMiSaeng.ttf') format('truetype');
        }

        .sdms-font {
            font-family: 'SDMiSaeng', sans-serif;/*웹 폰트 지정*/
            color: black;
            font-size: 45px;
        }

        /* admin 아이디 행 스타일 */
        .admin-row {
            background-color: yellow; /* 원하는 배경색으로 변경 */
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="sdms-font">회원 목록</h2>
    <table class="table table-hover ">
        <thead class="table-dark">
        <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>성별</th>
            <th>비밀번호 찾기 질문</th>
            <th>비밀번호 질문 답변</th>
            <th>휴대폰번호</th>
            <th>회원등급</th>
            <th>생일</th>
            <th>등급별 이미지</th>
            <th>삭제</th>
        </tr>
        </thead>
        <tbody>
        
        <c:forEach var="bean" items="${datalist}">
            <tr class="${bean.id eq 'admin' ? 'admin-row' : 'table-danger'}">
                <td><a href="<%=notWithFormTag%>meDetail&id=${bean.id}">${bean.id}</a></td>
                <td>
                    ${bean.password}
                </td>
                <td>${bean.name}</td>
                <td>${bean.gender eq 'male' ? '남자' : '여자'}</td>
                <td>${bean.mquestion}</td>
                <td>${bean.manswer}</td>
                <td>${bean.mphoneno}</td>
                <td>${bean.mrating}</td>
                <td>${bean.birth}</td>
                <td>${bean.ratingimg}</td>
                <td>
                    <form action="<%= notWithFormTag %>meListDelete" method="post">
                        <!-- memberId를 숨겨진 input 필드로 전달 -->
                        <input type="hidden" name="memberId" value="${bean.id}">
                        <button type="submit" class="btn btn-danger" style="font-size: 20px">탈퇴하기</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="11" align="right">${requestScope.pageInfo.pagingStatus}</td>
        </tr>
        </tbody>
    </table>
    ${requestScope.pageInfo.pagingHtml}
</div>
</body>
</html>
