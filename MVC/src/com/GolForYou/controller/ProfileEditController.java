package com.GolForYou.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.dao.MemberDAOImpl;
import com.GolForYou.vo.MemberVO;
import com.GolForYou.vo.rankDTO;
import com.oreilly.servlet.MultipartRequest;

public class ProfileEditController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		if(id==null) {
			//로그아웃 된 경우  
			out.println("<script>");
			out.println("alert('다시 로그인 하세요!);");
			out.println("location='login.do';");
			out.println("</script>");
			
		}else {
			
			String saveFolder=request.getRealPath("upload/member");
			int fileSize=5*1024*1024; //이진파일 업로드 최대크기를 5M
			MultipartRequest multi=null;
			
			multi = new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
			request.setCharacterEncoding("utf-8");
			MemberDAOImpl mdao=new MemberDAOImpl();
			MemberVO m=mdao.loginCheck(id);
			rankDTO r=new rankDTO();
			
			String m_email=multi.getParameter("m_email");
			String m_phone=multi.getParameter("m_phone");
			String m_addr=multi.getParameter("m_addr");
			
			
			File Mupfile = multi.getFile("m_file");
			
			if(Mupfile != null) { 
				String fileName = Mupfile.getName();
				
				File path01 = new File(saveFolder);
				if(!(path01.exists())) {
					path01.mkdir(); 
				}
				
				int index = fileName.lastIndexOf(".");
				String fileExtendsion = fileName.substring(index+1); 
				String refileName = id+"."+fileExtendsion; 
				String fileDBName = "/"+refileName;
				Mupfile.renameTo(new File(saveFolder+"/"+refileName)); 
				m.setM_file(fileDBName);
				 // for + if 문 으로 id + 넘버 추가 시켜서 , 계속해서 업데이트 될 수 있도록 할 것 
			}		
			
		
			m.setM_id(id);  //기준 아이디 , 수정 값은 아님
			m.setM_email(m_email); 
			m.setM_phone(m_phone);
			m.setM_addr(m_addr);
			
			
			r.setR_id(id);
			r.setR_province(m_addr);
			
			mdao.updateMember(m,r); 
			
			
			
			 out.println("<script>");
	         out.println("alert('회원정보 수정완료');");
	         out.println("location='mypage.do';");
	         out.println("</script>");
	         	System.out.println("성공");
	         	
	         	
			}
			
		
		return null;
	}

}
