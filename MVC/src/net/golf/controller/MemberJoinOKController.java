package net.golf.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import net.golf.dao.MemberDAOImpl;
import net.golf.vo.MemberVO;


public class MemberJoinOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		String saveFolder=request.getRealPath("upload");
		//이진파일이 업로드 되는 실제 경로를 구한다.
		int fileSize=5*1024*1024;//이진파일 업로드 최대크기를 5M
		MultipartRequest multi=null;//이진파일 업로드
		
		multi = new MultipartRequest(request,saveFolder,fileSize,"UTF-8");
		MemberVO m=new MemberVO();
		
		String m_id = multi.getParameter("m_id");
		String m_pwd = multi.getParameter("m_pwd");
		String m_name = multi.getParameter("m_name");
		String m_phone = multi.getParameter("m_phone");
		String m_email = multi.getParameter("m_email");
		String m_gender = multi.getParameter("m_gender");
		String m_date = multi.getParameter("sysdate");

		
		File UpFile = multi.getFile("m_file");//첨부한 이진파일을 가져옴.
		
	    if(UpFile != null) {//첨부한 파일이 있는 경우 실행
           String fileName = UpFile.getName();//첨부한 파일명
           Calendar c=Calendar.getInstance();
           int year=c.get(Calendar.YEAR);//년도
           int month=c.get(Calendar.MONTH)+1;//월, +1을 하는 이유는 1월이 0으로 반환되기 때문이다.
           int date=c.get(Calendar.DATE);//일
           
           String homedir=saveFolder+"/"+year+"-"+month+"-"+date;//오늘 날짜 폴더 경로 저장
           File path01=new File(homedir);
           if(!(path01.exists())) {//오늘날짜 폴더 경로가 없다면
        	   path01.mkdir();//오늘날짜 폴더 생성
           }
           Random r=new Random();
           int random=r.nextInt(100000000);//0이상 1억미만 사이의 정수 숫자 난수를 발생
           
           int index=fileName.lastIndexOf(".");//첨부파일에서 마침표 위치번호
           String fileExtendsion = fileName.substring(index+1);//마침표 이후부터 마지막 문자까지 구함.즉 파일의
           //확장자를 구함
           String refileName="member"+year+month+date+random+"."+fileExtendsion;
           //새로운 첨부파일명
           String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;//오라클에 저장될 레코드값
           UpFile.renameTo(new File(homedir+"/"+refileName));
           //새롭게 생성된 폴더 경로에 변경된 파일로 실제 업로드
           m.setM_file(fileDBName);
	    }				
	     m.setM_id(m_id); m.setM_pw(m_pwd); m.setM_name(m_name);
	     m.setM_phone(m_phone); m.setM_email(m_email);
	     m.setM_gender(m_gender); m.getM_date();
	     
	     MemberDAOImpl mdao=new MemberDAOImpl();
	     int re=mdao.insertMember(m);//회원 저장
	     
	     if(re==1) {
	    	 ActionForward forward=new ActionForward();
	    	 forward.setRedirect(true);//새로운 매핑주소로 이동
	    	 forward.setPath("login.do");
	    	 return forward;
	     }
		return null;
	}
}







