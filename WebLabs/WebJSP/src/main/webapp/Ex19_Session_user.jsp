<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	session 객체 (자원 가지고 놀기)
	
	1. session 객체 (사용자마다 부여되는 고유한 객체)
	>> 접속하는 사용자에 구분 (sessionID) ....
	>> 접속한 사용자 마다 다른 정보를 관리 (고유하게 부여되는 session 객체)를 가지고..
	>> session.setAttribute();
	ex) 로그인한 사용자 ID를 가지고 다니고 싶다.(server)
		session.setAttribute("id",request.getParameter("userid"));
		
	접속자 3명
	
	김유신 >> 서버(session 객체 생성) >> 고유한 key 생성 (식별값) >> 사용자의 id 저장
	--session객체 >> id,kim
	
	이순신 >> ...
	--session객체 >> id,lee
 -->
	<h3>세션정보</h3>
	sessionID : <%=session.getId()%>
	<hr>
	<%
		String userid = request.getParameter("userid");
		//POINT 필요에 따라 session 객체에 저장 및 필요시 사용
		session.setAttribute("id", userid);
	%>
	
	<h3>내가 저장한 session 이 필요하면</h3>
	<%
		String id = (String)session.getAttribute("id");
		out.print("당신의 ID는" + id + "입니다. ^^");
	%>
	<!-- 
		request 객체의 유효 범위 : 요청한 페이지(단, include, forward는 그 페이지도 사용 가능)
		session 객체의 유효 범위 : webapp 안에 있는 모든 페이지
	 -->
</body>
</html>