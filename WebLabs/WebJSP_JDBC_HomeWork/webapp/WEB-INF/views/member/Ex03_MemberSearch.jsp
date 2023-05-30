<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Simple Sidebar - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<c:choose>
		<c:when
			test="${sessionScope.userid == null || !sessionScope.userid == 'admin'}">
			<c:redirect url="login.do" />
		</c:when>
	</c:choose>
	<div class="d-flex" id="wrapper">
		<!-- Sidebar-->
		<jsp:include page="/WEB-INF/views/common/side.jsp" />
		<!-- Page content wrapper-->
		<div id="page-content-wrapper">
			<jsp:include page="/WEB-INF/views/common/nav.jsp" />
			<!-- Page content-->
			<table
				style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
				<tr>
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
										<td colspan='3'><b>[ ${requestScope.name} ] 조회결과가
												없습니다</b></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table> <a href="memberlist.do">회원 목록 페이지</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/scripts.js"></script>
</body>
</html>
