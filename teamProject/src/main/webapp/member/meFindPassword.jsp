<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<link href="<%=appName%>/assets/css/font-All.css" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">
              
		.idcheck-container {
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

		.sdms-font{
			font-family: 'SDMiSaeng', sans-serif;/*웹 폰트 지정*/
			color: orange;
			font-size: 70px;
		}
		.idcheck-container{
			font-size: 20px;
			color: black;
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
<title>아이디 확인</title>
</head>
<body>
    <div class="idcheck-container gmarket-m">
        <h2 class="sdms-font" style="font-size: 70px;">아이디 확인!</h2>
        <form action="<%=notWithFormTag%>mePasswordRecovery" method="post">
            <div class="mb-3">
                <label for="id" class="form-label" style="color: black;">가입하셨던 아이디를 입력해주세요!</label>
                <input type="text" class="form-control" id="id" name="id" required>
            </div>
            <button type="submit" class="btn btn-primary sdms-font" style="font-size: 25px; margin-top: 10px;">확인</button>
        </form>
    </div>
</body>
</html>
