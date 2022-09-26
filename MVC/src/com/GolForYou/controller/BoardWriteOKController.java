package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.BoardDAOImpl;
import com.GolForYou.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;

public class BoardWriteOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");//post방식으로 전달된 한글 자료를 안깨지게 한다.
		
		String m_id=request.getParameter("m_id");//글쓴이
		String b_title=request.getParameter("b_title");
		String b_pwd=request.getParameter("b_pwd");
		String b_cont=request.getParameter("b_cont");
		
		BoardVO b=new BoardVO();
		b.setM_id(m_id); b.setB_title(b_title);
		b.setB_pwd(b_pwd); b.setB_cont(b_cont);
		
		BoardDAOImpl bdao=new BoardDAOImpl();
		bdao.insertBoard(b);//게시판 저장
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(true);//새로운 매핑주소로 이동
		forward.setPath("board_list.do");
		return forward;//게시판 목록보기 매핑주소로 이동
	}
}
