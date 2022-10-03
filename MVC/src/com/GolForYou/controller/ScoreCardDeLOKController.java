package com.GolForYou.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.vo.SCBoardVO;
import com.GolForYou.dao.SCBoardDAO;

public class ScoreCardDeLOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		
		int sc_no = Integer.parseInt(request.getParameter("sc_no"));
		String sc_playdate = request.getParameter("sc_playdate");
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		HttpSession session = request.getSession();
		String sc_id = (String)session.getAttribute("id");
		
		SCBoardVO sb = new SCBoardVO();
		sb.setSc_no(sc_no);
		sb.setSc_id(sc_id);
		sb.setSc_playdate(sc_playdate);
		
		SCBoardDAO sbdao = new SCBoardDAO();
		
		sbdao.delBoard(sb);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("scorecard_list.do?page="+page);
		
		return forward;
	}

}
