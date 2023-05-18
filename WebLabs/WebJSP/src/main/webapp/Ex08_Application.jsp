<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
webproject 생성 >> Template 구조 >> WEB-INF >> web.xml 제공 (웹어플리케이션 전체 환경설정)

web.xml (서버가 시작되면 제일 loading 되고 해석되고 실행)
<welcome-file>index.html</welcom-file> 웹 사이트 기본 페이지 설정
ex) http://192.168.0.166:8090/WebJSP/ 엔터 하면 > 페이지 서비스 > default 페이지 구성 ....

/WebJSP >> 웹 프로젝트 이름 , 가상 디렉토리 , context root (문맥 , 흐름 , 전체)
웹 경로 (가상경로) : http://192.168.0.166:8090/WebJSP
>>실경로 : C:\Duzon\Web\WebBack\WebLabs\WebJSP\src\main\webapp 안에 자원을 서비스 하겠다.

서비스 자원 : html, htm, css, js, json, tst, jsp

>>생성하는 모든 자원은 scope
>>a.jsp > <% String s = "A" >> s변수는 a.jsp 안에서만 유효
>>b.jsp > <% String s = "A" >> s변수는 b.jsp 안에서만 유효
>>c.jsp > <% String s = "A" >> s변수는 c.jsp 안에서만 유효

a.jsp , b.jsp , c.jsp 페이지에서 공유하는 자원은 ?
답이 web.xml : 환경설정 파일 > 서버가 시작되면 > 가장 먼저 해석되고 loading

<context-param>
	<description>설명 : 개발자 마음.. 변수 : email 값 : kosa@kosa.or.kr</description>
	<param-name>eamil</param-name>
	<param-value>kosa@kosa.or.kr</param-value>
</context-param>

web.xml 자원에 접근 방법
Application 객체 (WAS 제공)
Application >> web.xml 접근 >> 자원 read 가능

Web Applicatoin을 생성하면 >> WEB-INF 폴더를 제공받는다 >> lib(.jar파일 : 라이브러리)
											   >> web.xml (환경설정파일)
WEB-INF 보안폴더 : Client가 접근하게 되면 '업는 페이지'를 리턴 (접근 불가)

http://192.168.0.166:8090/WebJSP/WEB-INF/web.xml 엔터 서버는 404 전달

WEB-INF >> views >> member >> register.jsp 등등
				 >> admin  >> admin.jsp
클라이언트 직접 보아서는 안되는 페이지는 보안폴더에 숨김 ....^^
include , forward 이런 방식으로 ... 보여준다.
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Application 객체(WAS 제공)</h3>
	<%
		String param = application.getInitParameter("eamil");
		out.println("<h3>" + param + "</h3>");
		
		out.println("<hr>");
		
		String param2 = application.getInitParameter("filepath");
		out.println("<h3>" + param2 + "</h3>");
	%>
</body>
</html>