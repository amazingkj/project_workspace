package com.GolForYou.controller;

import java.io.FileOutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.ScoreCardDAO;

public class AdminICDelController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String s_id = request.getParameter("s_id");
		String s_date = request.getParameter("s_date");
		
		ScoreCardDAO scdao = new ScoreCardDAO();
		scdao.delCard(s_id, s_date);
		
		out.println("<script>");
		out.println("alert('삭제되었습니다.')");
		out.println("</script>");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("admin_insertCard.do");
		return forward;
	}

}
