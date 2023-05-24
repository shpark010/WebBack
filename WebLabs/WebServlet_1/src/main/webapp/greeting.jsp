<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실습</title>
</head>
<body>
	<h3>greeting page</h3>
	<p>객체 주소 : <%=request.getAttribute("msg") %></p>
	<p>문자 : <%=request.getAttribute("str") %></p>
	
	<hr>
	EL : ${requestScope.msg}<br>
	EL : ${requestScope.str}<br>
</body>
</html>