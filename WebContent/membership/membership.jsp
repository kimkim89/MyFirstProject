<%@page import="hotelgallery.hgalleryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotelgallery.hgalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Membership</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<link rel="stylesheet" href="../css/thumbnail-gallery.css">
<link href="../css/imgboard.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>

		<jsp:include page="../inc/top.jsp"/>
    
    <style type="text/css"> 
    #main_img {
	width:100%; 
	height: 100px; 
	background-image: url("");
	background-size: cover;
	vertical-align: middle;
	margin: 0 0 30px 0;
	padding: 0;
	position: relative;
	}

#main_img .content {
	font-family: Arial, Helvetica, sans-serif;
	text-align : center;
  position: absolute;
  bottom: 0px;
  background: rgb(0, 0, 0); /* Fallback color */
  background: lightgray;
  color: #f0f2f9;
  width: 100%;
  padding: 20px;
}

@media (min-width: 992px)
.col-md-4 {
    width: 30%;
 
}
    
</style>
</head>
<body>
        
<div class="container-fluid">
    <div class="row" style="height: 60px;">&nbsp;</div>
    <div class="row" id="main_img" style="margin-top: 5px;">
		  <div class="content">
		   <h1>Hotel the Moon Membership</h1>
		    <p class="page-description text-center">멤버십 가입을 통해 Hotel the Moon에서 제공하는 다양한 이벤트를 즐겨보세요!</p>
		  </div>
		
   		 </div>
</div>    

<%-- 메뉴바~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --%>

<center>
<div style="height: 50px;"></div>
		
		<div class="orchestra">
			<hr>
			<div class="orchestra1" style="background-color: white;">
				<div class="col-md-4">
						<img class="featurette-image img-responsive" src="../images1/orchestra.jpg"
							 style="width:400px; height: 250px;" alt="Generic placeholder image">
					<h2 class="orchestra1" style="font-size:medium;" >
						연 1회 연말 오케스트라 공연
					</h2>
				</div>
				<div class="col-md-4">
						<img class="featurette-image img-responsive" src="../images1/pool.jpg"
							 style="width:400px; height: 250px;" alt="Generic placeholder image">
					<h2 class="orchestra1" style="font-size:medium;" >
						프리미엄 수영장 이용
					</h2>
				</div>
				<div class="col-md-4">
						<img class="featurette-image img-responsive" src="../images1/golf.jpg"
							 style="width:400px; height: 250px;" alt="Generic placeholder image">
					<h2 class="orchestra1" style="font-size:medium;" >
						연 5회 무료 골프장 이용권
					</h2>
				</div>
				<div class="col-md-4">
						<img class="featurette-image img-responsive" src="../images1/piano_bar.jpg"
							 style="width:400px; height: 250px;" alt="Generic placeholder image">
					<h2 class="orchestra1" style="font-size:medium;" >
						멤버쉽 회원을 위한 피아노 바
					</h2>
				</div>
				<div class="col-md-4">
						<img class="featurette-image img-responsive" src="../images1/cookingclass.jpg"
							 style="width:400px; height: 250px;" alt="Generic placeholder image">
					<h2 class="orchestra1" style="font-size:medium;" >
						연 2회 특급호텔 쉐프와의 쿠킹 클래스
					</h2>
				</div>
				<div class="col-md-4">
						<img class="featurette-image img-responsive" src="../images1/spa.jpg"
							 style="width:400px; height: 250px;" alt="Generic placeholder image">
					<h2 class="orchestra1" style="font-size:medium;" >
						연 10회 스파 이용권 
					</h2>
				</div>
			</div>
			<hr class="featurette-divider"><br>
<!-- </center>	 -->




</body>
</html>