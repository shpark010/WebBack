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
						<form action="editok.do" method="post">

							<h3 style="text-align: center;">회원가입</h3>
							<div>
								<table
									style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
									<tr>
										<td>아이디</td>
										<td><input type="text" name="id"
											value="${requestScope.member.id}" readonly></td>
									</tr>
									<tr>
										<td>비번</td>
										<td>${requestScope.member.pwd }</td>
									</tr>
									<tr>
										<td>이름</td>
										<td><input type="text" name="name"
											value="${requestScope.member.name}"
											style="background-color: yellow"></td>
									</tr>
									<tr>
										<td>나이</td>
										<td><input type="text" name="age"
											value="${requestScope.member.age}"
											style="background-color: yellow"></td>
									</tr>
									<tr>
										<td>성별</td>
										<td>[${requestScope.member.gender}] <input type="radio"
											name="gender" id="gender" value="여"
											${requestScope.member.gender == '여' ? 'checked' : ''}>여자
											<input type="radio" name="gender" id="gender" value="남"
											${requestScope.member.gender == '남' ? 'checked' : ''}>남자
										</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td><input type="text" name="email"
											value="${requestScope.member.email}"
											style="background-color: yellow"></td>
									</tr>
									<tr>
										<td colspan="2"><input type="submit" value="수정하기">
											<a href='memberlist.do'>리스트이동</a></td>
								</table>

							</div>
						</form>
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
