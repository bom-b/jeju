<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/common.jsp" %>
<%@ include file="/common/bootstrap5.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script type="text/javascript">
        $(document).ready(function() {    
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            });        
        });
    </script>
    <style type="text/css">

        .login-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }


        .login-form {
            text-align: center;
        }

        .login-form input[type="text"],
        .login-form input[type="password"],
        .login-form button,
        .login-form a {
            margin: 5px 0;
        }
		.login-container {
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
    </style>
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
                    <input type="text" class="form-control" id="id" name="id" 
                        placeholder="아이디를 입력해 주세요."
                        data-bs-toggle="tooltip" title="아이디는 3글자 이상 10글자 이하이어야 합니다."
                        data-bs-placement="top">
                </div>
                <div>
                    <label for="password" class="form-label sdms-font" style="font-size: 30px">비밀 번호</label> 
                    <input class="form-control" type="password" 
                        id="password" name="password">
                </div>            
                <div class="bottom_button">
                    <!-- contextual class : btn-primary, btn-info, btn-danger -->
                    <button type="submit" class="btn btn-primary mb1 bg-orange sdms-font" style="font-size: 25px">로그인</button> 
                    <a type="button" href="<%=notWithFormTag%>meInsert" class="btn btn-info sdms-font" style="font-size: 25px">회원 가입</a>
                </div>                
            </form>
        </div>
    </div>
</body>
</html>
