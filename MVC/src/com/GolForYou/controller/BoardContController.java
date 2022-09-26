package com.GolForYou.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.dao.BoardDAOImpl;
import com.GolForYou.vo.BoardVO;


public class BoardContController implements Action {
	/* 내용보기,답변글,수정폼,삭제폼
 	 * 4개의 부분 뷰페이지가 실행됨. 
	 */

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));//get으로 전달된 게시물번호를
		//받아서 정수 숫자로 변경해서 저
		String state = request.getParameter("state");
		
		int page=1;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		BoardDAOImpl bdao=new BoardDAOImpl();

		if(state.equals("cont")) {//내용보기 일때만 조회수가 증가
			bdao.updateHit(b_no);
		}
		
		BoardVO bc=bdao.getBoardCont(b_no);//번호에 해당하는 DB레코드값을 가져옴
		String b_cont=bc.getB_cont().replace("\n","<br/>");//textarea에서 엔터키 친부분을 다음줄로
		//줄바꿈(개행)
		
		request.setAttribute("bc", bc);
		request.setAttribute("page",page);//책갈피 기능때문에 쪽번호 저장
		request.setAttribute("b_cont",b_cont);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);//기존 매핑주소와 키값을 유지
	
		if(state.equals("cont")) {//내용보기
			forward.setPath("./view/board/board_cont.jsp");//뷰페이지 경로
		}else if(state.equals("reply")) {
			forward.setPath("./view/board/board_reply.jsp");
		}else if(state.equals("edit")) {
			forward.setPath("./view/board/board_edit.jsp");
		}else if(state.equals("del")) {
			forward.setPath("./view/board/board_del.jsp");
		}
		return forward;
	}
}




