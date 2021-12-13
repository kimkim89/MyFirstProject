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
<title>Rooms Gallery</title>
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
		
		
    <script type="text/javascript">
    	function del(num) {
    		 if(confirm("정말 삭제하시겠습니까?")==true){
    			 location.href="hgallery_delete.jsp?num="+num;
    		 }else{
    			 return;
    		 }
 		
    	}

    </script>	
    
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
</style>
</head>

<%
	request.setCharacterEncoding("UTF-8");

	//전체 글개수 검색을 위해 BoardDAO객체 생성
	hgalleryDAO roomsdao = new hgalleryDAO();

	//전체 글 개수 검색해서 얻기
	int count = roomsdao.getBoardCount();
	int totalNum = 0;
	
	ArrayList list = null;
	
	if(count>0){
		list  = roomsdao.getBoardList();
		totalNum = list.size();
	}
	String id = (String)session.getAttribute("id");
	
	
	int numPerPage = 6;
	int pagePerBlock = 3; 

	int totalPage = 0; 
	int totalBlock = 0;
	int nowPage = 0;
	int nowBlock = 0; 
	int startPerPage = 0; 
	
	
	
	totalPage =  (int)Math.ceil((double)totalNum / numPerPage); 

	totalBlock =  (int)Math.ceil((double)totalPage / pagePerBlock); 
	
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));

	}

	if(request.getParameter("nowBlock") != null){

		nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
	}

	startPerPage = nowPage * numPerPage;
%>

<body>


        
<div class="container-fluid">
    <div class="row" style="height: 60px;">&nbsp;</div>
    <div class="row" id="main_img" style="margin-top: 5px;">
		  <div class="content">
		   <h1>Hotel Gallery</h1>
		    <p class="page-description text-center">Hotel the Moon의 호텔 내부 및 외부 모습입니다.</p>
		  </div>
		
   		 </div>
</div>    


 <div class="container gallery-container">   

    <%
       	if(id != null){
       %>
    <br><br>
  <button class="button" onclick="location.href='write.jsp'"><span>글쓰기 </span></button>  
  <%
    	}
    %>
    <div class="tz-gallery">

        <div class="row">
        
<%
        	//만약에 게시판의 글이 있다면 
                	if(count > 0){
                		for(int cnt=startPerPage; cnt<(startPerPage + numPerPage); cnt++){
                	if(cnt == totalNum){
                		break;
                	}	
                	hgalleryDTO roomsdto = (hgalleryDTO)list.get(cnt);
                	String filename=roomsdto.getFilename();
        %>  
			

            <div class="col-sm-6 col-md-4">
                <div class="card">
                        <a class="lightbox" href="../images_rooms/<%=roomsdto.getFilename()%>">
                        <img src="<%=request.getContextPath()%>/images_rooms/<%=roomsdto.getFilename()%>">
                    </a>
                    <div class="caption">
                        <h3><%=roomsdto.getSubject() %></h3>
                        <p><%=roomsdto.getContent().replace("\n","<br/>") %></p>
                    </div>
                <div>
                <% 
                	if(id==null){
                %>
               &nbsp;
                	
                <%		
                	}
	        	else if(id.equals(roomsdto.getName())){
	        		
                %>	
                	    	
                	
                	
                	<a href="hgallery_update.jsp?num=<%=roomsdto.getNum()%>" src="../images_rooms/<%=roomsdto.getFilename() %>">수정</a>
                	<a href="#" onclick="del(<%=roomsdto.getNum()%>); return false;">삭제</a> &nbsp;
                	<a href="../member/LikesPro.jsp?lnum=<%=roomsdto.getNum()%>&board=imgboard">
   					<i class="fa fa-heart" style="font-size:15px;color:#ff6060"></i></a> 
                	
                <%
                	}else{
                %>		
               		<a href="../member/LikesPro.jsp?lnum=<%=roomsdto.getNum()%>&board=imgboard">
   					<i class="fa fa-heart" style="font-size:15px;color:#ff6060"></i></a> 
    			
    			<%		
                	}
                %>	
                	
                	  
                	  
                	  
                	  
                	  </div>    
                </div>
            </div>
            
<%
		}			
		
	}else{//게시판에 글이 없다면
%>

	<div class="col-md-4">
              <h1>게시글 없음</h1>
            </div>

<%		
	}

%>


        </div>

<div class="pagination">
			
			<%	
				if(totalBlock > 0){
					
					if(nowBlock > 0){
			%>			
				<a href="hotelgallery.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>">
					&laquo;
					</a>
			<%			
					}
			}
			%>

			<%
			  
			  for(int cnt=0; cnt<pagePerBlock; cnt++){
					
					if((nowBlock*pagePerBlock) + cnt == totalPage){
						break;
					}		
			  
			  		
			%>		
					<%--페이지 번호 링크  --%>
					<a href="hgallery.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock)+cnt%>">			
						<%=(nowBlock * pagePerBlock) + 1 + cnt %>	
					</a>					
			<%
					if( ((nowBlock*pagePerBlock) + 1 + cnt) == totalNum ){
						break;
					}			
				}
			  %>
				
 				<%
				
				if(totalBlock > nowBlock + 1){
			%>	
				 <a href="hgallery.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>">
				  &raquo;
				 </a>
			<%
				}
				%>
							
		</div>

    </div>
    

    

</div>



   <footer class="text-muted">
      <div class="container">
          <a href="#" style="font-size: 15px; color: #223055; font-weight: bold;">Back to top</a>   
          <br><br>     
      </div>
    </footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
<script>
    baguetteBox.run('.tz-gallery');
</script>
</body>
</html>