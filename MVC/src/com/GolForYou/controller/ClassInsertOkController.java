package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.ClassDAOImpl;
import com.GolForYou.vo.ClassVO;

public class ClassInsertOkController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		// 클래스 등록 결과 화면 포워딩
		String c_title = request.getParameter("c_title");
		String c_teacher = request.getParameter("c_teacher");
		String c_career = request.getParameter("c_career");
		String c_phone = request.getParameter("c_phone");
		String c_gender = request.getParameter("c_gender");
		String c_kind = request.getParameter("c_kind");
		String c_info = request.getParameter("c_info");
		String c_desc = request.getParameter("c_desc");
		String c_time = request.getParameter("c_desc");
		int c_count = Integer.parseInt(request.getParameter("c_count"));
		String c_price = request.getParameter("c_price");
		String c_addr = request.getParameter("c_addr");
		String c_image = request.getParameter("c_image");
		
		ClassVO cv = new ClassVO();
		cv.setC_title(c_title);
		cv.setC_teacher(c_teacher);
		cv.setC_career(c_career);
		cv.setC_phone(c_phone);
		cv.setC_gender(c_gender);
		cv.setC_kind(c_kind);
		cv.setC_info(c_info);
		cv.setC_desc(c_desc);
		cv.setC_time(c_time);
		cv.setC_count(c_count);
		cv.setC_price(c_price);
		cv.setC_addr(c_addr);
		cv.setC_image(c_image);
		
		ClassDAOImpl cDao = new ClassDAOImpl();
		cDao.insertClass(cv);
			
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);//기존 매핑주소 값을 유지하고,속성키이름과 값도 유지한다.
		forward.setPath("./view/class/class_insert_ok.jsp");
		return forward;
	}

}
