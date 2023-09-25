<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
  		//$(document).ready(function(){
  	  		/* $('#birth').datepicker(); */
  	  		//$('#birth').datepicker({dateFormat: "yy/mm/dd"});   	  	 	
  		//});
  		
  		function validCheck(){/* form validation check */
  			var id = $('#id').val();
  			
  			if(id.length < 4 || id.length > 10){
  				swal('아이디는 4자리 이상 10자리 이하로 입력해 주세요.');
  				$('#id').focus();
  				return false ; /* false이면 이벤트 전파 방지 */
  			}
  			
  			var password = $('#password').val();  			
  			if(password.length < 5 || password.length > 12){
  				swal('비밀 번호는 5자리 이상 12자리 이하로 입력해 주세요.');
  				$('#password').focus();
  				return false ;
  			}
  			
  			var name = $('#name').val();  			
  			if(name.length < 3 || name.length > 15){  				
  				$('#name').focus();
  				swal('이름은 3자리 이상 15자리 이하로 입력해 주세요.');
  				return false ;
  			}
  			
  			var regex = /^[a-z]\S{4,11}$/; /* 정규 표현식 */
  			var result = regex.test(password) ;

  			if(result == false){
  				swal('비밀 번호의 첫글자는 반드시 소문자이어야 합니다.');  				
  				return false ;
  			}
  			
  			if(password.indexOf('@') <= 0 && password.indexOf('#') <= 0 && password.indexOf('$') <= 0){
  				swal('특수 문자 @#% 중에 최소 1개가 포함이 되어야 합니다.');  				
  				return false ;
  			}
  			
			var radioList = $('input[type="radio"]:checked') ;
  			if(radioList.length == 0){
  				swal('성별은 반드시 선택이 되어야 합니다.');
  				return false ; 
  			}
 			
  			/* jqueryUI 플러그인 date picker */
  			var birth = $('#birth').val();
  			var regex = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/ ;
  			var result = regex.test(birth);
  			
  			if(result == false){
  				swal('생일은 반드시 yyyy/mm/dd 형식으로 입력해 주세요.');  				
  				return false ;
  			}   			
  		}
  	</script>
  	<style type="text/css">
  		.insert-container {
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
    .input-group {
        margin: 7px;
    }

    .input-group-text {
        display: block;
        margin-left: auto;
        margin-right: auto;
    }

    #buttonset {
        margin-top: 15px;
    }

    .radio_gender, .checkbox_hobby {
        font-size: 1.1rem; /* 주위 글꼴의 1.1배 */
    }
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
		h2{
			font-size: 70px;
		}
		
  	</style>
</head>
<body>
	<div class="insert-container">
		<h2 class="sdms-font">회원 가입</h2>
    <div class="row">
    <form action="<%=withFormTag%>" method="post">
        <div class="col-md-6">
            
                <!-- 왼쪽 컨테이너 -->
                <input type="hidden" name="command" value="meInsert">
                <div class="input-group">
                    <span class="input-group-text sdms-font" style="font-size: 30px">아이디</span>
                    <input class="form-control" type="text" id="id" name="id">
                </div>
                <div class="input-group">
                    <span class="input-group-text sdms-font" style="font-size: 30px">비밀 번호</span>
                    <input class="form-control" type="password" id="password" name="password">
                </div>
                <div class="input-group">
                    <span class="input-group-text sdms-font" style="font-size: 30px">이름</span>
                    <input class="form-control" type="text" id="name" name="name">
                </div>               
                <div class="input-group">
                <span class="input-group-text sdms-font" style="font-size: 30px">성별</span>
                <div class="form-control">
                    <label class="radio-inline radio_gender sdms-font" style="font-size: 20px">
                        &nbsp;<input type="radio" id="gender1" name="gender" value="male">남자
                    </label>
                    <label class="radio-inline radio_gender sdms-font" style="font-size: 20px">
                        &nbsp;<input type="radio" id="gender2" name="gender" value="female">여자
                    </label>
                </div>
            </div>

        </div>
			
			<div class="col-md-6">
            <!-- 오른쪽 컨테이너 -->

            
            <div class="input-group">
                <span class="input-group-text sdms-font" style="font-size: 30px">비밀번호 찾기 질문</span>
                <input class="form-control" type="text" id="mquestion" name="mquestion">
            </div>
            <div class="input-group">
				<span class="input-group-text sdms-font" style="font-size: 30px">비밀번호 찾기 질문 답</span>
				<input class="form-control" type="text" id="manswer" name="manswer">				
			</div>	
			<div class="input-group">
				<span class="input-group-text sdms-font" style="font-size: 30px">핸드폰 번호</span>
				<input class="form-control" type="number" id="mphoneno" name="mphoneno">				
			</div>
			<div class="input-group">
                <span class="input-group-text sdms-font" style="font-size: 30px">생일</span>
                <input class="form-control" type="datetime" id="birth" name="birth">
            </div>
	
        </div>
    </div>			
			<form action="<%=withFormTag%>" method="post">			
			<div id="buttonset" class="input-group">
				<button type="submit" class="btn btn-primary sdms-font" onclick="return validCheck();"
				 style="font-size: 25px"> 
					등록
				</button>
				&nbsp;&nbsp;&nbsp;
				<button type="reset" class="btn btn-info sdms-font" style="font-size: 25px">초기화</button>				
			</div>
		</form>
	</div>
</body>
</html>