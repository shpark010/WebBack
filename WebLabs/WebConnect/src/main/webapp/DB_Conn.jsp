<%@page import="Utils.SingletonHelper"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = null;
conn = SingletonHelper.getConnection("oracle");
System.out.println(conn.toString());
System.out.println(conn.getMetaData().getDatabaseProductName());
System.out.println(conn.getMetaData().getDatabaseProductVersion());
System.out.println(conn.isClosed());

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>