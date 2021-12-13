<%@page import="member.MemberDAO"%>
<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOIN</title>
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">



<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<style type="text/css">
	#mem_up_con form span{
		color: #ff6666;
		font-size: 12px;
	}
	
	</style>


<body id="mem_up">


<jsp:include page="../inc/top.jsp"></jsp:include>

<h2 style="text-align: center; margin-top: 70px;">회원정보 수정</h2>

<br><br>

<div class="container-fluid">
<div class="row" id="mem_up_row">
<div class="col-md-8 col-md-offset-2">

    <div id="mem_up_con" style="margin: 0 500px 0 500px;">
      <form action="memberUpdatePro.jsp" name="fo">
      
        <div class="row">
 <%
 String id = (String)session.getAttribute("id");

	MemberDAO mdao = new MemberDAO();
	
	MemberDTO mdto = mdao.getMember(id);
	
	String zipcode = "";
	String address1 = "";
	String address2 = "";
	
	if(mdto.getZipcode() != null ) zipcode = mdto.getZipcode();
	
	if(mdto.getAddress1() != null) address1 = mdto.getAddress1();
	
	if(mdto.getAddress2() != null) address2 = mdto.getAddress2();
	
	
%>

	

            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> ID</label>
            <input type="text" id="id" name="id" value="<%=mdto.getId()%>" readonly="readonly">
            <label for="pass"><i class="fa fa-lock"></i> Password
            <span id="pass_sp1"> *비밀번호는 4~12자의 영문 대소문자와 숫자만 가능합니다 <br/></span>
    		<span id="pass_sp2"> *비밀번호에는 하나이상의 문자와 숫자가 포함되어야 합니다.</span> </label>
            <input type="password" id="pass" name="passwd" value="<%=mdto.getPasswd()%>" >
            <label for="password"><i class="fa fa-lock"></i> Password 확인
            <span id="pass_sp3"> *비밀번호가 다릅니다.</span> </label>
            <input type="password" id="pass-repeat" name="password2" >
            <label for="name"><i class="fa fa-smile-o"></i> Name
            <span id="name_sp"> *이름은 2자 이상의 문자만 입력할 수 있습니다.</span></label>
            <input type="text" id="name" name="name" value="<%=mdto.getName()%>">
            <label for="phone"><i class="glyphicon glyphicon-phone"></i>  Phone
            <span id="ph_sp"> *전화번호 형식이 잘못되었습니다.</span></label>
            <input type="text" id="phone" name="phone" value="<%=mdto.getPhone()%>">
            <label for="email"><i class="fa fa-envelope"></i> Email
            <span id="email_sp"> *이메일 형식이 잘못되었습니다.</span></label>
            <input type="text" id="email" name="email" value="<%=mdto.getEmail()%>">
            <input type="text" id="sample6_postcode" placeholder="우편번호" readonly="readonly" name="zipcode" value="<%=zipcode%>" style="width: 50%"> &nbsp; 
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="postcode_btn" >
			<input type="text" id="sample6_address" placeholder="주소" readonly="readonly" name="address1" value="<%=address1%>">
			<input type="text" id="sample6_address2" placeholder="상세주소" name="address2" value="<%=address2%>">

         </div>

        <input type="button" value="수정하기" class="btn" id="btn" onclick="chekValue(); return false;" style="margin-left: 4%;"> 
        &nbsp;<input type="button" onclick="del(); return false;" value="탈퇴하기" class="btn" id="btn2">

      </form>
    </div>
    <script type="text/javascript">


	if(id==null){%>
	<script type="text/javascript">
		alert("로그인이 필요한 서비스입니다.");
		location.href="login.jsp";
	</script>


<script type="text/javascript">
$(document).ready(function() {
	
	var getName= RegExp(/^[A-Za-z가-힣]{2}/);
	var re = RegExp(/[a-zA-Z0-9]{4,12}$/);
	var getPass = RegExp(/[a-zA-Z]{1}[0-9]{1}/);
	var re2 = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	var getPhone = RegExp(/^(010|011)[-\s]?\d{3,4}[-\s]?\d{4}$/);
	var getEmail = RegExp(/^[\w\.-]{1,64}@[\w\.-]{1,252}\.\w{2,4}$/);	
	var getBirth = RegExp(/^[0-9]{2}[0,1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/);
	
	
	$("#pass_sp1").hide()
	$("#pass_sp2").hide()
	$("#pass_sp3").hide()
	$("#name_sp").hide()
	$("#ph_sp").hide()
	$("#email_sp").hide()
	$("#birth_sp").hide()

	
	$("#pass").blur(function() {
		 if(!re.test($("#pass").val())){
			 $("#pass_sp1").show('fast');
			 $("#pass").val("");
		 }else{$("#pass_sp1").hide('fast');}
	 
		 if(!getPass.test($("#pass").val())){
			 $("#pass_sp2").show('fast');
			 $("#pass").val("");
		 }else{$("#pass_sp2").hide('fast');}
	
	});//pass
	
	$("#pass-repeat").blur(function() {
		var pass1 = $("#pass").val();
		var pass2 = $("#pass-repeat").val();
		 if(pass1!=pass2){
			 $("#pass_sp3").show('fast');
			 $("#pass-repeat").val("");
		 }else{$("#pass_sp3").hide('fast');}
	
	});//pass

	
	$("#name").blur(function() {		
		 if(!getName.test($("#name").val())){
			 $("#name_sp").show('fast');
			 $("#name").val("");
		 }else{$("#name_sp").hide('fast');} 
	});//name

	$("#phone").blur(function() {	
		 if(!getPhone.test($("#phone").val())){
			 $("#ph_sp").show('fast');
			 $("#phone").val("");
		 }else{$("#ph_sp").hide('fast');} 	 
	});//phone
	
	$("#email").blur(function() {	
		 if(!getEmail.test($("#email").val())){
			 $("#email_sp").show('fast');
			 $("#email").val("");
		 }else{$("#email_sp").hide('fast');} 	 
	});//email
	
	$("#birth").blur(function() {	
		 if(!getBirth.test($("#birth").val())){
			 $("#birth_sp").show('fast');
			 $("#birth").val("");
		 }else{$("#birth_sp").hide('fast');} 	 
	});//birth
	
});


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}


function del() {
	 if(confirm("정말 탈퇴하시겠습니까?")==true){
		 location.href="member_delete.jsp"
	 }else{
		 return;
	 }
	
	
}


function chekValue() {
	
	if(!fo.pass.value){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	
	if(!fo.name.value){
		alert("이름을 입력해주세요");
		return false;
	}
	
	if(!fo.phone.value){
		alert("전화번호를 입력해주세요");
		return false;
	}
	
	if(!fo.email.value){
		alert("이메일을 입력해주세요");
		return false;
	}
	
	else{
		document.fo.submit();
	}
}



</script>

</div>
</div>
</div>
</body>
</html>