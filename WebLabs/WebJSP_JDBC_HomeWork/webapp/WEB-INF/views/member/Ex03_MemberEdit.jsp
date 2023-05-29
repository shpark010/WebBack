<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.or.kosa.utils.Singleton_Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	/* 
	회원정보 수정하기
	1.DB 쿼리 : 2개 (수정정보 : select , 수정정보반영 : update)
	 1.1 : select * from koreamember where id=?
	 1.2 : update koreamember set ename=? where id=?		 
	2.화면 1개(기존에 입력내용 보여주는 것)-> 처리 1개 (수정처리)
	 2.1  DB select 한 결과 화면 출력 
	   <input type="text" value="rs.getString(id)">
	      수정안하고 .. 화면 .. 전송(x) : <td>rs.getString("id")</td>
	      수정안하고 .. 화면 .. 전송   : <input type="text" value="rs.getString(id)" readonly>
	      수정하고 ..화면  ..전송   :  <input type="text" value="rs.getString(id)">
	
	*/
	if(session.getAttribute("userid") == null || !session.getAttribute("userid").equals("admin") ){
		//강제로 페이지 이동
		out.print("<script>location.href='Ex02_JDBC_Login.jsp'</script>");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
									value="${requestScope.member.name}" style="background-color: yellow">
								</td>
							</tr>
							<tr>
								<td>나이</td>
								<td><input type="text" name="age"
									value="${requestScope.member.age}" style="background-color: yellow">
								</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>[${requestScope.member.gender}]
									<input type="radio" value="여" id="female" > 여자
									<input type="radio" value="남" id="male" ${requestScope.member.gender == '남' ? 'checked' : ''}> 남자
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email"
									value="${requestScope.member.email}" style="background-color: yellow">
								</td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="수정하기">
									<a href='memberlist.do'>리스트이동</a></td>
						</table>

					</div>
				</form>
			</td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include
					page="/WEB-INF/views/common/Bottom.jsp"></jsp:include></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	let female = document.getElementById('female');
	let male = document.getElementById('male');
	
	// 이벤트 리스너 추가
	female.addEventListener('click', handleRadioChange());
	male.addEventListener('click', handleRadioChange());
	
	// 라디오 버튼 변경 시 처리하는 함수
	function handleRadioChange() {
	  // 선택된 버튼 확인
	  if (female.checked) {
		  male.checked = false; // male 선택 해제
	  } else if (male.checked) {
		  female.checked = false; // female 선택 해제
	  }
	}
</script>
</html>
