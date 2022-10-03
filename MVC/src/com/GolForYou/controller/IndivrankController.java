package com.GolForYou.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.vo.ScoreCardDTO;
import com.GolForYou.dao.MemberDAOImpl;
import com.GolForYou.dao.ScoreCardDAO;
import com.GolForYou.dao.rankDAO;

public class IndivrankController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("rId"); //rId 를 임시로 id 로 변경함
		if(id == null) {
			HttpSession session = request.getSession();			 
			id = (String)session.getAttribute("id");
		}
		
		MemberDAOImpl mdao = new MemberDAOImpl();
		String img = mdao.fileinfo(id);
		
		String rPoint = request.getParameter("rPoint_");
		if(rPoint == null) {
			rankDAO rdao = new rankDAO();
			rPoint = Integer.toString(rdao.rankSum(id));
		}
		String rankno = request.getParameter("rankno");
		if(rankno == null) {
			rankDAO rdao = new rankDAO();
			rankno = Integer.toString(rdao.getRowNum(id))+"위";
		}
		
		rankDAO dao = new rankDAO();
		
		int getCount = dao.playCount(id);
		
		ScoreCardDAO sdao = new ScoreCardDAO();
		String s_handicap = sdao.getHandicap(id);

		int sumPutting = 0;
		for(int i=0 ; i<getCount ; ++i) {
			sumPutting += sdao.getPutting(id).get(i);
		}
		double avgPutting = (double)sumPutting/getCount;
		String strPutting = String.format("%.2f", avgPutting);
		
		int jan = sdao.monthConut(id, "01");
		int feb = sdao.monthConut(id, "02");
		int mar = sdao.monthConut(id, "03");
		int apr = sdao.monthConut(id, "04");
		int may = sdao.monthConut(id, "05");
		int jun = sdao.monthConut(id, "06");
		int jul = sdao.monthConut(id, "07");
		int aug = sdao.monthConut(id, "08");
		int sep = sdao.monthConut(id, "09");
		int oct = sdao.monthConut(id, "10");
		int nov = sdao.monthConut(id, "11");
		int dec = sdao.monthConut(id, "12");
		
		int point = dao.rankSum(id);
		
		String tierURL = null;
		String tierStr = null;
		

	      if(point < -15){
	         tierURL = "./images/t_d.png";
	         tierStr = "다이아몬드";
	      }else if(point >= -15 && point < -10){
	         tierURL = "./images/t_p.png";
	         tierStr = "플레티넘";
	      }else if(point >= -10 && point < -5){
	         tierURL = "./images/t_g.png";
	         tierStr = "골드";
	      }else if(point >= -5 && point < 5){
	         tierURL = "./images/t_s.png";
	         tierStr = "실버";
	      }else{
	         tierURL = "./images/t_b.png";
	         tierStr = "브론즈";
	      }
	      
	    request.setAttribute("img", img);
		request.setAttribute("s_handicap", s_handicap);
		request.setAttribute("getCount", getCount);
		request.setAttribute("avgPutting", avgPutting);
		request.setAttribute("strPutting", strPutting);
		request.setAttribute("sdao", sdao);
		request.setAttribute("id", id);
		request.setAttribute("jan", jan);
		request.setAttribute("feb", feb);
		request.setAttribute("mar", mar);
		request.setAttribute("apr", apr);
		request.setAttribute("may", may);
		request.setAttribute("jun", jun);
		request.setAttribute("jul", jul);
		request.setAttribute("aug", aug);
		request.setAttribute("sep", sep);
		request.setAttribute("oct", oct);
		request.setAttribute("nov", nov);
		request.setAttribute("dec", dec);
		request.setAttribute("rankno", rankno);
		request.setAttribute("rPoint", rPoint);
		request.setAttribute("tierURL", tierURL);
		request.setAttribute("tierStr", tierStr);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./view/tier/indivrank.jsp");
		return forward;
	}

}
