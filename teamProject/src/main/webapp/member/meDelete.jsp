<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@ include file="/common/bootstrap5.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 게시판 메인 전용 부트스트랩 -->
    <link rel="stylesheet" href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">

    <!-- 게시판 메인 전용 style.css -->
    <link href="<%=appName%>/assets/css_memenucss/memainstyle.css" rel="stylesheet">
    <style>
        .memenu-container {
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
    <div class="memenu-container py-5">
        <div class="container">
            <h2 class="sdms-font" style="font-size: 100px">회원 탈퇴 확인</h2>
            <div class="row g-4">
                <div class="col-lg-12 col-sm-12 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bn-medelete banner-item rounded pt-3">
                        <div class="p-5">
                            <p class="banner-text text-white">
                                회원 탈퇴를 진행하시겠습니까? 이 작업은 되돌릴 수 없습니다.
                            </p>
                            <form action="<%= notWithFormTag %>meDeleteProcess" method="post">
                                <button type="submit" class="btn btn-danger" style="font-size: 20px">탈퇴하기</button>
                                <!-- 취소하기 버튼 -->
                                <a href="<%= notWithFormTag %>meMenu" class="btn btn-secondary" style="font-size: 20px">취소하기</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
