package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlanwriteController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

			ActionForward forward=new ActionForward();
			forward.setRedirect(false);
			 forward.setPath("./view/yeyag/planWrite.jsp");
			return forward;
		   }
}