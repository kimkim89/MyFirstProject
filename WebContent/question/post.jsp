<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Q/A Board</title>
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../css/reviewboard.css" rel="stylesheet" type="text/css">


<script type="text/javascript">

function checkValue() {
	
	if(!fr.pass.value){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	
	if(!fr.subject.value){
		alert("제목을 입력해주세요");
		return false;
	}
	
	if(!fr.content.value){
		alert("내용을 입력해주세요");
		return false;
	}
	
	else{
		document.fr.submit();
	}
}
</script>
</head>
<body>

<jsp:include page="../inc/top.jsp"></jsp:include>

	
	<h2 style="margin-top: 100px; text-align:center;" >Q/A 게시판</h2>
	
<%
String writerID = (String)session.getAttribute("id");
if(writerID != null){

%>

	<div class="container" style="width: 60%; margin: 0 auto;">
	  <form action="postPro.jsp" name="fr">
	    <div class="row">
	      <div class="col-20">
	        <label for="name">ID</label>
	      </div>
	      <div class="col-30-1">
	        <input type="text" id="name" name="writerID"  readonly="readonly" value="<%=writerID%>">
	      </div>
	      <div class="col-20">
	        <label for="pass">Password</label>
	      </div>
	      <div class="col-30-1">
	        <input type="password" id="pass" name="pass">
	      </div>	      
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="subject">Subject</label>
	      </div>
	      <div class="col-80">
	        <input type="text" id="subject" name="subject" placeholder="제목을 입력하세요">
	      </div>
	    </div>
	    <div class="row">
	      <div class="col-20">
	        <label for="content">Content</label>
	      </div>
	      <div class="col-80">
	        <textarea id="content" name="content" placeholder="글 내용을 입력하세요" style="height:300px"></textarea>
	      </div>
	      <div class="col-20" style="margin: 20px 0;"></div>
	         
	    </div>
	    <br><br>
	    <div class="row" style="margin: -41px 37px -2px 888px;">	       	
	    	<input type="submit" id="rv-button" onclick="checkValue(); return false;" value="글 쓰기" style="margin: -23px 10px 0px 0px;"/>
	    	<input type="reset" id="rv-button" value="다시 작성" style="margin: -23px 10px 0px 0px;"/> 
	    </div>
	  </form>
	</div>
<%
}else{
%>	
	<script type="text/javascript">
		alert("회원만 사용할 수 있는 서비스입니다.");
		location.href="../member/login.jsp";
	</script>	
	
<%	
}

%>


</body>
</html>