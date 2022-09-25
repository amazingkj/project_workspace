package com.GolForYou.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//로그인 인증 이후 메인화면으로 이동
public class IndexController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		
	
		    ActionForward forward=new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("./view/member/index.jsp");
		    return forward;
		
	}
}





