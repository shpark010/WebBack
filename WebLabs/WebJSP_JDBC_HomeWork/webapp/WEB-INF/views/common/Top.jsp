<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="main.do">Main</a>&nbsp;&nbsp;&nbsp;||
<a href="login.do">Login</a>&nbsp;&nbsp;&nbsp;||
<a href="join.do">Register</a>&nbsp;&nbsp;&nbsp;||
<a href="#">Intro</a>&nbsp;&nbsp;&nbsp;||
<a href="#">Intro</a>&nbsp;&nbsp;&nbsp;

<c:choose>
	<c:when test="${sessionScope.userid != null}">
		<b>[ ${sessionScope.userid} ]</b> 로그인 상태
		<a href='logout.do'>[ 로그아웃 ]</a>
	</c:when>
	<c:otherwise>
		<b>[로그인 하지 않으셨네요]</b>
		<a href='login.do'>[ 로그인 ]</a>
	</c:otherwise>
</c:choose>

