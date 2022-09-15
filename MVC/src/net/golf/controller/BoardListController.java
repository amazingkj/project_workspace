package net.golf.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.golf.dao.BoardDAOImpl;
import net.golf.vo.BoardVO;


public class BoardListController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		int page=1;//쪽번호(페이징 쪽나누기에서 페이지 번호)
		int limit=10;
		String find_field=null;//검색 필드(b_title,b_cont)
		String find_name=null;//검색어
		
		if(request.getParameter("page") != null) {//get 으로 전달된 쪽번호가 있는 경우 실행
			page=Integer.parseInt(request.getParameter("page"));//페이지번호를 정수 숫자로 변경해서 저장
		}
		
		find_field=request.getParameter("find_field");
	    if(request.getParameter("find_name") != null) {//검색어가 있는 경우
	    	find_name=request.getParameter("find_name").trim();//trim()메서드로 양쪽공백을 제거해서 저장
	    }
	    
	    BoardVO findB=new BoardVO();
	    findB.setFind_field(find_field); findB.setFind_name("%"+find_name+"%");//%는 쿼리문 와일드 카드
	    //문자로서 검색에서 하나 이상의 임의의 모르는 문자와 매핑 대응한다.
		
	    BoardDAOImpl bdao=new BoardDAOImpl();
	    
	    int listcount=bdao.getListCount(findB);//검색 전후 레코드 개수
	    List<BoardVO> blist=bdao.getBoardList(page, limit, findB);//검색 전후 목록
	    
	    int maxpage=(int)((double)listcount/limit+0.95);//총페이지 수
	    int startpage=(((int)((double)page/10+0.9))-1)*10+1;//시작페이지
	    int endpage=maxpage;//마지막 페이지
	    
	    if(endpage>startpage+10-1) endpage=startpage+10-1;
	    
	    request.setAttribute("blist",blist);//blist속성키이름에 목록을 저장
	    request.setAttribute("page",page);//쪽번호 저장
	    request.setAttribute("startpage",startpage);
	    request.setAttribute("endpage",endpage);
	    request.setAttribute("maxpage",maxpage);
	    request.setAttribute("listcount",listcount);//레코드 개수
	    request.setAttribute("find_field",find_field);//b_title,b_cont 검색필드 저장
	    request.setAttribute("find_name",find_name);//검색어
	    
	    ActionForward forward=new ActionForward();
	    forward.setRedirect(false);//속성키이름 값과 기존매핑주소를 유지 하면서 해당 뷰페이지로 이동
	    forward.setPath("./view/board/board_list.jsp");
		return forward;
	}
}







