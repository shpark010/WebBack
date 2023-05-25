<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 서버쪽 데이터를 클라이언트에 뿌려줄때 포메팅 관련 태그 라이브러리를 선언하고 fmt 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Fmt 포맷관련</title>
</head>
<body>
<!--  포메팅 관련 참고 주소 : https://cafe.naver.com/erpzone/866 -->
 <h3>숫자관련</h3>
 변수선언 : <c:set var="price" value="1000000"></c:set><br>
 변수값 출력:${price}<br>

<!-- formatNumber : 숫자데이터를 형식 문자로 --> 
<!-- 해석의 주체는 WAS이고 클라이언트는 해석된 값을 출력할 뿐이다. -->
 <fmt:formatNumber value="${price}" type="number" /><br>
 <!--  -->
 <fmt:formatNumber value="50000000" type="currency" currencySymbol="$" /><br>
 <fmt:formatNumber value="0.13"     type="percent"/>
 변수에 설정 <br>
 <!-- 변환된 결과를 변수에 담을 수 있다. -->
 <fmt:formatNumber value="123456789" pattern="###,###,###" var="pdata" />
 변수에 설정한 값 : ${pdata}<br>
 
 <hr>
 <h3>날짜 관련 format</h3>
 <!-- 날짜 데이터를 형식 문자로 변환 -->
 변수선언 : <c:set var="now" value="<%= new Date() %>" /><br>
 변수값 : ${now}<br>
 <!-- 2023. 5. 25. -->
 Basic Date : <fmt:formatDate value="${now}" type="date" /><br>
 <!-- 2023년 5월 25일 목요일 -->
 DateStyle(full) : <fmt:formatDate value="${now}" type="date" dateStyle="full" /><br>
 <!-- 23. 5. 25. -->
 DateStyle(short) : <fmt:formatDate value="${now}" type="date" dateStyle="short" /><br>
 <!-- 9:17:50 -->
 시간:<fmt:formatDate value="${now}" type="time"/><br>
 <!-- 2023. 5. 25. 오전 9:17:50 -->
 <!-- both : 날짜 + 시간 -->
 날짜 + 시간:<fmt:formatDate value="${now}" type="both"/><br>
 <!-- 2023년 5월 25일 목요일 오전 9시 17분 50초 대한민국 표준시 -->
 혼합:<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" /><br>
 <!-- 23. 5. 25. 오전 9:17 -->
 혼합2:<fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short" /><br>
</body>
</html>