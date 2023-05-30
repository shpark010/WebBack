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
							style="width: 400px; height: 100px; margin-left: auto; margin-right: auto;">
							<tr>
								<td style="width: 100px">아이디</td>
								<td style="width: 100px">${requestScope.member.id}</td>
							</tr>
							<tr>
								<td style="width: 100px">비번</td>
								<td style="width: 100px">${requestScope.member.pwd}</td>
							</tr>
							<tr>
								<td style="width: 100px">이름</td>
								<td style="width: 100px">${requestScope.member.name}</td>
							</tr>
							<tr>
								<td style="width: 100px">나이</td>
								<td style="width: 100px">${requestScope.member.age}</td>
							</tr>
							<tr>
								<td style="width: 100px">성별</td>
								<td style="width: 100px">${requestScope.member.gender}</td>
							</tr>
							<tr>
								<td style="width: 100px">이메일</td>
								<td style="width: 100px">${requestScope.member.email}</td>
							</tr>
							<tr>
								<td colspan="2"><a href="memberlist.do">목록가기</a></td>
							</tr>
						</table>
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
