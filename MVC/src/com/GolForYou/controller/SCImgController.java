package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.vo.SCBoardVO;
import com.GolForYou.dao.SCBoardDAO;

public class SCImgController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String iDate = request.getParameter("iDate");
		String id = request.getParameter("id");
		String iDatecut = iDate.substring(0,7);
		
		System.out.println(iDatecut);
		
		SCBoardDAO scdao = new SCBoardDAO();
		SCBoardVO sb = scdao.getBoardCont(iDate, id);
		
		String sc_playdate = sb.getSc_playdate();
		
		String sc_date = scdao.getUploadDate(id, iDate);
		
		request.setAttribute("sc_date", sc_date);
		request.setAttribute("iDate", iDate);
		request.setAttribute("id", id);
		request.setAttribute("iDatecut", iDatecut);
		request.setAttribute("iPlaydate", sc_playdate);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./view/tier/scorecardImg.jsp");
		return forward;
	}

}
