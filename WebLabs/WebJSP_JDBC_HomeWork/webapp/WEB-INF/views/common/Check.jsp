<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${sessionScope.userid == null || !sessionScope.userid == 'admin'}">
		<c:redirect url="login.do"/>
	</c:when>
</c:choose>