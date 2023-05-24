<%@page import="java.util.HashMap"%>
<%@page import="kr.or.kosa.dto.Emp2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Emp2 e = new Emp2();

	HashMap<String,String> hp = new HashMap<>();
	hp.put("data","1004");
	
	//해결방법
	request.setAttribute("emp", e);	//EL 사용 가능
	
	//권장사항
	request.setAttribute("hobj", hp);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>기존방식</h3>
	<%=e%><br>
	<%=e.getEmpno()%><br>
	<%=e.getEname()%><br>
	
	<h3>EL</h3>
	EL() : JAVA 객체 출력 불가 (=JAVA의 객체에 대한 직접적인 접근 불가) : ${e}<br>
	EL() : ${e.getEmpno}<br>
	
	<h3>해결사(JSTL)</h3>
	1. 방법 : request객체 또는 session 객체에 담는다 (good)<br>
	EL : ${requestScope.emp}<br>
	
	2. 방법 : JSTL 사용<br>
	1. JSTL : jar 추가<br>
	2. taglib 통해 자원 추가 (namespace명시) >> 사용 >> prefix<br>
	<!-- 
	JSP Standard Tag Library의 약자로 JSP 표준 라이브러리이다.
	: JSP에서 자주 사용하는 기능(반복문과 조건문, 데이터 표현 등)을 미리 구현해 놓은 커스텀 태그 라이브러리 모음이다.
	: JSTL은 EL을 사용하여 표현한다.
	Apache 재단에서 진행하는 custom tag library 프로젝트
	– 스크립트 릿으로 작성해야할 로직을 태그로 대신 처리 가능
	– apache에서 다운받아 lib에 추가.
	-->
	<h3>JSTL(core) : 변수 , 제어문 (자바코드 없이) : 서버에서 실행</h3>
	<c:set var="m" value="<%=e%>"></c:set>
	<br>
	JSTL 사용해서 변수 m 생성 (EL을 통해 접근 가능) : ${m}<br>
	getter 함수를 직접 사용 (권장하지 않는다) : ${m.getEmpno()}<br>
	
	EL출력 (m.memberfield명 : 자동으로 getter함수 호출) : ${m.empno}<br>
	EL출력 (m.memberfield명 : 자동으로 getter함수 호출) : ${m.ename}<br>
	
	<!-- 
	EL 출력목척 : request, session 담긴 값
	JSTL : EL을 도와서 변수, 제어구조 출력을 도와준다. 
	-->
	<c:set var="username" value="${m.ename}"/>
	<c:set var="usernumber" value="${m.empno}"/>
	변수값 출력1 : ${username}<br>
	변수값 출력2 : ${usernumber}<br>
	
	<hr>
	<h3>JSTL 변수 만들기 scope 정의하기</h3>
	<c:set var="job" value="농구선수" scope="request"/>
	당신의 직업 : ${job}<br>
	만약, include, forward를 한다면 그 페이지에서도 job을 출력할 수 있다.
	<br>
	<c:set var="job2" value="야구선수"/>
	값출력 : ${job2}<br>
	
	잘쓰지 않아요 (재미로)<br>
	<c:remove var="job2"/>	<!-- 생성한 변수 제거 -->
	변수가 없더라도 예외는 발생하지 않고 값 출력만 안된다. : ${job2}
	
	<hr>
	JAVA API를 활용한 객체(직접 만든 객체) EL을 통한 접근 불가 : ${hp}<br>
	1. 권장방법 : request, session에 담는다.<br>
	hp객체 : ${hobj}<br>
	hp객체 자원 : ${bobj.data}<br>	
	
	2. JSTL c:set 사용
	<hr>
	<c:set var="vhp" value="<%=hp%>"/>
	hp객체 : ${vhp}<br>
	hp객체 자원 : ${vhp.data}<br>
	
	<hr>
	값을 write 가능 (hp.put("color","red")) jstl 가능 : 그냥 구경만 <br>
	<c:set target="${vhp}" property="color" value="red"/>
	hp객체 : ${vhp}<br>
</body>
</html>