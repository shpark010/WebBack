<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		1.한글처리
		2.데이터 받기
		3.로직처리 (비지니스) >> DB 작업 >> 암호화 작업 >> 요구사항 정리 ...

		내장객체 (WAS : 톰켓) 가지고 있는 자원
		1. request
		2. response
		3. session
		4. application
		5. out (출력 담당 객체)
	*/
	request.setCharacterEncoding("UTF-8");
		
	String id = request.getParameter("id");
	
	//MemberDao dao = new MemberDao();
	//MemberDto dto = dao.getEmpListById(id);
	//화면 출력
	
	//1. Client 서버에 요청
	//2. 서버에 요청 페이지당 한개의 request 객체 생ㅅ어
	//3. request는 클라이언트의 다양한 정보를 담아요
	//request 객체가 가지는 다양한 자원 살펴보기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	입력값 : <%=id%><hr>
	접속한 클라이언트 IP : <%=request.getRemoteAddr()%><hr>
	서버 인코딩 정보 : <%=request.getCharacterEncoding()%><hr>
	포트 : <%=request.getServerPort()%><hr>
	<!-- getContextPath : 사이트명, 가상팩토리, 홈 디렉토리 default 웹 경로 -->
	파일 업로드 (자료실) : <%=request.getContextPath()%><hr>
	
</body>
</html>