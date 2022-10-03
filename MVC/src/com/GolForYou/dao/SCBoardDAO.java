package com.GolForYou.dao;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.GolForYou.vo.SCBoardVO;


public class SCBoardDAO extends DBInfo{
	public SCBoardDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/xe"); //커넥션 풀 관리 ds생성
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int insertBoard(SCBoardVO s) {
		int re = -1;
		
		try {
			con = ds.getConnection();
			sql = "insert into scboard(sc_no,sc_id,sc_title,sc_playdate,sc_cont,sc_file,sc_ref,sc_step,sc_level,sc_date) "
					+ " values(test_scboard_seq.nextval,?,?,?,?,?,test_scboard_seq.nextval,?,?,sysdate)";
			pt = con.prepareStatement(sql);
			pt.setString(1, s.getSc_id());
			pt.setString(2, s.getSc_title());
			pt.setString(3, s.getSc_playdate());
			pt.setString(4, s.getSc_cont());
			pt.setString(5, s.getSc_file());
			pt.setInt(6, 0);
			pt.setInt(7, 0);
			
			System.out.println(s.getSc_title());
			
			re = pt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return re;
	}
	
	public List<SCBoardVO> getBoardList(int page, int limit, SCBoardVO findsb){
		List<SCBoardVO> slist = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			sql = "select * from (select rowNum rNum, sc_no, sc_id, sc_title, sc_hit, sc_ref, sc_step, sc_level, sc_date from (select * from scboard ";
			if(findsb.getFind_field() == null) {
				sql += "";
			}else if(findsb.getFind_field().equals("sc_All")) {
				sql += " where sc_title like ? or sc_cont like ?";
			}else if(findsb.getFind_field().equals("sc_title")) {
				sql += " where sc_title like ?";
			}else if(findsb.getFind_field().equals("sc_id")) {
				sql += " where sc_id like ?";
			}else if(findsb.getFind_field().equals("sc_cont")) {
				sql += " where sc_cont like ?";
			}
			sql += " order by sc_ref desc,sc_level asc)) where rNum >= ? and rNum <= ?";
			
			pt = con.prepareStatement(sql);
			
			int startrow = (page-1)*10+1; //읽기 시작할 행번호
			int endrow = startrow+limit-1; //읽을 마지막 행번호
			
			if(findsb.getFind_field() != null) {
				if(findsb.getFind_field().equals("sc_All")){
					pt.setString(1, findsb.getFind_name());
					pt.setString(2, findsb.getFind_name());
					pt.setInt(3, startrow);
					pt.setInt(4, endrow);
				}else {
					pt.setString(1, findsb.getFind_name());
					pt.setInt(2, startrow);
					pt.setInt(3, endrow);
				}				
			}else{
				pt.setInt(1, startrow);
				pt.setInt(2, endrow);
			}
			
			rs = pt.executeQuery();
			
			while(rs.next()) {
				SCBoardVO s = new SCBoardVO();
				
				s.setSc_no(rs.getInt("sc_no"));
				s.setSc_id(rs.getString("sc_id"));
				s.setSc_title(rs.getString("sc_title"));
				s.setSc_hit(rs.getInt("sc_hit"));
				s.setSc_ref(rs.getInt("sc_ref"));
				s.setSc_step(rs.getInt("sc_step"));
				s.setSc_date(rs.getString("sc_date"));
				
				slist.add(s);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return slist;
	}
	
	//검색 전, 검색 후 레코드 갯수
	public int getListCount(SCBoardVO findsb) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			con = ds.getConnection();
			sql = "select count(sc_no) from scboard ";
			if(findsb.getFind_field() == null) { //검색 전
				sql += "";
			}else if(findsb.getFind_field().equals("sc_All")) {
				sql += " where sc_title like ? or sc_cont like ?";
			}else if(findsb.getFind_field().equals("sc_title")) { //검색필드 == 글제목
				sql += " where sc_title like ?";
			}else if(findsb.getFind_field().equals("sc_cont")) { //검색필드 == 글내용
				sql += " where sc_cont like ?";
			}else if(findsb.getFind_field().equals("sc_id")) { //검색필드 == 아이디
				sql += " where sc_id likd ?";
			}
			//추후 다른것도 추가할 것.
			pt = con.prepareStatement(sql);
			
			if(findsb.getFind_field() != null) {
				if(findsb.getFind_field().equals("sc_All")) {
					pt.setString(1, findsb.getFind_name());
					pt.setString(2, findsb.getFind_name());
				}else {
					pt.setString(1, findsb.getFind_name());
				}
			}
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return count;
	}
	
	public int getListCounttest(SCBoardVO findsb) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
			sql = "select count(sc_no) from scboard ";
			if(findsb.getFind_field() == null) { //검색 전
				sql += "";
			}else if(findsb.getFind_field().equals("sc_title")) { //검색필드 == 글제목
				sql += " where sc_title like ?";
			}else if(findsb.getFind_field().equals("sc_cont")) { //검색필드 == 글내용
				sql += " where sc_cont like ?";
			}else if(findsb.getFind_field().equals("sc_id")) { //검색필드 == 아이디
				sql += " where sc_id likd ?";
			}
			//추후 다른것도 추가할 것.
			pt = con.prepareStatement(sql);
			
			if(findsb.getFind_field() != null) {
				pt.setString(1, findsb.getFind_name());
			}
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return count;
	}
	
	//조회수증가
	public void updateHit(int sc_no) {
		// TODO Auto-generated method stub
		try {
			con = ds.getConnection();
			sql = "update scboard set sc_hit = sc_hit+1 where sc_no=?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, sc_no);
			
			pt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	//글내용
	public SCBoardVO getBoardCont(int sc_no) {
		// TODO Auto-generated method stub
		SCBoardVO sb = null;
		
		try {
			con = ds.getConnection();
			sql = "select * from scboard where sc_no=?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, sc_no);
			
			rs = pt.executeQuery();
			if(rs.next()) {
				sb = new SCBoardVO();
				
				sb.setSc_no(rs.getInt("sc_no"));
				sb.setSc_id(rs.getString("sc_id"));
				sb.setSc_title(rs.getString("sc_title"));
				sb.setSc_playdate(rs.getString("sc_playdate"));
				sb.setSc_cont(rs.getString("sc_cont"));
				sb.setSc_file(rs.getString("sc_file"));
				sb.setSc_hit(rs.getInt("sc_hit"));
				sb.setSc_ref(rs.getInt("sc_ref"));
				sb.setSc_step(rs.getInt("sc_step"));
				sb.setSc_level(rs.getInt("sc_level"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return sb;
	}
	
	//글내용(플레이날짜와 아이디 기준)
	public SCBoardVO getBoardCont(String sc_playdate,String sc_id) {
		// TODO Auto-generated method stub
		SCBoardVO sb = null;
		
		try {
			con = ds.getConnection();
			sql = "select * from scboard where sc_playdate=? and sc_id=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sc_playdate);
			pt.setString(2, sc_id);
			
			rs = pt.executeQuery();
			if(rs.next()) {
				sb = new SCBoardVO();
				
				sb.setSc_no(rs.getInt("sc_no"));
				sb.setSc_id(rs.getString("sc_id"));
				sb.setSc_title(rs.getString("sc_title"));
				sb.setSc_playdate(rs.getString("sc_playdate"));
				sb.setSc_file(rs.getString("sc_file"));
				sb.setSc_cont(rs.getString("sc_cont"));
				sb.setSc_hit(rs.getInt("sc_hit"));
				sb.setSc_ref(rs.getInt("sc_ref"));
				sb.setSc_step(rs.getInt("sc_step"));
				sb.setSc_level(rs.getInt("sc_level"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return sb;
	}
	
	//글내용수정
	public void updateBoard(SCBoardVO sc) {
		// TODO Auto-generated method stub
		try {
			con = ds.getConnection();
			sql = "update scboard set sc_title=?,sc_playdate=?,sc_cont=?,sc_file=? where sc_no=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sc.getSc_title());
			pt.setString(2, sc.getSc_playdate());
			pt.setString(3, sc.getSc_cont());
			pt.setString(4, sc.getSc_file());
			pt.setInt(5, sc.getSc_no());
			
			pt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	//게시판지우기
	public void delBoard(SCBoardVO sb) {
		// TODO Auto-generated method stub
		try {
			con = ds.getConnection();
			sql = "delete from scboard where sc_no=?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, sb.getSc_no());
			
			pt.executeUpdate();
			
			sql = "delete from score_card where s_id=? and s_date=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sb.getSc_id());
			pt.setString(2, sb.getSc_playdate());
			
			pt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	//답글
	public void replyBoard(SCBoardVO sb) {
		// TODO Auto-generated method stub
		try {
			con = ds.getConnection();
			sql = "update scboard set sc_level=sc_level+1 where sc_ref=? and sc_level > ?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, sb.getSc_ref());
			pt.setInt(2, sb.getSc_level());
			
			pt.executeUpdate();
			
			sql = "insert into scboard (sc_no,sc_id,sc_title,sc_cont,sc_ref,sc_step,sc_level,sc_date)"
					+ " values(test_scboard_seq.nextval,?,?,?,?,?,?,sysdate)";
			pt = con.prepareStatement(sql);
			pt.setString(1, sb.getSc_id());
			pt.setString(2, sb.getSc_title());
			pt.setString(3, sb.getSc_cont());
			pt.setInt(4, sb.getSc_ref());
			pt.setInt(5, sb.getSc_step()+1);
			pt.setInt(6, sb.getSc_level()+1);
			
			pt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	
	public String getUploadDate(String id,String playdate) {
		String sc_date = "";
		
		try {
			con = ds.getConnection();
			sql = "select sc_date from scboard where sc_id=? and sc_playdate=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			pt.setString(2, playdate);
			
			rs = pt.executeQuery();
			if(rs.next()) {		
				sc_date = rs.getString(1);
				sc_date = sc_date.substring(0, 10);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}
		
		return sc_date;
	}
	
	public void closeAll() {
		try {
			if(rs != null) rs.close();
			if(pt != null) pt.close();
			if(con != null) con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	

	
}
