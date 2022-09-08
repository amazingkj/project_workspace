package net.golf.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.golf.dao.MemberDAOImpl;
import net.golf.vo.MemberVO;

//로그인 인증 이후 메인화면으로 이동
public class IndexController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();//세션 객체 생성
		
		String id=(String)session.getAttribute("id");//세션 아이디 저장
		
		if(id == null) {
          out.println("<script>");
          out.println("alert('다시 로그인 하세요!');");
          out.println("location='login.do';");
          out.println("</script>");
		}else {
			MemberDAOImpl mdao=new MemberDAOImpl();
			MemberVO m=mdao.loginCheck(id);//아이디에 해당하는 프로필 사진을 가져옴.
		    request.setAttribute("profile",m.getM_file());//profile속성 키이름에 첨부파일 경로를 저장
		    
		    ActionForward forward=new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("./view/member/index.jsp");
		    return forward;
		}
		return null;
	}
}





