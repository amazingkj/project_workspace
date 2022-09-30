package com.GolForYou.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.GolForYou.vo.MemberVO;
import com.GolForYou.vo.rankDTO;

public class MemberDAOImpl {//회원관리 JDBC

	Connection con=null;//DB연결
	PreparedStatement pt=null; //쿼리문 수행
	ResultSet rs=null;//검색 결과 레코드를 저장 rs
	DataSource ds=null;//DBCP 커넥션풀 관리 ds
	String sql=null;
	
	public MemberDAOImpl() {
		try {
			Context ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");//server.xml의 xe를 JNDI
			//디렉토리 서비스로 찾아서 커넥션 풀 관리 ds 생성
		}catch(Exception e) {
			e.printStackTrace();
		}
	}//생성자
	
	//아이디 중복검색
	public MemberVO idCheck(String id) {
		MemberVO m=null;
		
		try {
			con=ds.getConnection();//커넥션 풀 관리 ds로 db연결 con생성
			sql="select * from golformemberNew where m_id=?";
			pt = con.prepareStatement(sql);//쿼리문을 미리 컴파일하여 수행할 pt생성
			pt.setString(1,id);//쿼리문의 첫번째 물음표에 문자열로 아이디저장
			rs=pt.executeQuery();//검색 쿼리문 수행후 결과레코드를 rs에 저장
			
			if(rs.next()) {//다음 레코드 행이 존재하면 참
				m=new MemberVO();
				m.setM_id(rs.getString("m_id"));//m_id컬럼으로 부터 문자열로 아이디값을
				//가져와서 setter()메서드에 저장
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
			    if(rs != null) rs.close();
			    if(pt != null) pt.close();
			    if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return m;
	}//idCheck()
	
	//이메일 중복 검사
	public MemberVO emailCheck(String email) {
		MemberVO m=null;
		
		try {
			con=ds.getConnection();//커넥션 풀 관리 ds로 db연결 con생성
			sql="select * from golformemberNew where m_email=?";
			pt = con.prepareStatement(sql);//쿼리문을 미리 컴파일하여 수행할 pt생성
			pt.setString(1,email);//쿼리문의 첫번째 물음표에 문자열로 아이디저장
			rs=pt.executeQuery();//검색 쿼리문 수행후 결과레코드를 rs에 저장
			
			if(rs.next()) {//다음 레코드 행이 존재하면 참
				m=new MemberVO();
				m.setM_email(rs.getString("m_email"));//m_id컬럼으로 부터 문자열로 아이디값을
				//가져와서 setter()메서드에 저장
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
			    if(rs != null) rs.close();
			    if(pt != null) pt.close();
			    if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return m;
	}//emailCheck()
	
	
	
	
	//회원저장
	public int insertMember(MemberVO m, rankDTO r) {
		int re=-1;//삭제 실패시 반환값
		
		try {
			con=ds.getConnection();
			sql="insert into golformemberNew (m_no,m_id,m_pw,m_phone,m_email,m_gender,m_date,m_state)"
					+ "values(m_golf_seq.nextval,?,?,?,?,?,sysdate,1)";
			
			pt=con.prepareStatement(sql);
			pt.setString(1,m.getM_id());
			pt.setString(2,m.getM_pw());
			pt.setString(3,m.getM_phone());
			pt.setString(4,m.getM_email());
			pt.setString(5,m.getM_gender());
	
			re=pt.executeUpdate();//저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
			
			sql="insert into ranking (r_no,r_id,r_province)"
					+ "values(test_r_no.nextval,?,?)";
			
			
			pt=con.prepareStatement(sql);
			pt.setString(1,r.getR_id());
			pt.setString(2,r.getR_province());
			
			re=pt.executeUpdate();
		
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
			 if(pt != null) pt.close();
			 if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return re;
	}//insertMember()
	

	//로그인 인증처리
	public MemberVO loginCheck(String id) {
		MemberVO m=null;
		
		try {
			con=ds.getConnection();
			sql="select * from golformemberNew where m_id=? and m_state=1";
			//아이디와 가입회원 1인 경우만 로그인 인증
			pt=con.prepareStatement(sql);//쿼리문을 미리 컴파일 해서 수행할 pt생성
			pt.setString(1,id);
			rs=pt.executeQuery();
			
			if(rs.next()) {
				m=new MemberVO();
				m.setM_pw(rs.getString("m_pw"));
				m.setM_file(rs.getString("m_file"));//프로필 사진 경로를 저장
				
			
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return m;
	}//loginCheck()
	
	
	
	//로그인 정보값 받아오기
	public MemberVO logininfo(String id) {
		MemberVO m=null;
		
		try {
			con=ds.getConnection();
			sql="select * from golformemberNew where m_id=? and m_state=1";
			//아이디와 가입회원 1인 경우만 로그인 인증
			pt=con.prepareStatement(sql);//쿼리문을 미리 컴파일 해서 수행할 pt생성
			pt.setString(1,id);
			rs=pt.executeQuery();
			
			while(rs.next()) {
				m=new MemberVO();
				m.setM_pw(rs.getString("m_pw"));
				m.setM_file(rs.getString("m_file"));//프로필 사진 경로
				m.setM_addr(rs.getString("m_addr"));
				m.setM_email(rs.getString("m_email"));
				m.setM_phone(rs.getString("m_phone"));
				
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return m;
	}//loginCheck()
	
	
	public String fileinfo(String id) {
		String m=null;
		
		try {
			con=ds.getConnection();
			sql="select m_file from golformemberNew where m_id=?";
			//아이디와 가입회원 1인 경우만 로그인 인증
			pt=con.prepareStatement(sql);//쿼리문을 미리 컴파일 해서 수행할 pt생성
			pt.setString(1,id);
			rs=pt.executeQuery();
			
			while(rs.next()) {
				m = rs.getString("m_file");				
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return m;
	}//loginCheck()
	
	
	//회원 정보 수정 
	public void updateMember(MemberVO m, rankDTO r) {
	
		
		try {
			con=ds.getConnection();
			sql="update golformemberNew set m_phone=?, m_addr=?, m_email=?, m_file=? where m_id=?";
			
			pt=con.prepareStatement(sql);
			pt.setString(1, m.getM_phone());
			pt.setString(2, m.getM_addr());
			pt.setString(3, m.getM_email());
			pt.setString(4, m.getM_file());
			pt.setString(5, m.getM_id());
			
			
			pt.executeUpdate();  
			
			
			sql="update ranking set r_province=? where r_id=?";
			
			
			pt=con.prepareStatement(sql);
			pt.setString(1,r.getR_province());
			pt.setString(2,r.getR_id());
			
			pt.executeUpdate();
		
					
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(pt != null) pt.close();
				if(con !=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
			
		}
	
	}//updateMember()

	public void delMember(MemberVO dm) {
		try {
			con=ds.getConnection();
			sql="update golformemberNew set m_delcont=?, m_deldate=sysdate, m_state=2 where m_id=?";
			
			pt=con.prepareStatement(sql);
			pt.setString(1, dm.getM_delcont());
			pt.setString(2, dm.getM_id());
			pt.executeUpdate();
			
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(pt != null) pt.close();
				if(con !=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
			
		
		}
		
	}//delMember()
	
	
	
	//비밀번호 찾기에서 메일로 보낼 아이디와 비밀번호 추출하기 
	public MemberVO MailSender(String email) {
		MemberVO pm=null;
		try {
			con=ds.getConnection();
			sql="select m_id,m_pw from golformemberNew where m_email=? and m_state=1";
			
			pt=con.prepareStatement(sql);
			pt.setString(1, email);
			pt.executeUpdate();
			rs=pt.executeQuery();
			
			if(rs.next()) {
				pm=new MemberVO();
				pm.setM_id(rs.getString("m_id"));
				pm.setM_pw(rs.getString("m_pw"));
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				  if(rs != null) rs.close();
				  if(pt != null) pt.close();
				if(con !=null) con.close();
				
			}catch(Exception e) {e.printStackTrace();}		
		}
		return pm;
		
	}//MailSender()
	
	
	//비밀번호 수정
	public void updatePassword(MemberVO m) {
		try {
			con=ds.getConnection();
			sql="update golformemberNew set m_pw=? where m_id=?";
			
			pt=con.prepareStatement(sql);
			pt.setString(1, m.getM_pw());
			pt.setString(2, m.getM_id());
			
			
			pt.executeUpdate();  
					
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(pt != null) pt.close();
				if(con !=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
			
		}
		
	}


	//아이디에 해당하는 회원정보 가져오기	
	public MemberVO getMember(String id) {
		MemberVO m=null;
		try {
			con=ds.getConnection(); //커넥션 풀로 db연결 con 생성 
			sql="select m_id,m_pw from golformemberNew where m_id=?";
			pt=con.prepareStatement(sql);//쿼리문을 미리 컴파일하여 수행할 pt 생성 
			pt.setString(1, id);//쿼리문의 첫번째 물음표에 문자열로 아이디 저장 
			rs=pt.executeQuery();//select문 수행 결과를 rs에 저장 
			if(rs.next()) {//검색된 다음 레코드 행이 존재하면 참. 검색결과가 하나인 경우 실행 
					m=new MemberVO();
					m.setM_id(rs.getString("m_id"));
					//mem_id컬럼으로부터 문자열을 회원아이디 레코드로 가져와서 해당 setter메서드에 저장 
					m.setM_pw(rs.getString("m_pw"));
				
			}
			
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs !=null) rs.close();
				if(pt !=null) pt.close();
				if(con !=null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		
		return m; 
	}//getMember
	

	
}
























