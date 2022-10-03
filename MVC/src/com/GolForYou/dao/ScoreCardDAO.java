package com.GolForYou.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.GolForYou.vo.ScoreCardDTO;

public class ScoreCardDAO extends DBInfo{
	
	public ScoreCardDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/xe"); //커넥션 풀 관리 ds생성
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ScoreCardDTO> ScoreInfo(String id){
		List<ScoreCardDTO> slist = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			sql = "select * from score_card where s_id=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				ScoreCardDTO sdto = new ScoreCardDTO();
				sdto.setS_id(rs.getString("s_id"));
				sdto.setS_location(rs.getString("s_location"));
				sdto.setS_putting(rs.getInt("s_putting"));
				sdto.setS_range(rs.getInt("s_range"));
				sdto.setS_handicap(rs.getInt("s_handicap"));
				sdto.setS_date(rs.getString("s_date"));
				sdto.setS_sumscore(rs.getInt("s_sumscore"));
				
				slist.add(sdto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return slist;
	}
	
	public int monthConut(String id,String month) {
		Calendar cal = Calendar.getInstance();
		int intyear = cal.get(Calendar.YEAR);
		String year = Integer.toString(intyear);
		int monthCount = -1;
		try {
			con = ds.getConnection();
			sql = "select count(s_date) from score_card where s_id=? and s_date like ?";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			pt.setString(2, year+"_"+month+"%");
			
			rs = pt.executeQuery();
			if(rs.next()) {
				monthCount = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return monthCount;
	}
	
	//게시판에 글쓰면 레코드 자동생성, 나머지는 관리자(알바생)가 직접 입력하게 update하는 메소드 만들어줘야함
	public void autoInsert(String id, String playdate) {
		try {
			con = ds.getConnection();
			sql = "insert into score_card(s_id,s_date) values (?,?)";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			pt.setString(2, playdate);
			
			pt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	//날짜정렬용
	public String makeDate(String id,String date) {
		String newDate = "";
		try {
			con = ds.getConnection();
			sql = "select s_date from score_card where s_id=? and s_date=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			pt.setString(2, date);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				StringTokenizer str = new StringTokenizer(rs.getString(1),"_");
		
				while(str.hasMoreTokens()) {
					newDate += str.nextToken();
				}				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return newDate;
	}
	
	
	public void sortDate(String s_id, String s_date, int numdate) {
		// TODO Auto-generated method stub
		try {
			con = ds.getConnection();
			sql = "update score_card set s_sort=? where s_id=? and s_date=?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, numdate);
			pt.setString(2, s_id);
			pt.setString(3, s_date);
			
			pt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	//playdate랑 업로드한date 구하기
	public List<String> getDate(String id){
		List<String> slist = new ArrayList<>();		
		try {
			con = ds.getConnection();
			sql = "select s_date from score_card where s_id=? order by s_sort desc";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			while(rs.next()) {		
				slist.add(rs.getString("s_date"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}
		
		return slist;
	}
	
	
	public List<String> getLocation(String id){
		List<String> slist = new ArrayList<>();		
		try {
			con = ds.getConnection();
			sql = "select s_location from score_card where s_id=? order by s_sort desc";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			while(rs.next()) {		
				slist.add(rs.getString("s_location"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}
		
		return slist;
	}
	
	
	public List<Integer> getBestScore(String id){
		List<Integer> slist = new ArrayList<>();		
		try {
			con = ds.getConnection();
			sql = "select s_bestscore from score_card where s_id=? order by s_sort desc";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			while(rs.next()) {		
				slist.add(rs.getInt("s_bestscore"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}
		
		return slist;
	}
	
	
	public List<Integer> getRange(String id){
		List<Integer> slist = new ArrayList<>();		
		try {
			con = ds.getConnection();
			sql = "select s_range from score_card where s_id=? order by s_sort desc";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			while(rs.next()) {		
				slist.add(rs.getInt("s_range"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}
		
		return slist;
	}
	
	
	public List<Integer> getPutting(String id){
		List<Integer> slist = new ArrayList<>();		
		try {
			con = ds.getConnection();
			sql = "select s_putting from score_card where s_id=? order by s_sort desc";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			while(rs.next()) {		
				slist.add(rs.getInt("s_putting"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}
		
		return slist;
	}
		
	public int getUpdated(String id,String date){
		int slist = -1;		
		try {
			con = ds.getConnection();
			sql = "select s_updated from score_card where s_id=? and s_date=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			pt.setString(2, date);
			
			rs = pt.executeQuery();
			if(rs.next()) {		
				slist = rs.getInt("s_updated");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}
		
		return slist;
	}
	
	
	public String getHandicap(String id){
		String handicap = "";		
		try {
			con = ds.getConnection();
			sql = "select s_handicap from score_card where s_id=? order by s_sort desc";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			if(rs.next()) {		
				handicap = rs.getString("s_handicap");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}
		
		return handicap;
	}
	
	public int getCount(String id){
		int cnt = 0;		
		try {
			con = ds.getConnection();
			sql = "select count(*) from score_card where s_id=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			if(rs.next()) {		
				cnt = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}		
		return cnt;
	}
	

	
	public void delCard(String s_id,String s_date) {
		try {
			con = ds.getConnection();
			sql = "delete from score_card where s_id=? and s_date=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, s_id);
			pt.setString(2, s_date);
			
			pt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
	}
	
	
		
	public void updateCard(ScoreCardDTO sdto) {
		try {
			con = ds.getConnection();
			sql = "update score_card set s_location=?,s_putting=?,s_range=?,s_handicap=?,s_bestscore=?,s_sumscore=?,s_updated=1 where s_id=? and s_date=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sdto.getS_location());
			pt.setDouble(2, sdto.getS_putting());
			pt.setInt(3, sdto.getS_range());
			pt.setInt(4, sdto.getS_handicap());
			pt.setInt(5, sdto.getS_bestscore());
			pt.setDouble(6, sdto.getS_sumscore());
			pt.setString(7, sdto.getS_id());
			pt.setString(8, sdto.getS_date());
			
			pt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
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
