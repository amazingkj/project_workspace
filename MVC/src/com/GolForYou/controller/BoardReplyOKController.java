package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.BoardDAOImpl;
import com.GolForYou.vo.BoardVO;

public class BoardReplyOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
request.setCharacterEncoding("UTF-8");
		

		int b_ref=Integer.parseInt(request.getParameter("b_ref"));
		int b_step=Integer.parseInt(request.getParameter("b_step"));
		int b_level=Integer.parseInt(request.getParameter("b_level"));
		
		
		int page=Integer.parseInt(request.getParameter("page"));
		
		String b_name=request.getParameter("b_name");
		String b_title=request.getParameter("b_title");
		String b_pwd=request.getParameter("b_pwd");
		String b_cont=request.getParameter("b_cont");
		
		BoardVO rb=new BoardVO();
		
		
		rb.setB_ref(b_ref); rb.setB_step(b_step);
		rb.setB_level(b_level); 
		rb.setB_name(b_name); rb.setB_title(b_title);
		rb.setB_pwd(b_pwd); rb.setB_cont(b_cont);
		
		BoardDAOImpl bdao=new BoardDAOImpl();
		bdao.replyBoard(rb);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);
		forward.setPath("board_list.do?page="+page);
		return forward;

	
	}

}
