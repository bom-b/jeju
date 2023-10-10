<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// appName : 애플리케이션 이름(프로젝트 이름_Teacher)
	String appName = request.getContextPath();
	String mappingName = "/jeju" ;  // in FrontController.java file
	// form 태그가 아닌 영역에서 사용할 변수
	String notWithFormTag = appName + mappingName + "?command=";
	set
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script type="text/javascript" src="assets/js/jquery-1.11.1.min.js"></script>
</head>
<script>
$(document).ready(function(){

	alert('${requestScope.alerUMsg}');
	
	<%-- location.href="<%=notWithFormTag%>evMain"; --%>
}); 

</script>
<body>
<div style="text-align: center;">
	<img src="<%=appName%>/assets/img/event_img/popup.gif" style="text-align: center;">
</div>
						
</body>
</html>