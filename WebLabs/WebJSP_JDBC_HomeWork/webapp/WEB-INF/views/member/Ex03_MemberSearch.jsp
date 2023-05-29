<%@page import="kr.or.kosa.utils.Singleton_Helper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
if (session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin")) {
	//강제로 페이지 이동
	out.print("<script>location.href='login.do'</script>");
}

request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
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
			<td style="width: 200px"><jsp:include
					page="/WEB-INF/views/common/Left.jsp"></jsp:include></td>
			<td style="width: 700px">
				<table
					style="width: 400px; height: 100px; margin-left: auto; margin-right: auto">
					<tr>
						<th colspan="4">회원리스트</th>
					</tr>
					<c:choose>
						<c:when test="${requestScope.resultrow > 0}">
							<c:forEach var="member" items="${requestScope.memberlist}">
								<tr>
									<td>${member.id}</td>
									<td>${member.name }</td>
									<td>${member.email }</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan='3'><b>[ ${requestScope.name} ] 조회결과
										${requestScope.resultrow} 건 조회</b></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan='3'><b>[ ${requestScope.name} ] 조회결과가 없습니다</b></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table> <a href="memberlist.do">회원 목록 페이지</a>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include
					page="/WEB-INF/views/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
</html>