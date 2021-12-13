<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<jsp:include page="../inc/top.jsp" />

	<h3 style="text-align: center; margin-top: 100px;">본인인증을 위해 이름과 E-mail주소를 입력해주세요</h3>

	<form action="member_confirmPro.jsp"
		style="max-width: 500px; margin: 50px auto;">
		<div class="input-container">
			<span class="log-span" style="min-width:50px; padding:15px 15px 15px 21px !important;">Name</span> 
			<input class="input-field" type="text" placeholder="이름를 입력해주세요" name="name">
		</div>
		<div class="input-container">
			<span class="log-span" style="min-width:50px; padding: 15px !important;">E-mail</span>
			<input class="input-field" type="text" placeholder="가입하신 Email주소를 입력해주세요" name="email">
		</div>
		<button type="submit" class="btn-log">입력</button>

	</form>
</body>
</html>