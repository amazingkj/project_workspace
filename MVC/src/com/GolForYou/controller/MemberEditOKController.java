package com.GolForYou.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.dao.MemberDAOImpl;
import com.GolForYou.vo.MemberVO;

public class MemberEditOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		if(id==null) {
			//로그아웃 된 경우  
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!);");
			out.println("location='member_login.do';");
			out.println("</script>");
			
		}else {
			request.setCharacterEncoding("UTF-8");//post 방식으로 이동 될때 꼭 넣어줄 것, 한글 데이터를 안깨지게 한다. 
		
			
			String m_id = request.getParameter("m_id");
			String m_pw = request.getParameter("m_pw");
			String m_phone = request.getParameter("m_phone");
			String m_email = request.getParameter("m_email");
			String m_gender = request.getParameter("m_gender");
			//String m_date = multi.getParameter("sysdate");
			
			
			MemberDAOImpl mdao=new MemberDAOImpl();
			MemberVO m=new MemberVO(); //기준이 되는 아이디 , 아이디는 수정할 값이 아니다.
			
		     m.setM_id(id); m.setM_pw(m_pw); m.setM_phone(m_phone); 
		     m.setM_email(m_email); m.setM_gender(m_gender); 
		     //m.getM_date();
			
		       mdao.updateMember(m); //회원정보 수정
		         
		         out.println("<script>");
		         out.println("alert('회원정보 수정완료');");
		         out.println("location='member_edit.do';");
		         out.println("</script>");

			
			
	}
		return null;
	}

}
