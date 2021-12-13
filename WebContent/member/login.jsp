<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1">
Add icon library
<link href="../css1/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/login.css" rel="stylesheet" type="text/css">
<link href="../css/bootstrap.css" rel="stylesheet" type="text/css"> -->


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Us</title>
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!--  -->

<style type="text/css">
/* Full-width input fields */
#mem_join_con input[type=text],#mem_join input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

 
</style>

</head>
<body>
	<jsp:include page="../inc/top.jsp" />
	
	
	<form action="loginPro.jsp"
		style="max-width: 400px; margin: 50px auto;">
		<h2 style="text-align: center;">로그인</h2>

		<div class="input-container">
			<i class="fa fa-user icon"></i> <input class="input-field"
				type="text" placeholder="Username" name="id" id="id">
		</div>

		<div class="input-container">
			<i class="fa fa-key icon"></i> <input class="input-field"
				type="password" placeholder="Password" name="passwd" id="passwd">
		</div>
		<button type="submit" class="btn-log">로그인</button>

		<br> <br>

		<div>
			<a href="member_confirm.jsp">ID/비밀번호 찾기</a>
		</div>
		<div>
			아직 회원이 아니신가요? <a href="join.jsp">회원가입 하러가기</a>
		</div>

	</form>
</body>
</html>