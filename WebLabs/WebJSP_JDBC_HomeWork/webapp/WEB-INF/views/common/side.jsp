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
	<!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Main Menu</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="main.do">Main</a>
                    <c:choose>
						<c:when test="${sessionScope.userid != null}">
							<a class="list-group-item list-group-item-action list-group-item-light p-3" href="logout.do">Logout</a>
							<c:choose>
								<c:when test="${sessionScope.userid == 'admin'}">
									<a class="list-group-item list-group-item-action list-group-item-light p-3" href="memberlist.do">MemberList</a>
								</c:when>
							</c:choose>
						</c:when>
						<c:otherwise>
							<a class="list-group-item list-group-item-action list-group-item-light p-3" href="login.do">Login</a>
							<a class="list-group-item list-group-item-action list-group-item-light p-3" href="join.do">Register</a>
						</c:otherwise>
					</c:choose>
                </div>
            </div>
</body>
</html>