<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>SimpleController에서 request를 통해 전달된 데이터를 출력</h3>
	결과출력 : <%=request.getAttribute("result")%>
</body>
</html>