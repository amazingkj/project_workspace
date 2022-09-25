package com.GolForYou.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.BoardDAOImpl;
import com.GolForYou.vo.BoardVO;

public class BoardDeLOKController implements Action {
/* 서블릿 mvc게시판 삭제 완료 컨트롤러 */
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out=response.getWriter();
      
      int b_no=Integer.parseInt(request.getParameter("b_no"));
      int page=1;
      if(request.getParameter("page")!=null) {
         page=Integer.parseInt(request.getParameter("page"));
      }
      
      BoardDAOImpl bdao=new BoardDAOImpl();
      BoardVO eb=new BoardVO();
      eb.setB_no(b_no);
      
      bdao.delBoard(b_no);//삭제

          ActionForward forward=new ActionForward();
          forward.setRedirect(true);
          forward.setPath("board_list.do?page="+page);
          return forward;
       
    
   }
}