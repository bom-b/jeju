<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/common/bootstrap5.jsp"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<script>
$(document).ready(function(){
	alert('${requestScope.alertMsg}');
	location.href="<%=notWithFormTag%>evMain"
});
</script>
<body>
</body>
</html>