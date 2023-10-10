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
<link href="<%=appName%>/assets/css/font-All.css" rel="stylesheet">
<style type="text/css">
        .msp-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('assets/img/loginbackground.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }

        .msp-table {
            width: 60%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            font-family: 'gmarket-l';
        }

        .msp-table th, .msp-table td {
            padding: 10px;
            text-align: center;
        }

        .msp-table th {
            background-color: #007BFF;
            color: white;
        }

        .msp-tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .msp-tbody tr:hover {
            background-color: #ddd;
        }

        #backButton {
            margin-top: 20px;
        }

        .btn-primary {
            background-color: #007BFF;
            color: white;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 확인</title>
</head>
<body>
    <div class="msp-container">
        <h2 class="sdms-font" style="font-size: 50px">입력하신 아이디의 비밀번호는 다음과 같습니다.</h2>
        <table class="msp-table">         
            <thead></thead>
            <tbody class="msp-tbody gmarket-m" style="color: black;">
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
        	<a type="button" href="<%=notWithFormTag%>meLogin" class="btn btn-primary sdms-font" style="font-size: 25px">로그인</a>
            <button type="button" class="btn btn-primary sdms-font" style="font-size: 25px;" onclick="history.back();">
                돌아가기
            </button>
        </div>
    </div>
</body>
</html>
