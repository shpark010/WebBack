<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <% 
    	/*
    	EL & JSTL 구문 WAS해석 (서버쪽 스크립트)
    	<c:set/ 변수생성, 값을 저장
    	<c:if test="">
    	<c:choose> 여러가지 조건 처리 (if 활용도가 높다)
    	<c:forEach 반복문(개선된 for문) javascript > foreach
    	<c:forTokens 자바 for하고 split 결합
    	<c:out 출력식 ${}사용
    	<c:catch 예외처리 가능
    	*/
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL & JSTL</h3>
	EL parameter : ${param.id} - ${param.pwd}<br>
	
	<h3>param 변수 저장</h3>
	<c:set var="userid" value="${param.id}"/>
	<c:set var="userpwd" value="${param.pwd}"/>
	
	<h3>변수값 출력</h3>
	id : ${userid}<br>
	pwd : ${userpwd}<br>
	<hr>
	<c:if test="${!empty userpwd}">	<!-- 비번이 있으면 -->
		<h3>Not Empty password</h3>
		<c:if test="${userpwd == '1004'}">
			<h3>Welcom Admin ^^</h3>
		</c:if>
	</c:if>
</body>
</html>