package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.vo.ClassVO;

public class ClassInsertController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		
		// 클래스 등록 요청 처리
				
		forward.setRedirect(false);//기존 매핑주소 값을 유지하고,속성키이름과 값도 유지한다.
		forward.setPath("./view/class/class_insert.jsp");
		return forward;
	}
}
