package com.GolForYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.dao.MemberDAOImpl;
import com.GolForYou.dao.rankDAO;
import com.GolForYou.vo.MemberVO;

public class RankingController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String prov = request.getParameter("prov");
		rankDAO dao = new rankDAO();
		String[] id = null;
		MemberDAOImpl mdao = new MemberDAOImpl();
		MemberVO m = null;
		int member = 0;	
		String[] file = null;
				
		if(prov == null){
			member = dao.memberCount();
			id = new String[member];
			file = new String[member];
			for(int i=0 ; i<member ; ++i) {
				id[i] = dao.getHonor_id().get(i);						
				file[i] = "./upload/member"+mdao.fileinfo(id[i]);	
				request.setAttribute("file", file[i]);
			}
			
		}else{
			member = dao.memberCount(prov);	
			id = new String[member];
			for(int i=0 ; i<member ; ++i) {
				id[i] = dao.getHonor_id().get(i);	
				file = new String[member];
				file[i] = "./upload/member"+mdao.fileinfo(id[i]);	
				request.setAttribute("file", file[i]);
			}
		}
		
		
		
		
		
		//dao.getRank(prov);
		
		request.setAttribute("member", member);
		request.setAttribute("prov", prov);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./view/tier/ranking.jsp");
		return forward;
	}

}
