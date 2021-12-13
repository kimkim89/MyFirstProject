<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>

<%!
public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
  PasswordAuthentication pa;
  public MyAuthentication(){
    pa=new PasswordAuthentication("hotelthemoon11@gmail.com","moon2020!");        
  }
  @Override
  protected PasswordAuthentication getPasswordAuthentication() {
    return pa;
  }
}
%>


<%
 // SMTP 서버 주소
 String smtpHost = "smtp.gmail.com";


 //받는 사람의 정보
 String toEmail = "hotelthemoon11@gmail.com";


 //보내는 사람의 정보
 String fromName = "Hotel the Moon";
 String fromEmail = "hotelthemoon11@gmail.com";
 
 try {
  Properties props = new Properties();
props.put("mail.smtp.user", fromEmail);
props.put("mail.smtp.host", "smtp.googlemail.com");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");

  // 메일 인증
  Authenticator myauth=new MyAuthentication(); 
  Session sess=Session.getInstance(props, myauth);


  InternetAddress addr = new InternetAddress();
  addr.setPersonal(fromName,"UTF-8");
  addr.setAddress(fromEmail);

  
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html; charset=UTF-8");
  
  String contactUs = request.getParameter("name") + "<br>";
  		 contactUs += request.getParameter("phone") + "<br>";
  		 contactUs += request.getParameter("email") + "<br>";
  		 contactUs += request.getParameter("subject") + "<br>";
  		 contactUs += request.getParameter("content") + "<br>";
  

  Message msg = new MimeMessage(sess);
  msg.setFrom(addr);         
  msg.setSubject(MimeUtility.encodeText("이메일 제목", "utf-8","B"));
  msg.setContent(contactUs, "text/html;charset=utf-8");
  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

 

  Transport.send(msg);
	out.println("<script>");
	out.println("alert('메일이 성공적으로 발송되었습니다!')");
	out.println("location.href='../index.jsp'");
	out.println("</script>");
  


 } catch (Exception e) {
	 out.println("<script>alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');</script>");
	 e.printStackTrace();
  return;
 }
 
 

 
%>
