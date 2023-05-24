<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL : <%=(write) 대체 목적
	
	//JAVA가 가지는 자원들 ... EL과 JSTL 못해요
	
	Date today = new Date();
	request.setAttribute("day", today);
	session.setAttribute("day2", today);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 화면 출력 (Server쪽 자원을...)</h3>
	EL : ${requestScope.day}<br>
	EL : ${day}<br>	<!-- day가 어떤 객체에 담겨있는지 모른다(session, request 판단(X) -->
	EL : day2 : ${day2}<br>
	EL : day2 : ${sessionScope.day2}<br>
</body>
</html>