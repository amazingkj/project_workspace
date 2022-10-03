package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.vo.SCBoardVO;
import com.GolForYou.dao.SCBoardDAO;

public class ScoreCardContController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		String sc_id = (String)session.getAttribute("id");
		request.setAttribute("id", sc_id);
		System.out.println(sc_id);
		
		int sc_no = Integer.parseInt(request.getParameter("sc_no"));
		String state = request.getParameter("state");
		System.out.println(sc_no);
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		SCBoardDAO scdao = new SCBoardDAO();
		if(state.equals("cont")) {
			scdao.updateHit(sc_no);
		}
		
		SCBoardVO sb = scdao.getBoardCont(sc_no);
		String sc_cont = sb.getSc_cont().replace("\n", "<br>"); //textarea���� ����Ű ģ �κ��� \n���� <br>�� ����
		
		request.setAttribute("sb", sb);
		request.setAttribute("page", page); //å���� ��ɶ����� �ʹ�ȣ ����
		request.setAttribute("sc_cont", sc_cont);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(state.equals("cont")) {
			forward.setPath("./view/tier/scorecard_cont.jsp");
		}else if(state.equals("reply")) {
			forward.setPath("./view/tier/scorecard_reply.jsp");
		}else if(state.equals("edit")) {
			forward.setPath("./view/tier/scorecard_edit.jsp");
		}else if(state.equals("del")) {
			forward.setPath("./view/tier/scorecard_del.jsp");
		}
		
		return forward;
	}

}
