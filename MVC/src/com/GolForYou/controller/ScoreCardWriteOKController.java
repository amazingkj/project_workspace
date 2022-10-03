package com.GolForYou.controller;

import java.io.File;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GolForYou.vo.SCBoardVO;
import com.GolForYou.dao.SCBoardDAO;
import com.GolForYou.dao.ScoreCardDAO;
import com.oreilly.servlet.MultipartRequest;

public class ScoreCardWriteOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String saveFolder = request.getRealPath("upload"); //이진파일이 업로드되는 실제 경로를 구한다.
		
		int fileSize = 10*1024*1024; //이진파일 업로드 최대크기를 10mb로 제한
		MultipartRequest multi = null; //이진파일 업로드
		
		multi = new MultipartRequest(request, saveFolder, fileSize, "utf-8");
		
		SCBoardVO sc = new SCBoardVO();
		
		HttpSession session = request.getSession();
		String sc_id = (String)session.getAttribute("id");
		String sc_title = multi.getParameter("sc_title");
		String sc_playdate = multi.getParameter("sc_playdate");
		sc_playdate = sc_playdate.replace("-", "_");
		String sc_cont = multi.getParameter("sc_cont");
		
		String fileoutput = null;
		
		File upfile = multi.getFile("sc_file");
		if(upfile != null) { //첨부파일 있는경우
			String fileName = upfile.getName(); //첨부한 파일명
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); //년도
			int month = c.get(Calendar.MONTH)+1; //1월이 0이라 +1
			int date = c.get(Calendar.DATE);
			
			String homedir = saveFolder+"/"+year+"-"+"0"+month+"-"+date; //폴더경로 저장
			File path01 = new File(homedir);
			if(!(path01.exists())) {
				path01.mkdir(); //풀더 생성
			}
			
			int index = fileName.lastIndexOf("."); //첨부파일에서 마침표 위치번호
			String fileExtendsion = fileName.substring(index+1); //마침표 이후부터 마지막 문자까지 구함(파일 확장자)
			String refileName = sc_playdate+"_"+sc_id+"."+fileExtendsion; //새로운 파일첨부명
			String fileDBName = "/"+year+"-"+"0"+month+"-"+date+"/"+refileName;
			upfile.renameTo(new File(homedir+"/"+refileName)); //새롭게 생성된 폴더 경로에 변경된 파일로 실제 업로드
			sc.setSc_file(fileDBName);
			fileoutput = fileName;
		}		
		
		sc.setSc_id(sc_id);
		sc.setSc_title(sc_title);
		sc.setSc_playdate(sc_playdate);
		sc.setSc_cont(sc_cont);
		
		SCBoardDAO scdao = new SCBoardDAO();
		scdao.insertBoard(sc);
		
		ScoreCardDAO carddao = new ScoreCardDAO();
		carddao.autoInsert(sc_id,sc_playdate);
		
		//ScoreCardDTO carddto = new ScoreCardDTO();
		String strdate = carddao.makeDate(sc_id, sc_playdate);
		int numdate = Integer.parseInt(strdate);
		carddao.sortDate(sc_id,sc_playdate,numdate);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("scorecard_list.do");
		
		return forward;
	}

}
