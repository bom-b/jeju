<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/common.jsp" %>
<%@ include file="/common/bootstrap5.jsp" %>
    
<!DOCTYPE html>
<html>
<link href="<%=appName%>/assets/css/font-All.css" rel="stylesheet">
<script type="text/javascript">
        $(document).ready(function() {    
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            });        
        });
    </script>
    <style type="text/css">

        .login-form {
            text-align: center;
        }

        .login-form input[type="text"],
        .login-form input[type="password"],
        .login-form button,
        .login-form a {
            margin: 5px;
        }
        
		.login-container {
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
		
		#bottom_button {
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
	<title>로그인</title>   
</head>
<body>
    <br/>
    <div class="login-container">
        <div class="login-form">
            <h2 class="sdms-font" style="font-size: 100px">로그인</h2>
            <form action="<%=withFormTag%>" method="post">
                <input type="hidden" name="command" value="meLogin"> 
                <div> 
                    <label for="id" class="form-label sdms-font" style="font-size: 30px">아이디</label> 
                    <input type="text" class="form-control gmarket-m" id="id" name="id" 
                        placeholder="아이디를 입력해 주세요."
                        data-bs-toggle="tooltip" title="아이디는 3글자 이상 10글자 이하이어야 합니다."
                        data-bs-placement="top">
                </div>
                <div>
                    <label for="password" class="form-label sdms-font" style="font-size: 30px">비밀 번호</label> 
                    <input class="form-control " type="password" 
                        id="password" name="password">
                </div>            
                <div class="bottom_button">                    
                    <button type="submit" class="btn btn-primary mb1 bg-orange sdms-font" style="font-size: 25px">로그인</button> 
                    <a type="button" href="<%=notWithFormTag%>meInsert" class="btn btn-primary sdms-font" style="font-size: 25px">회원 가입</a>
                </div>                
            </form>

	        	<div class="row">
	        		<div class="col-sm-12">
                    	<a class="sdms-font" style="font-size: 30px;" href="<%=notWithFormTag%>mePasswordFind">비밀번호를 잊으셨나요??</a>
                    </div>
                </div>

        </div>
    </div>     
</body>
</html>
