package com.GolForYou.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.vo.SCBoardVO;
import com.GolForYou.dao.SCBoardDAO;

public class ScoreCardListController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int page = 1;
		int limit = 10;
		String find_field = null;
		String find_name = null;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		find_field = request.getParameter("find_field");
		if(request.getParameter("find_name") != null) { //�˻�� �ִ� ���
			find_name = request.getParameter("find_name").trim(); //trim()���� ���� ���� ����
		}
		SCBoardVO findsb = new SCBoardVO();
		findsb.setFind_field(find_field);
		findsb.setFind_name("%"+find_name+"%");
		
		SCBoardDAO scdao = new SCBoardDAO();
		
		int listcount = scdao.getListCount(findsb);
		List<SCBoardVO> sclist = scdao.getBoardList(page, limit, findsb);
		
		int maxpage = (int)((double)listcount/limit + 0.95); //�� ������ ��;
		int startpage = (((int)((double)page/10 + 0.9))-1)*10 + 1; //���� ������;
		int endpage = maxpage;
		
		if(endpage > startpage + 9) {
			endpage = startpage + 9;
		}
		request.setAttribute("sclist", sclist);
		request.setAttribute("page", page);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("find_field", find_field);
		request.setAttribute("find_name", find_name);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./view/tier/scorecard_list.jsp");
		
		return forward;
	}

}
