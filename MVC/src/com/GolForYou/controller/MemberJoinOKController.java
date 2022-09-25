package com.GolForYou.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.MemberDAOImpl;
import com.GolForYou.vo.MemberVO;


public class MemberJoinOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_phone = request.getParameter("m_phone");
		String m_email = request.getParameter("m_email");
		String m_gender = request.getParameter("m_gender");
		//String m_date = multi.getParameter("sysdate");
		

		MemberVO m=new MemberVO();
		
	     m.setM_id(m_id); m.setM_pw(m_pw); m.setM_phone(m_phone); 
	     m.setM_email(m_email); m.setM_gender(m_gender); 
	     //m.getM_date();
	     
	     MemberDAOImpl mdao=new MemberDAOImpl();
	     int re=mdao.insertMember(m);//회원 저장
	     
	     if(re==1) {
	    	 ActionForward forward=new ActionForward();
	    	 forward.setRedirect(true);//새로운 매핑주소로 이동
	    	 forward.setPath("login.do");
	    	 return forward;
	     }
		return null;
	}
}







