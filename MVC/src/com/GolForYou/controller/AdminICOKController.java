package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.vo.ScoreCardDTO;
import com.GolForYou.dao.ScoreCardDAO;
import com.GolForYou.dao.rankDAO;

public class AdminICOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String s_id = request.getParameter("s_id");
		String s_date = request.getParameter("s_date");
		double point_avg = Double.parseDouble(request.getParameter("point_avg"));
		int bestPoint = Integer.parseInt(request.getParameter("bestPoint"));
		double put_avg = Double.parseDouble(request.getParameter("put_avg"));
		int range = Integer.parseInt(request.getParameter("range"));
		String location = request.getParameter("location");
		int handicap = Integer.parseInt(request.getParameter("handicap"));
		
		System.out.println(point_avg);
		
		ScoreCardDTO sdto = new ScoreCardDTO();
		sdto.setS_id(s_id);
		sdto.setS_date(s_date);
		sdto.setS_bestscore(bestPoint);
		sdto.setS_range(range);
		sdto.setS_location(location);
		sdto.setS_handicap(handicap);
		sdto.setS_putting(put_avg);
		sdto.setS_sumscore(point_avg);
		
		ScoreCardDAO scdao = new ScoreCardDAO();
		
		scdao.updateCard(sdto);
		
		rankDAO rdao = new rankDAO();
		rdao.updateAvgScore(point_avg, s_id);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin_insertCard.do");
		return forward;
	}

}
