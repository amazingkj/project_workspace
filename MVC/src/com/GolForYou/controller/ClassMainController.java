package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.ClassDAOImpl;
import com.GolForYou.vo.ClassVO;

public class ClassMainController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
//		int c_no = Integer.parseInt(request.getParameter("c_no"));
		int c_no = 2; // 현재 하드코딩, 상품상세로 진입할 때 c_no를 받아야 함. 없으면 상세 페이지에서 메인 또는 적절한 페이지로 보내야함. DB도 실행하면 안됨 null 이므로 오류 발생
	
		ClassDAOImpl classDAOImpl = new ClassDAOImpl(); // DB를 조회하고 리턴할 클래스
		ClassVO cv = classDAOImpl.productDetail(c_no); // golf_class 상세 메소드
		request.setAttribute("data", cv); // 상품상세 화면에서 보여줄 상세 데이터 객체 cv를 세팅 "data"는 화면에서 사용할 상품상세 객체명

		
		forward.setRedirect(false);//기존 매핑주소 값을 유지하고,속성키이름과 값도 유지한다.
		forward.setPath("./view/class/class_main.jsp");
		return forward;
	}
}

