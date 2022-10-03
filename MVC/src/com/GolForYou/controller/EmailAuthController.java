package com.GolForYou.controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.MemberDAOImpl;
import com.GolForYou.vo.MemberVO;

public class EmailAuthController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("jiin724@gmail.com", "vfhvmnugpqztgvkr");
			}
		});
		
		
	
		String receiver = request.getParameter("email") ; // 메일 받을 주소
		MemberDAOImpl md = new MemberDAOImpl();
		MemberVO pm=md.MailSender(receiver);
		String title = "GolForYou 계정 확인 메일.";
		
		
		String content = "<h2>안녕하세요 당신의 아이디는 "+pm.getM_id()+"<br>당신의 비밀번호는 "+pm.getM_pw()+"입니다.</h2>";
		
		Message message = new MimeMessage(session);
		
		try {
			message.setFrom(new InternetAddress("jiin724@gmail.com", "GolForYou관리자", "utf-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			message.setSubject(title);
			message.setContent(content, "text/html; charset=utf-8");

			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			 System.out.println("메일 전송에 실패하였습니다.");
			 System.out.println("실패 이유 : " + e.getMessage());
		}
		
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);//기본매핑주소를 유지하면서 뷰페이지로 이동
		forward.setPath("./view/member/findPwd_ok.jsp");//뷰페이지 경로 설정
		return forward;//리턴값을 null로 하면 해당 뷰페이지로 이동하지 않고 브라우저 화면이 하얗게 나온다.주의
	}
	
	

}
