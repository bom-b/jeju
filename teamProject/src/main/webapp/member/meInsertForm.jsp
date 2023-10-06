<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        var isIdChecked = false; // 아이디 중복 체크 여부를 저장할 변수

        function validCheck() {
            var id = $('#id').val();

            if (id.length < 4 || id.length > 10) {
                swal('아이디는 4자리 이상 10자리 이하로 입력해 주세요.');
                $('#id').focus();
                return false; /* false이면 이벤트 전파 방지 */
            }

            if (!isIdChecked) {
                swal('아이디 중복 체크를 먼저 실행해 주세요.'); // 중복 체크를 하지 않았을 때 메시지 표시
                return false;
            }

            var password = $('#password').val();
            if (password.length < 5 || password.length > 12) {
                swal('비밀 번호는 5자리 이상 12자리 이하로 입력해 주세요.');
                $('#password').focus();
                return false;
            }

            var name = $('#name').val();
            if (name.length < 3 || name.length > 15) {
                swal('이름은 3자리 이상 15자리 이하로 입력해 주세요.');
                $('#name').focus();
                return false;
            }

            var regex = /^[a-z]\S{4,11}$/; /* 정규 표현식 */
            var result = regex.test(password);

            if (result == false) {
                swal('비밀 번호의 첫글자는 반드시 소문자이어야 합니다.');
                return false;
            }

            if (password.indexOf('@') <= 0 && password.indexOf('#') <= 0 && password.indexOf('$') <= 0) {
                swal('비밀번호에는 특수 문자 @#% 중에 최소 1개가 포함이 되어야 합니다.');
                return false;
            }

            var radioList = $('input[type="radio"]:checked');
            if (radioList.length == 0) {
                swal('성별은 반드시 선택이 되어야 합니다.');
                return false;
            }

            var mquestion = $('#mquestion').val();
            if (mquestion == '-') { /* 코딩할 때 option의 value 속성을 하이폰으로 설정했습니다. */
                swal('질문을 선택해 주세요.');
                $('#mquestion').focus();
                return false;
            }

            var mphoneno = $('#mphoneno').val();
            if (mphoneno.length != 11) {
                $('#mphoneno').focus();
                swal('핸드폰번호 11자리를 입력해주세요');
                return false;
            }

            /* jqueryUI 플러그인 date picker */
            var birth = $('#birth').val();
            var regex = /^\d{4}\/[01]\d{1}\/[0123]\d{1}$/;
            var result = regex.test(birth);

            if (result == false) {
                swal('생일은 반드시 yyyy/mm/dd 형식으로 입력해 주세요.');
                return false;
            }

            return true; // 중복 체크가 완료되고 모든 검사가 통과한 경우 true 반환
        }

        function checkId() {
            var id = $('#id').val();

            $.ajax({
                url: 'IdCheckServlet', // 중복 체크 서블릿 URL로 변경해야 합니다.
                type: 'POST',
                data: { id: id },
                success: function (data) {
                    if (data === "duplicate") {
                        swal('이미 사용 중인 아이디입니다.');
                    } else if (data === "available") {
                        swal('사용 가능한 아이디입니다.');
                        isIdChecked = true; // 아이디 중복 체크 완료 여부를 true로 설정
                    }
                },
                error: function (xhr, status, error) {
                    swal('중복 체크에 실패했습니다.');
                }
            });
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
                    <button type="button" class="btn btn-primary sdms-font" onclick="checkId()" style="font-size: 20px">중복 체크</button>
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
                
                <!-- 추가: 비밀번호 찾기 질문 추가 -->
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
                <button type="submit" class="btn btn-primary sdms-font" onclick="return validCheck();" style="font-size: 25px"> 
                    등록
                </button>
                &nbsp;&nbsp;&nbsp;
                <button type="reset" class="btn btn-info sdms-font" style="font-size: 25px">초기화</button>				
            </div>
        </form>
    </div>
</body>
</html>
