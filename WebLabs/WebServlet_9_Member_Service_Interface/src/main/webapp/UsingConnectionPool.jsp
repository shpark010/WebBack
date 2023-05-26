<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Connection Pool 사용하기</title>
</head>
<body>
	<%
		//JNDI(java를 이름 기반으로 검색)
		Context context = new InitialContext();
		//현재 [프로젝트]에서 특정 이름을 가진 객체를 검색하겠다. -> 이름 기반 검색
		
		//Object 객체로 반환되기 때문에 DataSource 타입으로 캐스팅 해야 한다.
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); //lookup 함수안에 정해진 형식의 이름 제공
		//java:comp/env/ + 이름(jdbc/oracle)
		//튜브 가게에서 튜브를 가지고 왔다.(빌려왔다) -> 반드시 활용 후 반환해야 한다.
		
		//DB연결 객체 생성
		Connection conn = null;
		//튜브를 주세요
		conn = ds.getConnection();
		
		out.print("db연결여부(false) : " + conn.isClosed() + "<br>");
		
		//놀아요
		//집에가요
		//반환
		conn.close(); //자원 해제가 아니라 connection pool에 반환
		out.print("db연결여부(true) : " + conn.isClosed() + "<br>");
		
		//그래서 Pool 객체의 scope은 method 단위로 사용하고 반환해야 한다.
	%>
</body>
</html>