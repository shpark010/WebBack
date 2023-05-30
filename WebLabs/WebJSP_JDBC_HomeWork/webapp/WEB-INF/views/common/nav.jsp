<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Top navigation-->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mt-2 mt-lg-0">
					<li class="nav-item active"><a class="nav-link" href="main.do">Main</a></li>
					<c:choose>
						<c:when test="${sessionScope.userid != null}">
							<li class="nav-item active">
								<a class="nav-link" href='logout.do'><b>[${sessionScope.userid}]</b> [ 로그아웃 ]</a>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item active">
								<a class="nav-link" href='login.do'>[ 로그인 ]</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>