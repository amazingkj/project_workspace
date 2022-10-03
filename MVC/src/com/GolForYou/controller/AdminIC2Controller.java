package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.vo.SCBoardVO;
import com.GolForYou.dao.SCBoardDAO;
import com.GolForYou.dao.ScoreCardDAO;

public class AdminIC2Controller implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String sc_id = request.getParameter("id");
		String sc_playdate = request.getParameter("playdate");
		sc_playdate = sc_playdate.replace("-", "_");
		
		SCBoardDAO sbdao = new SCBoardDAO();	
		SCBoardVO sbvo = sbdao.getBoardCont(sc_playdate, sc_id);
		
		ScoreCardDAO scdao = new ScoreCardDAO();
		
		
		if(sbvo != null) {
			if(scdao.getUpdated(sc_id, sc_playdate) == 0) {
				String sc_fileName = sbvo.getSc_file();
				
				String folder = sc_fileName.substring(1,11);
				String file = sc_fileName.substring(12,22);
				
				request.setAttribute("date", sc_playdate);
				request.setAttribute("folder", folder);
				request.setAttribute("file", file);
				request.setAttribute("id", sc_id);
				
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./view/admin/admin_insertCard2.jsp");
				return forward;
			}else {
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("./view/admin/admin_insertCard_null.jsp");
				return forward;
			}
			
		}else {
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./view/admin/admin_insertCard_null.jsp");
			return forward;
		}
		
		
	}

}
