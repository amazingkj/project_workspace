package com.GolForYou.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ScoreCardWriteController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); //�ʹ�ȣ(��������ȣ)�� �������ڷ� �����ؼ� ����
		}
		request.setAttribute("page", page); //���� �� ��������ȣ�� �ٷ� �̵��ϱ� ���� å���Ǳ��
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String sc_id = (String)session.getAttribute("id");
		
		if(sc_id == null) {
			out.println("<script>");
			out.println("alert('�α��κ��� �ϼ���')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./view/tier/scorecard_write.jsp");
			
			return forward;
		}		
		return null;
	}

}
