<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: solid 2px black;
	border-collapse: collapse;
}

tr {
	border: solid 1px blue;
	background-color: white;
	color: black;
}

td {
	border: solid 1px red;
}
</style>
</head>
<body>
	<table
		style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="2"><jsp:include
					page="/WEB-INF/views/common/Top.jsp"></jsp:include></td>
		</tr>
		<tr>
			<td style="width: 200px">
				<jsp:include page="/WEB-INF/views/common/Left.jsp"></jsp:include>
			</td>
			<td style="width: 700px">
				<c:choose>
						<c:when test="${sessionScope.userid != null}">
							${sessionScope.userid} 회원님 방가방가^^<br>
							<c:if test="${sessionScope.userid == 'admin'}">
								<a href="memberlist.do">회원관리</a>
							</c:if>
						</c:when>
						<c:otherwise>
							사이트 방문을 환영합니다 ^^ <br>회원가입 좀 하지 ...
						</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include
					page="/WEB-INF/views/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>


