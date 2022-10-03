package com.GolForYou.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.vo.YeYag_listVO;
import com.GolForYou.dao.YeYagDAOImpl;

public class YeYagListokController implements Action {


	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {



		ActionForward forward=new ActionForward();
		String y_name=request.getParameter("y_name");
		System.out.println(y_name);
		YeYagDAOImpl dao=new YeYagDAOImpl();
		List<YeYag_listVO> list=dao.YeYaglist(y_name);
		      
		      for(int i=0; i<3; i++) {
		       System.out.println(list);
		      }
		      
		      request.setAttribute("list", list);
		      
		      System.out.println(y_name);
		      
		      forward.setRedirect(false);//기본매핑주소를 유지하면서 뷰페이지로 이동
		      forward.setPath("./view/yeyag/YeYag_list_ok.jsp");//뷰페이지 경로 설정
		      return forward;//리턴값을 null로 하면 해당 뷰페이지로 이동하지 않고 브라우저 화면이 하얗게 나온다.주의
		   }
}
