<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common/bootstrap5.jsp" %>
<%@ include file="/common/common.jsp" %>
<%@page import="com.jeju.model.dao.MemberDao"%>
<%@page import="com.jeju.model.bean.Member"%>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        .container{margin-top: 10px; width: 100%;}
        tr{opacity: 0.7;}
        /* table {width: 100%;} */
    </style>    
</head>
<body>
    <div class="container">
        <h2>회원 목록</h2>    
        <table class="table table-hover">
            <thead class="table-dark">
                <tr>
                    <th align="center">아이디</th>
                    <th>비밀번호</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>비밀번호 찾기 질문</th>
                    <th>비밀번호 질문 답변</th>
                    <th>휴대폰번호</th>
                    <th>회원등급</th>
                    <th>생일</th>    
                    <th>등급별이미지</th>                
                </tr>
            </thead>
            <tbody>
                <tr><td colspan="10" align="right">${requestScope.pageInfo.pagingStatus}</td></tr>
                <c:forEach var="bean" items="${datalist}">
                    <tr class="table-danger">            
                    <td align="center">${bean.id}</td>
                    <td>
                        <a href="<%=notWithFormTag%>meDetail&id=${bean.id}">${bean.password}</a>                        
                    </td>
                    <td>${bean.name}</td>

                    <c:if test="${bean.gender eq 'male'}">
                        <td>남자</td>
                    </c:if>    
                    <c:if test="${bean.gender eq 'female'}">
                        <td>여자</td>
                    </c:if>                                        
                    <td>${bean.mquestion}</td>
                    <td>${bean.manswer}</td>
                    <td>${bean.mphoneno}</td>
                    <td>${bean.mrating}</td>
                    <td>${bean.birth}</td>
                    <td>${bean.ratingimg}</td>                    
                </tr>
                </c:forEach>
            </tbody>
        </table>    
        ${requestScope.pageInfo.pagingHtml}     
    </div>     
</body>
</html>
