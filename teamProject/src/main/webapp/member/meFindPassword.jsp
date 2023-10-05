<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 확인</title>
</head>
<body>
    <div class="container">
        <h2>아이디 확인</h2>
        <form action="<%= request.getContextPath() %>/member/PasswordRecoveryProcess" method="post">
            <div class="mb-3">
                <label for="id" class="form-label">아이디</label>
                <input type="text" class="form-control" id="id" name="id" required>
            </div>
            <button type="submit" class="btn btn-primary">확인</button>
        </form>
    </div>
</body>
</html>
