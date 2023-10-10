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
            background-image: url('assets/img/loginbackground.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
        }        

        .sdms-font{
            font-family: 'SDMiSaeng', sans-serif;/*웹 폰트 지정*/
            color: orange;
        }
        
        .detail-table{
            width: 60%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        .detail-table th, .detail-table td {
            padding: 10px;
            text-align: center;
        }

        .detail-table th {
            background-color: #007BFF;
            color: white;
        }

        .detail-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .detail-table tr:hover {
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
</head>
<body>
    <div class="detail-container sdms-font">
        <h2 style="font-size: 50px;">${requestScope.bean.name}님의 회원 정보</h2>
        <table class="detail-table">
            <tbody style="font-size: 30px;">
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
                    <td><img src="<%=appName%>/assets/img/${requestScope.bean.ratingimg}" height="25px" width="25px"></td>
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
