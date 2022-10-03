package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminMainController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 ActionForward forward=new ActionForward();
		    forward.setRedirect(false);//속성키이름 값과 기존매핑주소를 유지 하면서 해당 뷰페이지로 이동
		    forward.setPath("./view/admin/admin_main.jsp");
			return forward;
			
		
	}

}
