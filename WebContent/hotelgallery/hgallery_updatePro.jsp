<%@page import="hotelgallery.hgalleryDAO"%>
<%@page import="hotelgallery.hgalleryDTO"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

    ServletContext context = request.getServletContext();
    String imagePath = context.getRealPath("images_rooms");
    int size = 10*1024*1024;	
    String filename = "";
    int check = 0;
    
    try{
    	MultipartRequest multi = 
    			new MultipartRequest(request,imagePath,size,"UTF-8",new DefaultFileRenamePolicy());
    	
    	Enumeration files = multi.getFileNames();
    	String file = (String)files.nextElement();
    	filename = multi.getFilesystemName(file);
    	
    	hgalleryDTO hdto = new hgalleryDTO();
    	
    	hdto.setContent(multi.getParameter("content"));
    	hdto.setSubject(multi.getParameter("subject"));
    	hdto.setNum(Integer.parseInt(multi.getParameter("num")));
    	
    	
    	if(filename==null){
    		filename = multi.getParameter("filename");
    	}
    	
    	hdto.setFilename(filename);
    	
    	hgalleryDAO hDAO = new hgalleryDAO();

    	check = hDAO.updateBoard(hdto);
    	
    	
    }catch(Exception e){
    	System.out.println("수정실패"+e);
    }

   
  
	if(check == 1){
	%>
		<script type="text/javascript">
			alert("수정되었습니다.");
			location.href="hotelgallery.jsp";
		</script>
	<%		
		}else{
	%>
		<script type="text/javascript">
			alert("수정실패하였습니다.");
			history.back();
		</script>
	<%		
		}
	%>

	

</body>
</html>