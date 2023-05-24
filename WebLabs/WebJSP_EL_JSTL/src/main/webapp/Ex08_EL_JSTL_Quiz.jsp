<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//list.do?id=kglim&pwd=1004
	//list.do?id=kglim&pwd=1004&hobby=농구&hobby=야구&hobby=당구
	
	//String[] hobbys = request.getParameterValues("hobby");
	
	//EL > ${param.id} ${param.pwd} ${paramValues.hobby}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		hobby 다중값을 받아서 choose 구문을 사용하여 값이 하나도 선택되지 않았다면
		"선택을 하세요" 라는 문자를 출력하고
		값이 하나라도 넘어 왓다면 ... <ul><li>java</li><li>oracle</li></ul> 과 같은 형식으로
		출력하도록 forEach 를 작성하세요
		추가사항) 출력시 값-index-count 형식으로 나오게 출력하세요
	 -->
	 <h3>EL 다중값 처리</h3>
	 <c:choose>
	 	<c:when test="${not empty paramValues.hobby}">
	 	당신의 선택은
		 <ul>
		 	<c:forEach var="hobby" items="${paramValues.hobby}" varStatus="status">
		 			<li>${hobby} - ${status.index} - ${status.count}</li>
	 		</c:forEach>
		 </ul>
	 	</c:when>
	 	<c:otherwise>
	 		선택을 하세요<br>
	 	</c:otherwise>
	 </c:choose>
</body>
</html>