package com.GolForYou.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GolForYou.vo.SCBoardVO;
import com.GolForYou.dao.SCBoardDAO;
import com.oreilly.servlet.MultipartRequest;

public class ScoreCardEditOKController implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter(); //��½�Ʈ�� out ����
		MultipartRequest multi = null; //�������� ���ε�
		String saveFolder = request.getRealPath("upload"); //���������� ���ε�Ǵ� ���� ��θ� ���Ѵ�.
		int fileSize = 10*1024*1024; //�������� ���ε� �ִ�ũ�⸦ 10mb�� ����
		
		multi = new MultipartRequest(request, saveFolder, fileSize, "utf-8");
		
		request.setCharacterEncoding("utf-8");
		int sc_no = Integer.parseInt(multi.getParameter("sc_no")); //hidden���� ���޵� ��ȣ��
		System.out.println("ok_"+sc_no);
		int page = 1;
		if(multi.getParameter("page") != null) {
			page = Integer.parseInt(multi.getParameter("page"));
		}
	
		SCBoardVO sc = new SCBoardVO();
		
		String sc_id = multi.getParameter("sc_id");
		String sc_playdate = multi.getParameter("sc_playdate");
		String sc_title = multi.getParameter("sc_title");
		String sc_cont = multi.getParameter("sc_cont");
		
		File upfile = multi.getFile("sc_file");
		if(upfile != null) { //÷������ �ִ°��
			String fileName = upfile.getName(); //÷���� ���ϸ�
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); //�⵵
			int month = c.get(Calendar.MONTH)+1; //1���� 0�̶� +1
			int date = c.get(Calendar.DATE);
			
			String homedir = saveFolder+"/"+year+"-"+month+"-"+date; //������� ����
			File path01 = new File(homedir);
			if(!(path01.exists())) {
				path01.mkdir(); //Ǯ�� ����
			}
			
			int index = fileName.lastIndexOf("."); //÷�����Ͽ��� ��ħǥ ��ġ��ȣ
			String fileExtendsion = fileName.substring(index+1); //��ħǥ ���ĺ��� ������ ���ڱ��� ����(���� Ȯ����)
			String refileName = year+"_"+month+"_"+sc_id+"."+fileExtendsion; //���ο� ����÷�θ�
			String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
			upfile.renameTo(new File(homedir+"/"+refileName)); //���Ӱ� ������ ���� ��ο� ����� ���Ϸ� ���� ���ε�
			sc.setSc_file(fileDBName);
		}		
		
		SCBoardDAO scdao = new SCBoardDAO();
		
		sc.setSc_no(sc_no);
		sc.setSc_id(sc_id);
		sc.setSc_playdate(sc_playdate);
		sc.setSc_title(sc_title);
		sc.setSc_cont(sc_cont);
		
		scdao.updateBoard(sc);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("scorecard_cont.do?sc_no="+sc_no+"&page="+page+"&state=cont");
		
		return forward;
	}

}
