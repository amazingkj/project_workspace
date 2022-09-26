package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.dao.MemberDAOImpl;
import com.GolForYou.vo.MemberVO;

public class ChangePwdController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
	
		MemberDAOImpl mdao=new MemberDAOImpl();
		
		
		MemberVO old=mdao.getMember(id);
		String old_pw= old.getM_pw();
		
		request.setAttribute("old_pw", old_pw); 
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);//기존 매핑주소 값을 유지하고,속성키이름과 값도 유지한다.
		forward.setPath("./view/mypage/pwdChange.jsp");
		return forward;
	}

}
