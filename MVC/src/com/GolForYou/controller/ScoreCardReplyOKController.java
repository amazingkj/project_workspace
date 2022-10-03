package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.vo.SCBoardVO;
import com.GolForYou.dao.SCBoardDAO;

public class ScoreCardReplyOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		//�亯�� ���簪 3��
		int sc_ref = Integer.parseInt(request.getParameter("sc_ref"));
		int sc_step = Integer.parseInt(request.getParameter("sc_step"));
		int sc_level = Integer.parseInt(request.getParameter("sc_level"));
		
		int page = Integer.parseInt(request.getParameter("page"));
		
		SCBoardVO sb = new SCBoardVO();
		
		String sc_id = request.getParameter("sc_id");
		String sc_title = request.getParameter("sc_title");
		String sc_cont = request.getParameter("sc_cont");
		
		sb.setSc_ref(sc_ref);
		sb.setSc_step(sc_step);
		sb.setSc_level(sc_level);
		sb.setSc_id(sc_id);
		sb.setSc_title(sc_title);
		sb.setSc_cont(sc_cont);
		
		SCBoardDAO sbdao = new SCBoardDAO();
		sbdao.replyBoard(sb);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("scorecard_list.do?page="+page);
		return forward;
	}

}
