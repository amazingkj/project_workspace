package com.GolForYou.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.BoardDAOImpl;
import com.GolForYou.vo.BoardVO;

/* 서블릿 MVC게시판 수정 완료 컨트롤러 */
public class BoardEditOKController implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      response.setContentType("text/html;charset=UTF-8");//브라우저로 출력되는 문자/태그, 언어코딩 타입 설정
      PrintWriter out=response.getWriter();//출력 스트림 out생성
      
      request.setCharacterEncoding("UTF-8");//post로 전달되는 한글을 안깨지게 함
      
      int b_no = Integer.parseInt(request.getParameter("b_no"));//히든으로 전달된 번호값을
      //받아서 정수 숫자로 변경해서 저장
   
      int page=1;
      if(request.getParameter("page") != null) {
      page= Integer.parseInt(request.getParameter("page"));
      }
      
      String m_id=request.getParameter("m_id");
      String b_title=request.getParameter("b_title");
      String b_cont=request.getParameter("b_cont");
      
      BoardDAOImpl bdao=new BoardDAOImpl();
      BoardVO db_name=bdao.getBoardCont(b_no);//번호에해당하는 비번을 오라클디비로 부터 가져옴.
      
   
         BoardVO eb=new BoardVO();
         eb.setB_no(b_no); eb.setM_id(m_id);
         eb.setB_title(b_title); eb.setB_cont(b_cont);
         
         bdao.updateBoard(eb);//게시판 수정
         
         ActionForward forward=new ActionForward();
         forward.setRedirect(true);//수정후 새로운 매핑주소로 이동
         forward.setPath("board_list.do?page="+page);
         //?뒤에 3개의 인자값을 get방식으로 전달
         return forward;
     
     
   }
}
