package com.GolForYou.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.GolForYou.vo.ClassIngVO;
import com.GolForYou.vo.ClassVO;

public class ClassDAOImpl {

	Connection con=null;//DB연결
	PreparedStatement pt=null; //쿼리문 수행
	ResultSet rs=null;//검색 결과 레코드를 저장 rs
	DataSource ds=null;//DBCP 커넥션풀 관리 ds
	String sql=null;

	public ClassDAOImpl() {
		try {
			Context ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");//커넥션 풀 관리 ds생성
		}catch(Exception e) {e.printStackTrace();}
	}//생성자

	//클래스 정보 조회
	public ClassVO productDetail(int c_no) {
		ClassVO cv = new ClassVO();

		try {
			con = ds.getConnection(); // DB 커넥션
			sql = "select * from golf_class where c_no = ?"; // select 쿼리
			pt = con.prepareStatement(sql);

			pt.setInt(1, c_no); //파라미터 세팅 '?' 순서대로 1부터 시작 
			rs = pt.executeQuery();  // 쿼리 실행

			while(rs.next()) { // 쿼리 실행 후 다음데이터(next로 구분)가 있는지 확인
				// cv에 select 한 값 세팅
				cv.setC_no(rs.getInt("c_no"));
				cv.setC_title(rs.getString("c_title"));
				cv.setC_teacher(rs.getString("c_teacher"));
				cv.setC_career(rs.getString("c_career"));
				cv.setC_phone(rs.getString("c_phone"));
				cv.setC_gender(rs.getString("c_gender"));
				cv.setC_kind(rs.getString("c_kind"));
				cv.setC_info(rs.getString("c_info"));
				cv.setC_desc(rs.getString("c_desc"));
				cv.setC_time(rs.getString("c_time"));
				cv.setC_count(rs.getInt("c_count"));
				cv.setC_price(rs.getString("c_price"));
				cv.setC_addr(rs.getString("c_addr"));
				cv.setC_image(rs.getString("c_image"));
			}
		} catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			} catch(Exception e) {e.printStackTrace();}
		}

		System.out.println("return cv >>>" + cv);
		return cv; // 상품상세 데이터를 리턴 한건이므로 객체로 리턴 리스트의 경우라면 List<vo>로 리턴해야 함.
	}

	//결제 정보 저장
	public void insertClassIng(ClassIngVO ci) {

		int result = 0;

		try {
			con = ds.getConnection(); // DB 커넥션
			sql = "insert into class_ing(m_no, c_no) values(?,?)"; // select 쿼리
			pt = con.prepareStatement(sql);
			pt.setInt(1, ci.getM_no()); //파라미터 세팅 '?' 순서대로 1부터 시작 
			pt.setInt(2, ci.getC_no());
			pt.executeUpdate();  // 쿼리 실행

			result = 1;

		} catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			} catch(Exception e) {e.printStackTrace();}
		}

		System.out.println("classing 테이블 insert 성공 : " + result);
	}

	//결제 정보 조회
	public ClassVO selectMyClass(int c_no) {
		ClassVO cv = new ClassVO();

		try {
			con = ds.getConnection(); // DB 커넥션
			sql = "select * from golf_class where c_no = ?"; // select 쿼리
			pt = con.prepareStatement(sql);

			pt.setInt(1, c_no); //파라미터 세팅 '?' 순서대로 1부터 시작 
			rs = pt.executeQuery();  // 쿼리 실행

			while(rs.next()) { // 쿼리 실행 후 다음데이터(next로 구분)가 있는지 확인
				// cv에 select 한 값 세팅
				cv.setC_no(rs.getInt("c_no"));
				cv.setC_title(rs.getString("c_title"));
				cv.setC_info(rs.getString("c_info"));
				cv.setC_desc(rs.getString("c_desc"));
				cv.setC_time(rs.getString("c_time"));
				cv.setC_count(rs.getInt("c_count"));
				cv.setC_price(rs.getString("c_price"));
				cv.setC_image(rs.getString("c_image"));
			}
		} catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			} catch(Exception e) {e.printStackTrace();}
		}

		System.out.println("return cv >>>" + cv);
		return cv; // 상품상세 데이터를 리턴 한건이므로 객체로 리턴 리스트의 경우라면 List<vo>로 리턴해야 함.
	}		

	// 클래스 등록
	public void insertClass(ClassVO cv) {
		System.out.println(cv);
		int result = 0;
		
		try {
			con = ds.getConnection(); // DB 커넥션
			sql = "insert into golf_class(c_no, c_title, c_teacher, c_career, c_phone,"
					+ " c_gender,c_kind, c_info,c_desc,c_time,c_count,c_price,c_addr,c_image) "
					+ "values(class_no_seq.NEXTVAL, ?,?,?,?,?,?,?,?,?,?,?,?,?)"; // select 쿼리
			
			pt = con.prepareStatement(sql);
			pt.setString(1, cv.getC_title()); //파라미터 세팅 '?' 순서대로 1부터 시작 
			pt.setNString(2, cv.getC_teacher());
			pt.setString(3, cv.getC_career());
			pt.setString(4, cv.getC_phone());
			pt.setString(5, cv.getC_gender());
			pt.setString(6, cv.getC_kind());
			pt.setString(7, cv.getC_info());
			pt.setString(8, cv.getC_desc());
			pt.setString(9, cv.getC_time());
			pt.setInt(10, cv.getC_count());
			pt.setString(11, cv.getC_price());
			pt.setString(12, cv.getC_addr());
			pt.setString(13, cv.getC_image());
			pt.executeUpdate();  // 쿼리 실행

			result = 1;

		} catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			} catch(Exception e) {e.printStackTrace();}
		}
		
		System.out.println("insert 성공 확인(성공 시 1) : " + result);
		
	}

}