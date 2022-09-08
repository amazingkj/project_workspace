package net.golf.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.golf.dao.MemberDAOImpl;
import net.golf.vo.MemberVO;

public class MemberIDCheckController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");//웹브라우저에 출력되는 문자와 태그,언어코딩 타입을
		//지정
		PrintWriter out=response.getWriter();//출력스트림 out생성
		
		String m_id=request.getParameter("id");//비동기식으로 전달된 아이디값을 저장
		
		MemberDAOImpl mdao=new MemberDAOImpl();
		MemberVO db_id=mdao.id_Check(m_id);//오라클에 저장된 아이디 검색
		
		int re=-1;//중복아이디가 아닌경우 반환값
		
		if(db_id != null) {//중복아이디가 있는 경우
			re=1;
		}
		out.println(re);//값 반환
		return null;
	}
}




