<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 함수 관련 태그 라이브러리 -->
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  
https://www.hscripts.com/tutorials/jsp/jstltags/function-tag.php
-->
<c:set var="str" value="oracle" />
변수값 출력: ${str}<br>

<!-- 함수는 EL 안에서 사용해야한다. -->
<h3>함수 적용({안에서})</h3>
<!-- 대문자로 변환 -->
대문자 : ${fn:toUpperCase(str)}<br>
<!-- 문자열의 길이 -->
문자열길이 : ${fn:length(str)}<br>
<!-- 치환 -->
치환 : ${fn:replace(str,'a','AAAA')}<br>
</body>
</html>