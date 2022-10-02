package com.GolForYou.controller;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.GolForYou.dao.ClassDAOImpl;
import com.GolForYou.vo.ClassIngVO;
import com.GolForYou.vo.ClassVO;

public class ClassPayController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();//세션 객체 생성
		PrintWriter out=response.getWriter();
		String id=(String)session.getAttribute("id");//세션 아이디 저장
		

		if(id == null) {
          out.println("<script>");
          out.println("alert('다시 로그인 하세요!');");
          out.println("location='login.do';");
          out.println("</script>");
          
		}else {
		// 넘어온 값 받기
		//int m_no = 2;
		//int c_no = 2;
			int m_no = Integer.parseInt(request.getParameter("m_no"));
			int c_no = Integer.parseInt(request.getParameter("c_no"));
		// 그 값을 다시 넘길 수 있게 세팅
		ClassIngVO ci = new ClassIngVO();
		ci.setM_no(m_no);
		ci.setC_no(c_no);

		ClassDAOImpl cDao = new ClassDAOImpl();
		cDao.insertClassIng(ci);
		ClassVO cv = cDao.selectMyClass(c_no);
		request.setAttribute("date", cv);
		
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);//기존 매핑주소 값을 유지하고,속성키이름과 값도 유지한다.
		forward.setPath("./view/class/class_pay.jsp");
		return forward;
	}
		return null;
}
}
