package com.GolForYou.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.dao.MemberDAOImpl;
import com.GolForYou.dao.rankDAO;
import com.GolForYou.vo.MemberVO;
import com.GolForYou.vo.rankDTO;

public class MypageMainController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
			MemberVO m=mdao.logininfo(id);//아이디에 해당하는 프로필 사진을 가져옴.
		    request.setAttribute("profile",m.getM_file());//profile속성 키이름에 첨부파일 경로를 저장
			request.setAttribute("m_email",m.getM_email());
			request.setAttribute("m_phone",m.getM_phone());
			request.setAttribute("m_addr",m.getM_addr());
			
			
			rankDAO rdao=new rankDAO();
			int point =rdao.rankSum(id);
			
			String tierURL=null;
			String tierStr=null;

		      if(point < -15){
		         tierURL = "./images/t_d.png";
		         tierStr = "다이아몬드";
		      }else if(point >= -15 && point < -10){
		         tierURL = "./images/t_p.png";
		         tierStr = "플레티넘";
		      }else if(point >= -10 && point < -5){
		         tierURL = "./images/t_g.png";
		         tierStr = "골드";
		      }else if(point >= -5 && point < 5){
		         tierURL = "./images/t_s.png";
		         tierStr = "실버";
		      }else{
		         tierURL = "./images/t_b.png";
		         tierStr = "브론즈";
		      }
		      
		
			request.setAttribute("tierURL", tierURL);
			request.setAttribute("tierStr", tierStr);
			
			
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);//기존 매핑주소 값을 유지하고,속성키이름과 값도 유지한다.
		forward.setPath("./view/mypage/main.jsp");
		return forward;
		}
		return null;
	
		    
	}

}
