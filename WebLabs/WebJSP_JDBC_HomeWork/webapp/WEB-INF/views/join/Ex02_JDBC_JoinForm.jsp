<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#joinForm').submit(function() {
			//alert("가입");
			if ($('#id').val() == "") { // 아이디 검사
				alert('ID를 입력해 주세요.');
				$('#id').focus();
				return false;
			} else if ($('#pwd').val() == "") { // 비밀번호 검사
				alert('PWD를 입력해 주세요.');
				$('#pwd').focus();
				return false;
			} else if ($('#mname').val() == "") { // 이름 검사
				alert('mname를 입력해 주세요.');
				$('#mname').focus();
				return false;
			} else if ($('#age').val() == "") { // 나이 검사
				alert('age를 입력해 주세요.');
				$('#age').focus();
				return false;
			} else if ($('#email').val() == "") { // 우편번호
				alert('email를 입력해 주세요.');
				$('#email').focus();
				return false;
			}

		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/Check.jsp"/>
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
						<form action="joinok.do" method="post" name="joinForm"
							id="joinForm">
							<h3 style="text-align: center;">회원가입</h3>
							<div>
								<table
									style="width: 400px; height: 200px; margin-left: auto; margin-right: auto;">
									<tr>
										<th>ID:</th>
										<td><input type="text" name="id" id="id"></td>
									</tr>
									<tr>
										<th>PWD:</th>
										<td><input type="password" name="pwd" id="pwd"></td>
									</tr>
									<tr>
										<th>Name:</th>
										<td><input type="text" name="mname" id="mname"></td>
									</tr>
									<tr>
										<th>age:</th>
										<td><input type="text" name="age" id="age" maxlength="3"></td>
									</tr>
									<tr>
										<th>Gender:</th>
										<td><input type="radio" name="gender" id="gender"
											value="여" checked>여자 <input type="radio"
											name="gender" id="gender" value="남">남자</td>
									</tr>
									<tr>
										<th>Email:</th>
										<td><input type="text" name="email" id="email"></td>
									</tr>
									<tr>
										<td colspan="2"><input type="submit" value="회원가입">
											<input type="reset" value="취소"></td>
									</tr>
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
