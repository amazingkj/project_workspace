package com.GolForYou.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.dao.MemberDAOImpl;
import com.GolForYou.vo.MemberVO;

public class WithdrawalOKController implements Action {

	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		//로그인 이전과 이후를 구분
		
		
				response.setContentType("text/html;charset=UTF-8");
				//웹브라우저에 응답하는 문자/태그, 언어코딩 타입을 지정 
				PrintWriter out = response.getWriter(); //출력 스트림 out을 생성 
				HttpSession session=request.getSession();//서버에 작동되는 세션 객체 생성 
				String id =(String)session.getAttribute("id"); //세션 아이디를 구함 
				
				 if(id==null) {
					 out.println("<script>");
					 out.println("alert('다시 로그인 하세요!');");
					 out.println("location='Login.do';");
					 out.println("</script>");
				 }else {
					 
					 request.setCharacterEncoding("UTF-8");
					 
					 String del_pwd=request.getParameter("del_pwd");
					 String del_cont=request.getParameter("del_cont");
					 
					 MemberDAOImpl mdao = new MemberDAOImpl();
					 MemberVO db_pwd=mdao.getMember(id); //ID에 해당하는 비밀번호를 오라클로부터 가져옴
					 
					 if(!db_pwd.getM_pw().equals(del_pwd)) {
						 
						 out.println("<script>");
						 out.println("alert('비번이 다릅니다');");
						 out.println("history.go(-1);");
						 out.println("</script>");
						 System.out.println("비번이 다릅니다");
						 
					 }else {
						 
						 MemberVO dm=new MemberVO();
						 dm.setM_id(id); dm.setM_delcont(del_cont);
						 mdao.delMember(dm); //아이디를 기준으로 탈퇴사유, mem_state=2, 탈퇴 날짜를 수정되게 하면서 
						// 탈퇴 시킨다.
						 
						 session.invalidate(); //세션만료 -> 로그아웃
						 
						 out.println("<script>");
						 out.println("alert('회원 탈퇴 되었습니다.);");
						 out.println("window.close();");
						 out.println("</script>");
						 System.out.println("회원 탈퇴 되었습니다");
						 
					 }
				
			}
				 return null;
			}
	

}
