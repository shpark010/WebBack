<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3></h3>
	<c:forEach var="i" begin="0" end="10">
		<c:set var="sum" value="${sum+i}" />
		${i}<br>
	</c:forEach>
	sum : 누적 ${sum}
	<br>
	<ul>
		<c:forEach var="i" begin="1" end="9">
			<li>3 X ${i} = ${3*i}</li>
		</c:forEach>
	</ul>

	<h3>구구단 출력하기</h3>
	<c:forEach var="i" begin="2" end="9">
		<c:forEach var="j" begin="0" end="9">
			<c:choose>
				<c:when test="${j==0}">
					${i}단<br>
				</c:when>
				<c:otherwise>				
					${i} X ${j} = ${i*j}&nbsp;|&nbsp;
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<br>
	</c:forEach>
	<h3>JSTL forEach</h3>
	<%
	int[] arr = new int[] { 10, 20, 30, 40, 50 };
	for (int i : arr) {
		out.print("출력값 : <b><i>" + i + "</i></b><br>");
	}
	request.setAttribute("iarr", arr);	//${iarr}
	%>
	<h3>EL에서는 JAVA 객체 접근 불가 (1. 객체를 request, session에 담는다. 2. JSTL c:set)</h3>
	<c:set var="intarr" value="<%=arr%>"/>
	EL : ${intarr}<br>
	<c:forEach var="arr" items="${intarr}">
		배열값 : ${arr}<br>
	</c:forEach>
	<hr>
	<c:forEach var="arr" items="${iarr}">
		배열값 : ${arr}<br>
	</c:forEach>
</body>
</html>