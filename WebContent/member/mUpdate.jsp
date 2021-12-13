<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>

<body >
<div class="container-fluid">
<div class="row" id="mUp_div">
<div class="col-md-8 col-md-offset-2" id="mUp_div2">

<h3>회원정보 수정을 위해 비밀번호를 입력해주세요</h3>
<br><br>
<form action="mUpdatePro.jsp" id="mUp_form">
<input type="password" name="passwd" id="mUp_pass"> <br>
<button type="submit" id="mUp_btn">확인</button>
</form>
</div>
</div>
</div>
</body>
</html>