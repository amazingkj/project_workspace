package com.GolForYou.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.rankDAO;
import com.GolForYou.vo.rankDTO;

//로그인 인증 이후 메인화면으로 이동
public class IndexController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
			rankDAO rdao = new rankDAO();
			
			String[] r_id = new String[5];
			int[] r_sum = new int[5];
			
			for(int i=0 ; i<5 ; ++i) {
				r_id[i] = rdao.getHonor_id().get(i);
				r_sum[i] = rdao.getHonor_sum().get(i);
				
				request.setAttribute("r_id"+i, r_id[i]);
				request.setAttribute("r_sum"+i, r_sum[i]);
			}
			
			
	
		    ActionForward forward=new ActionForward();
		    forward.setRedirect(false);
		    forward.setPath("./view/member/index.jsp");
		    return forward;
		
	}
}





