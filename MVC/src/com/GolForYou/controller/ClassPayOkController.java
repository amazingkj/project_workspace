package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.ClassDAOImpl;
import com.GolForYou.vo.ClassVO;

public class ClassPayOkController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		
		ActionForward forward=new ActionForward();
		
		
		
		int c_no = Integer.parseInt(request.getParameter("c_no"));
		String c_title; //데이터베이스에서 타이틀 가져오기
		String c_info = request.getParameter("c_info");
		String c_time = request.getParameter("c_time");
		int c_count = Integer.parseInt(request.getParameter("c_count"));
		String c_price = request.getParameter("c_price");
		
 
		ClassDAOImpl cDao = new ClassDAOImpl();
		ClassVO cv = cDao.selectMyClass(c_no);
		
		//int m_no = ~~~ -> session으로 가져온 m_id로 dao에다가 m_no를 구하는 메소드 만들기
		request.setAttribute("data", cv); // 상품상세 화면에서 보여줄 상세 데이터 객체 cv를 세팅 "data"는 화면에서 사용할 상품상세 객체명
		
		
		forward.setRedirect(false);//기존 매핑주소 값을 유지하고,속성키이름과 값도 유지한다.
		forward.setPath("./view/class/class_pay_ok.jsp");
		return forward;
	}

}
