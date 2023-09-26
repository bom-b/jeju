<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/bootstrap5.jsp"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 게시판 메인 전용 부트스트랩 -->
<link rel="stylesheet" href="<%=appName%>/assets/css_boardmain/bootstrap.min.css">
<link href="<%=appName%>/assets/css_boardmain/style.css" rel="stylesheet">
<!-- 게시판 메인 전용 style.css -->
<link href="<%=appName%>/assets/css_eventmain/eventmain.css" rel="stylesheet">
<link href="<%=appName%>/assets/css_eventmain/nicepage.css" rel="stylesheet" media="screen">
<link href="<%=appName%>/assets/css_eventmain/Page-2.css" rel="stylesheet" media="screen">
<link href="<%=appName%>/assets/css_eventmain/Page-4.css" rel="stylesheet" media="screen">
<style type="text/css">

</style>
</head>
 <body data-path-to-root="./" class="u-body u-xl-mode" data-lang="en" >
     <section class="u-clearfix u-section-1" id="sec-d4a9">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-custom-color-4 u-expanded-width-lg u-expanded-width-md u-expanded-width-xl u-expanded-width-xs u-shape u-shape-rectangle u-shape-1"></div>
        <img src="<%=appName%>/assets/img/event_img/morae.png" alt="" class="u-image u-image-contain u-image-default u-image-1" data-image-width="500" data-image-height="396">
        <img src="<%=appName%>/assets/img/event_img/${requestScope.eventDetail.eimage1}" alt="" class="u-image u-image-default u-image-2" data-image-width="400" data-image-height="400">
        <img src="<%=appName%>/assets/img/event_img/eventlogo.png" alt="" class="u-image u-image-contain u-image-default u-image-3" data-image-width="120" data-image-height="120">
        <div class="u-container-style u-expanded-width-xs u-group u-group-1">
          <div class="u-container-layout u-valign-top-lg u-container-layout-1">
            <h1 class="u-text u-text-custom-color-13 u-title u-text-1">
              <span style="font-weight: 700;">${requestScope.eventDetail. ename}</span>
            </h1>
            <p class="u-large-text u-text u-text-variant u-text-2">${requestScope.eventDetail.econtent}</p>
            <a href="https://nicepage.com/c/food-restaurant-html-templates" class="u-btn u-button-style u-custom-color-11 u-text-white u-btn-1">자세히 보기</a>
          </div>
        </div>
      </div>
    </section>
    
    <section class="u-clearfix u-section-2" id="sec-5729">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-custom-color-4 u-shape u-shape-rectangle u-text-custom-color-4 u-shape-1"></div>
        <div class="u-align-left u-container-style u-expanded-width-xs u-group u-group-1">
          <div class="u-container-layout u-container-layout-1">
            <div class="u-align-left u-border-2 u-border-palette-3-base u-line u-line-vertical u-line-1"></div>
            <h2 class="u-align-left-xs u-text u-text-1">아ㅏ아아아아아아아아아아아아</h2>
            <p class="u-align-left-xs u-text u-text-2">아아아아아아아아아아아아ㅏ<br>아아아아아아아아아아아아<br>
            </p>
          </div>
        </div>
      </div>
    </section>
    <section class="u-carousel u-slide u-block-f1e7-1" id="carousel-2ad1" data-interval="5000" data-u-ride="carousel">
      <ol class="u-absolute-hcenter u-carousel-indicators u-block-f1e7-2">
        <li data-u-target="#carousel-2ad1" data-u-slide-to="0" class="u-active u-grey-30"></li>
        <li data-u-target="#carousel-2ad1" class="u-grey-30" data-u-slide-to="1"></li>
        <li data-u-target="#carousel-2ad1" class="u-grey-30" data-u-slide-to="2"></li>
      </ol>
      <div class="u-carousel-inner" role="listbox">
        <div class="u-active u-carousel-item u-clearfix u-section-2-1">
          <div class="u-clearfix u-sheet u-sheet-1">
            <div class="u-align-center-lg u-align-center-xl u-align-center-xs u-container-style u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-group-1">
              <div class="u-container-align-center u-container-layout u-valign-middle-md u-valign-middle-sm u-valign-middle-xl u-valign-middle-xs u-container-layout-1">
                <h2 class="u-align-center-md u-align-center-sm u-text u-text-1">How to Use Your Financial Aid Like a Paycheck</h2>
                <div class="u-border-3 u-border-grey-dark-1 u-line u-line-horizontal u-line-1"></div>
              </div>
            </div>
            <img src="<%=appName%>/assets/img/event_img/snoopy01.png" class="u-align-left u-image u-opacity u-opacity-50 u-image-1">
            <img src="<%=appName%>/assets/img/event_img/minsokchon01.png" class="u-align-left u-image u-opacity u-opacity-50 u-image-2">
            <img src="<%=appName%>/assets/img/event_img/tamra01.png" class="u-align-left u-image u-image-3">
            <div class="u-container-style u-group u-group-2">
              <div class="u-container-layout">
                <p class="u-align-center u-custom-font u-small-text u-text u-text-font u-text-variant u-text-2">
                  <a href="https://www.usnews.com/education/best-colleges/paying-for-college/articles/2018-08-13/how-to-use-your-financial-aid-like-a-paycheck?int=undefined-rec" target="_blank">learn more</a>
                </p>
                <div class="u-border-1 u-border-grey-dark-1 u-expanded-width u-line u-line-horizontal u-line-2"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="u-carousel-item u-clearfix u-section-2-2">
             <div class="u-clearfix u-sheet u-sheet-1">
            <div class="u-align-center-lg u-align-center-xl u-align-center-xs u-container-style u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-group-1">
              <div class="u-container-align-center u-container-layout u-valign-middle-md u-valign-middle-sm u-valign-middle-xl u-valign-middle-xs u-container-layout-1">
                <h2 class="u-align-center-md u-align-center-sm u-text u-text-1">How to Use Your Financial Aid Like a Paycheck</h2>
                <div class="u-border-3 u-border-grey-dark-1 u-line u-line-horizontal u-line-1"></div>
              </div>
            </div>
            <img src="<%=appName%>/assets/img/event_img/snoopy01.png" class="u-align-left u-image u-opacity u-opacity-50 u-image-1">
            <img src="<%=appName%>/assets/img/event_img/minsokchon01.png" class="u-align-left u-image u-opacity u-opacity-50 u-image-2">
            <img src="<%=appName%>/assets/img/event_img/tamra01.png" class="u-align-left u-image u-image-3">
            <div class="u-container-style u-group u-group-2">
              <div class="u-container-layout">
                <p class="u-align-center u-custom-font u-small-text u-text u-text-font u-text-variant u-text-2">
                  <a href="https://www.usnews.com/education/best-colleges/paying-for-college/articles/2018-08-13/how-to-use-your-financial-aid-like-a-paycheck?int=undefined-rec" target="_blank">learn more</a>
                </p>
                <div class="u-border-1 u-border-grey-dark-1 u-expanded-width u-line u-line-horizontal u-line-2"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="u-carousel-item u-clearfix u-section-2-3">
            <div class="u-clearfix u-sheet u-sheet-1">
            <div class="u-align-center-lg u-align-center-xl u-align-center-xs u-container-style u-expanded-width-md u-expanded-width-sm u-expanded-width-xs u-group u-group-1">
              <div class="u-container-align-center u-container-layout u-valign-middle-md u-valign-middle-sm u-valign-middle-xl u-valign-middle-xs u-container-layout-1">
                <h2 class="u-align-center-md u-align-center-sm u-text u-text-1">How to Use Your Financial Aid Like a Paycheck</h2>
                <div class="u-border-3 u-border-grey-dark-1 u-line u-line-horizontal u-line-1"></div>
              </div>
            </div>
            <img src="<%=appName%>/assets/img/event_img/snoopy01.png" class="u-align-left u-image u-opacity u-opacity-50 u-image-1">
            <img src="<%=appName%>/assets/img/event_img/minsokchon01.png" class="u-align-left u-image u-opacity u-opacity-50 u-image-2">
            <img src="<%=appName%>/assets/img/event_img/tamra01.png" class="u-align-left u-image u-image-3">
            <div class="u-container-style u-group u-group-2">
              <div class="u-container-layout">
                <p class="u-align-center u-custom-font u-small-text u-text u-text-font u-text-variant u-text-2">
                  <a href="https://www.usnews.com/education/best-colleges/paying-for-college/articles/2018-08-13/how-to-use-your-financial-aid-like-a-paycheck?int=undefined-rec" target="_blank">learn more</a>
                </p>
                <div class="u-border-1 u-border-grey-dark-1 u-expanded-width u-line u-line-horizontal u-line-2"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <a class="u-carousel-control u-carousel-control-prev u-text-body-alt-color u-block-f1e7-3" href="#carousel-2ad1" role="button" data-u-slide="prev">
        <span aria-hidden="true">
          <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
        </span>
        <span class="sr-only">
          <svg viewBox="0 0 451.847 451.847"><path d="M97.141,225.92c0-8.095,3.091-16.192,9.259-22.366L300.689,9.27c12.359-12.359,32.397-12.359,44.751,0
c12.354,12.354,12.354,32.388,0,44.748L173.525,225.92l171.903,171.909c12.354,12.354,12.354,32.391,0,44.744
c-12.354,12.365-32.386,12.365-44.745,0l-194.29-194.281C100.226,242.115,97.141,234.018,97.141,225.92z"></path></svg>
        </span>
      </a>
      <a class="u-carousel-control u-carousel-control-next u-text-body-alt-color u-block-f1e7-4" href="#carousel-2ad1" role="button" data-u-slide="next">
        <span aria-hidden="true">
          <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
        </span>
        <span class="sr-only">
          <svg viewBox="0 0 451.846 451.847"><path d="M345.441,248.292L151.154,442.573c-12.359,12.365-32.397,12.365-44.75,0c-12.354-12.354-12.354-32.391,0-44.744
L278.318,225.92L106.409,54.017c-12.354-12.359-12.354-32.394,0-44.748c12.354-12.359,32.391-12.359,44.75,0l194.287,194.284
c6.177,6.18,9.262,14.271,9.262,22.366C354.708,234.018,351.617,242.115,345.441,248.292z"></path></svg>
        </span>
      </a>
    </section>
 <!--    <section class="u-backlink u-clearfix u-grey-80">
      <a class="u-link" href="https://nicepage.com/html-templates" target="_blank">
        <span>HTML Templates</span>
      </a>
      <p class="u-text">
        <span>created with</span>
      </p>
      <a class="u-link" href="https://nicepage.app" target="_blank">
        <span>Website Builder</span>
      </a>. 
    </section> -->
  
</body>
</html>