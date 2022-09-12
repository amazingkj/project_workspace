package net.golf.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.golf.dao.MemberDAOImpl;
import net.golf.vo.MemberVO;
import net.golf.vo.MemberVO;


/* 로그인 인증 컨트롤러 클래스: 
 * 아이디를 기준으로 회원정보를 검색한 다음 회원정보가 있는 경우는 비번을 비교해서 비번이 같은 경우만
 * 로그인 인증 처리한다. 로그인 인증했을때 세션을 사용한다.
 */
public class MemberLoginOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		//???
		request.setCharacterEncoding("utf-8");
		
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
	
		
		MemberDAOImpl mdao=new MemberDAOImpl();
		MemberVO dm=mdao.loginCheck(id);//로그인 인증처리
		
		if(dm==null) {
			out.println("<script>");
			out.println("alert('회원정보가 검색되지 않습니다! 가입 후 이용해주세요.');");
			out.println("history.go(-1);");//뒤로 한칸 이동
			out.println("</script>");
		}else {
			if(!dm.getM_pw().equals(pw)) {
				out.println("<script>");
				out.println("alert('아이디 또는 비밀번호가 유효하지 않습니다.');");
				out.println("history.back();");//뒤로 한칸 이동
				out.println("</script>");
			}else {//비번이 같아서 로그인 인증 된 경우
				HttpSession session=request.getSession();//세션 객체 생성
				session.setAttribute("id",id);//세션 id에 아이디 저장
				
				ActionForward forward=new ActionForward();
				forward.setRedirect(true);//새로운 매핑주소로 이동
				forward.setPath("index.do");
				return forward;
			}
		}
		return null;
	}
}
