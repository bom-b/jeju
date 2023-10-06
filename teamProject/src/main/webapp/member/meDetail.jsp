<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${requestScope.bean.name}님의 회원 정보</title>
    <style type="text/css">      
        .detail-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            /* Set the background image and adjust its size */
            background-image: url('assets/img/loginbackground.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }
        
        .bottom_button { margin-top: 20px; } /* Increase the margin-top for spacing */
        @font-face{
        font-family:'SDMiSaeng'; /*글꼴*/
        src: local('SDMiSaeng'),
            url('SDMiSaeng.eot'),
            url('SDMiSaeng.woff') format('woff'),
            url('assets/font-awesome/fonts/SDMiSaeng.ttf') format('truetype');
        }

        .sdms-font{
            font-family: 'SDMiSaeng', sans-serif;/*웹 폰트 지정*/
            color: orange;
        }
        .detail-table{
            background-color: white;
            width: 60%;
            margin: auto;
        }
    </style>
</head>
<body>
    <div class="detail-container sdms-font">
        <h2 style="font-size: 50px;">${requestScope.bean.name}님의 회원 정보</h2>
        <table class="table">
            <tbody class="detail-table" style="font-size: 30px;">
                <tr>
                    <td align="center">아이디 :</td>
                    <td>${requestScope.bean.id}</td>
                </tr>
                <tr>
                    <td align="center">비밀번호 :</td>
                    <td>${requestScope.bean.password}</td>
                </tr>
                <tr>
                    <td align="center">이름 :</td>
                    <td>${requestScope.bean.name}</td>
                </tr>            
                <tr>
                    <td align="center">성별 :</td>
                    <c:if test="${requestScope.bean.gender eq 'male'}">
                        <td>남자</td>
                    </c:if>    
                    <c:if test="${requestScope.bean.gender eq 'female'}">
                        <td>여자</td>
                    </c:if>
                </tr>
                <tr>
                    <td align="center">비밀번호 찾기 질문 :</td>
                    <td>${requestScope.bean.mquestion}</td>
                </tr>
                <tr>
                    <td align="center">비밀번호 찾기 질문 답 :</td>
                    <td>${requestScope.bean.manswer}</td>
                </tr>
                <tr>
                    <td align="center">핸드폰 번호 :</td>
                    <td>${requestScope.bean.mphoneno}</td>
                </tr>
                <tr>
                    <td align="center">회원등급 :</td>
                    <td>${requestScope.bean.mrating}</td>
                </tr>
                <tr>
                    <td align="center">등급이미지 :</td>
                    <td><img src="<%=appName%>/assets/img/${requestScope.bean2.ratingimg}" height="25px" width="25px"></td>
                </tr>
                <tr>
                    <td align="center">생일 :</td>
                    <td>${requestScope.bean.birth}</td>
                </tr>                            
            </tbody>
        </table>
        <div id="backButton">
            <button type="button" class="btn btn-primary" onclick="history.back();" style="font-size: 20px;">
                돌아가기 
            </button>
        </div>
    </div>
</body>
</html>
