package com.GolForYou.dao;

import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.GolForYou.vo.rankDTO;

public class rankDAO extends DBInfo{
	
	rankDTO rdto = new rankDTO();
	
	public rankDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/xe"); //Ŀ�ؼ� Ǯ ���� ds����
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int memberCount() { //�˻����ǿ� �´� �Խù� ���� ��ȯ
		int totalCount = 0;
		
		try {
			con = ds.getConnection();
			sql = "select count(*) from ranking";
			pt = con.prepareStatement(sql);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return totalCount;
	}
	
	public int memberCount(String prov) { //�˻����ǿ� �´� �Խù� ���� ��ȯ
		int totalCount = 0;
		
		try {
			con = ds.getConnection();
			sql = "select count(*) from ranking where r_province=?";			
			pt = con.prepareStatement(sql);
			pt.setString(1, prov);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return totalCount;
	}
	
	
	public List<rankDTO> rankInformation() {
		List<rankDTO> rlist = new ArrayList<>();
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
			sql = "select * from ranking order by r_sum asc";
			pt = con.prepareStatement(sql);
			
			rs = pt.executeQuery();
			
			while(rs.next()) {
				rankDTO r = new rankDTO();
				r.setR_no(rs.getInt(1));
				r.setR_id(rs.getString(2));
				r.setR_sum(rs.getInt(3));
				r.setR_avg(rs.getInt(4));
				r.setR_putting(rs.getInt(5));
				r.setR_maxrange(rs.getInt(6));
				r.setR_avgrange(rs.getInt(7));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		
		return rlist;
	}
	
	public List<String> rankId() {
		List<String> id = new ArrayList<>();
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
			sql = "select r_id from ranking order by r_sum asc";
			pt = con.prepareStatement(sql);
			
			rs = pt.executeQuery();
			
			while(rs.next()) {
				id.add(rs.getString(1));
				id.add(rs.getString(2));
				id.add(rs.getString(3));
				id.add(rs.getString(4));
				id.add(rs.getString(5));
				id.add(rs.getString(6));
				id.add(rs.getString(7));
				id.add(rs.getString(8));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return id;
	}
	
	public int rankSum(String id) {
		int sum = 9999;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
			sql = "select r_sum from ranking where r_id=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			
			if(rs.next()) {
				sum = rs.getInt("r_sum");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}
		return sum;
	}
	
	public int playCount(String id) {
		int count = 0;
		
		try {
			con = ds.getConnection();
			sql = "select count(*) from score_card where s_id=? and s_updated=1";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
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
	

	public int getBestRange(String id){
		int range = -1;		
		try {
			con = ds.getConnection();
			sql = "select s_range from score_card where s_id=? and not s_range is null order by s_range desc";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			if(rs.next()) {		
				range = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}		
		return range;
	}
	
	public int getRowNum(String id){
		int num = 0;		
		try {
			con = ds.getConnection();
			sql = "select r_id from (select * from ranking order by r_sum asc)";
			pt = con.prepareStatement(sql);
			
			rs = pt.executeQuery();
			while(rs.next()) {		
				num++;
				if(id.equals(rs.getString("r_id"))) {
					break;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}		
		return num;
	}
	
	
	public List<String> getHonor_id(){
		List<String> rlist = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			sql = "select r_id from ranking order by r_sum asc";
			pt = con.prepareStatement(sql);
			
			rs = pt.executeQuery();
			
			while(rs.next()) {
				rlist.add(rs.getString("r_id"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}	
		return rlist;
	}
	
	
	public List<Integer> getHonor_sum() {
		List<Integer> rlist = new ArrayList<>();
		
		try {
			con = ds.getConnection();
			sql = "select r_sum from ranking order by r_sum asc";
			pt = con.prepareStatement(sql);
			
			rs = pt.executeQuery();
			
			while(rs.next()) {
				rlist.add(rs.getInt("r_sum"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeAll();
		}	
		return rlist;
	}
	
		
	public int sumAvgScore(String id){
		int ascore = 0;		
		try {
			con = ds.getConnection();
			sql = "select s_sumscore from score_card where s_id=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			
			rs = pt.executeQuery();
			while(rs.next()) {		
				ascore += rs.getInt("s_sumscore");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {			
			closeAll();
		}		
		return ascore;
	}
	
	
	public void updateAvgScore(Double score,String id) {
		try {
			con = ds.getConnection();
			sql = "update ranking set r_sum=? where r_id=?";
			pt = con.prepareStatement(sql);
			pt.setDouble(1, score);
			pt.setString(2, id);
			
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
