<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//java 코드를 쓰는 영역
	//jsp 파일에서는 우리가 원하는 모든 작업 가능 (DB 연결 > 실행 > 결과 > 화면 출력) > jsp (웹에서 필요한 모든 작업 가능)
	//jsp 장점 : 쉽다.
	//	  단점 : 분업화 힘들다, 유지보수 (모든 코드가 한곳에) >> 관심사가 분리 되어 있지 않는다.
	
	Date date = new Date();
	/*
		JSP 페이지 : UI(html + css + javascript) + JAVA코드(<% 스크립트릿 안에 구현)
		>> 디자인코드 + 서버의 로직코드 구현 : 문제점 > 협업, 유지보수 하기 어렵다
				
		servlet(형) > 웹 전용 java 파일 > jsp(동생)
		>>java 웹 기반 기술이 아니다. > 계산기, 그립판, 윈도우 프로그램(awt, swing) > 웹 전향(객체 : request, response)
		>>java 페이지 Web을 서비스 하자 > login.java > loinko.java (웹객체 상속...) > 웹에서 사용하는 자바(servlet)
		>>단점 : 배우기 어렵다, 디자인 작업 (힘들다), 협업(X)
		
			[ 서블릿에서 디자인 코드]
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<html>");
				out.print("<head><title>HELLO</title></head>");
				out.print("<body>");
					out.print("형재 날짜 : " + new Date() + "<br>");
					out.print("<script>alert('경고')</script");
				out.print("</body>");
			out.print("<html>");
		
		>> JSP 탄생 >> 장점 >> UI작업 >> web page >> html base >> 디자인 good >> 단점 java코드 <%....안에
		>> 현재 (JAVA + UI) >> 힘들어...
		
		정리)
		서로의 장점을 살리자 (현대적인 프로그래밍은 잘하는 것을 키워 주자, 업무의 효율) >> MVC 패턴 도입
		>> JSP(UI) + JAVA(순수한 자바 코드) + servlet(웹 요청, 응답 조정의 역할)
		분업 하자
		Model (DTO , DAO)	>> 순수한 JAVA
		View  (UI)			>> JSP
		Controller(중앙통제)  	>> Servlet
		
		MVC 패턴으로 현재까지 개발 되고 있다. >> 추가적으로 MSA 등등 나오고 있다.
		>> model1, model2
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
날짜 : <%=date %>
</body>
</html>