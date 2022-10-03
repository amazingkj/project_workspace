package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class YeYagMain1Controller implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		 forward.setPath("./view/yeyag/YeYag_Main1.jsp");
		return forward;
	   }

	}