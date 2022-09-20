package net.golf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.golf.vo.BoardVO;

public class BoardDAOImpl {//게시판 DB연동

	Connection con=null;//DB연결 con
	PreparedStatement pt=null;//쿼리문 수행 pt
	ResultSet rs=null;//검색 결과 레코드를 저장할 rs
	DataSource ds=null;//커넥션 풀 관리 ds
	String sql=null;//쿼리문 저장변수
	
	public BoardDAOImpl() {
		try {
			Context ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/xe");//커넥션 풀 관리 ds생성
		}catch(Exception e) {
			e.printStackTrace();
		}
	}//기본생성자
	
	//검색전,검색후 레코드 개수
	public int getListCount(BoardVO findB) {
		int count=0;//검색 레코드 개수
		
		try {
			con=ds.getConnection();//커넥션풀 관리 ds로 con생성
			sql="select count(b_no) from golforboard ";
			if(findB.getFind_field() == null) {//검색전 총 레코드 개수
				sql += "";
			}else if(findB.getFind_field().equals("b_title")) {//검색필드가 글제목인 경우
				sql+=" where b_title like ?";
			}else if(findB.getFind_field().equals("b_cont")) {//검색필드가 글내용인 경우
				sql+=" where b_cont like ?";//like는 ~와 비슷한 문자를 찾는다.검색연산자
			}else if(findB.getFind_field().equals("b_name")) {//검색필드가 글쓴이인 경우
			sql+=" where b_name like ?";//like는 ~와 비슷한 문자를 찾는다.검색연산자
			}else if(findB.getFind_field().equals("title_cont")) {//title+cont
			sql+=" where b_title like ? or b_cont like ?";
			}
			
			pt=con.prepareStatement(sql);//쿼리문을 미리 컴파일 해서 수행할 pt생성
			
			if(findB.getFind_field() != null) {//검색필드가 있는 경우
				pt.setString(1,findB.getFind_name());//쿼리문의 첫번째 물음표에 문자열로 검색어를 저장
				pt.setString(2,findB.getFind_name());
			}
			
			rs=pt.executeQuery();//검색 쿼리문 수행후 결과 레코드를 rs에 저장
			
			if(rs.next()) {
				count=rs.getInt(1);//검색 전후 레코드 개수를 저장
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return count;
	}//getListCount()
	
	
	//검색전 후 목록
	public List<BoardVO> getBoardList(int page,int limit,BoardVO findB){
		List<BoardVO> blist=new ArrayList<>();
		
		try {
			con=ds.getConnection();
			
			sql="select * from (select rowNum rNum,b_no,b_name,b_title, "
+"b_hit,b_ref,b_step,b_level,b_date,b_like from (select * from golforboard ";
			if(findB.getFind_field() == null) {//검색전
				sql+="";
			}else if(findB.getFind_field().equals("b_title")) {//제목을 검색할 경우
				sql+=" where b_title like ?";
			}else if(findB.getFind_field().equals("b_cont")) {//글내용을 검색할 경우
				sql+=" where b_cont like ?";
			}else if(findB.getFind_field().equals("b_name")) {//검색필드가 글쓴이인 경우
				sql+=" where b_name like ?";//like는 ~와 비슷한 문자를 찾는다.검색연산자
			}else if(findB.getFind_field().equals("title_cont")) {//title+cont
				sql+=" where b_title like ? or b_cont like ?";
				
				
			}
			sql+=" order by b_ref desc,b_level asc)) where rNum >= ? and rNum<=? ";
			/* 페이징과 검색관련 쿼리문. rowNum컬럼은 오라클에서 테이블 생성시 추가해 주는 컬럼으로 최초 레코드 저장시
			 * 일련 번호값이 알아서 저장된다.rNum은 rowNum컬럼의 별칭이름이다.
			 */
			
			
			pt=con.prepareStatement(sql);
			
			int startrow=(page-1)*10+1;//읽기 시작할 행번호
			int endrow=startrow+limit-1;//읽을 마지막 행번호
			
			if(findB.getFind_field() != null) {//검색하는 경우
				pt.setString(1,findB.getFind_name());
				pt.setString(2,findB.getFind_name());
				pt.setInt(3,startrow);
				pt.setInt(4,endrow);
			}else {//검색하지 않는 경우
				pt.setInt(1,startrow);
				pt.setInt(2,endrow);
			}
			
			rs=pt.executeQuery();
			
			while(rs.next()) {
				BoardVO b=new BoardVO();
				b.setB_no(rs.getInt("b_no"));//board_no컬럼으로 부터 정수 숫자로 번호 레코드값을 가져와
				//서 setter()메서드에 저장
				b.setB_name(rs.getString("b_name"));
				b.setB_title(rs.getString("b_title"));
				b.setB_hit(rs.getInt("b_hit"));
				b.setB_ref(rs.getInt("b_ref"));
				b.setB_step(rs.getInt("b_step"));
				b.setB_date(rs.getString("b_date"));
				b.setB_step(rs.getInt("b_like"));
				
				blist.add(b);//컬렉션에 추가
			}
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(rs != null)rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return blist;
	}//getBoardList()
	
	
	//서블릿 MVC게시판 저장
	public void insertBoard(BoardVO b) {
		try {
			con=ds.getConnection();
		    sql="insert into golforboard (b_no,b_name,b_title,b_cont,"
+"b_ref,b_step,b_level,b_date) values(board_no_seq.nextval,'test',?,?,"
+"board_no_seq.nextval,?,?,sysdate)";
		    
		    pt=con.prepareStatement(sql);
		    //pt.setString(1, b.getB_name());  --일단 test로 처리
		    pt.setString(1, b.getB_title());	
		    pt.setString(2, b.getB_cont());
		    pt.setInt(3,0);
		    pt.setInt(4,0);
		    
		    pt.executeUpdate();//저장 쿼리문을 수행
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}//insertBoard()

	//조회수 증가
	public void updateHit(int b_no) {
		try {
			con=ds.getConnection();
			sql="update golforboard set b_hit=b_hit+1 where b_no=?";
			pt=con.prepareStatement(sql);
			pt.setInt(1,b_no);
			pt.executeUpdate();
			
		}catch(Exception e) {e.printStackTrace();}
		finally {
		  try {
			  if(pt != null) pt.close();
			  if(con != null) con.close();
		  }catch(Exception e) {e.printStackTrace();}
		}		
	}//updateHit()

	
	//내용보기+수정폼+답변폼+삭제폼
	public BoardVO getBoardCont(int b_no) {
		BoardVO bc=null;
		
		try {
			con=ds.getConnection();
			sql="select * from golforboard where b_no=?";
			pt=con.prepareStatement(sql);
			pt.setInt(1,b_no);
			rs=pt.executeQuery();
			
			if(rs.next()) {
				bc=new BoardVO();
				bc.setB_no(rs.getInt("b_no"));
				bc.setB_name(rs.getString("b_name"));
				bc.setB_title(rs.getString("b_title"));
				bc.setB_pwd(rs.getString("b_pwd"));
				bc.setB_cont(rs.getString("b_cont"));
				bc.setB_hit(rs.getInt("b_hit"));
				bc.setB_ref(rs.getInt("b_ref"));
				bc.setB_step(rs.getInt("b_step"));
				bc.setB_level(rs.getInt("b_level"));
				bc.setB_level(rs.getInt("b_like"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return bc;
	}//getBoardCont()

	//답변 저장
	public void replyBoard(BoardVO rb) {
		try {
			con=ds.getConnection();
			sql="update golforboard set b_level=b_level+1 where b_ref=? and "
					+" b_level > ?";
			pt=con.prepareStatement(sql);
			pt.setInt(1,rb.getB_ref());
			pt.setInt(2,rb.getB_level());
			pt.executeUpdate();//수정 쿼리문 수행
			
			sql="insert into golforboard (b_no,b_name,b_title,b_pwd,b_cont,"
+"b_ref,b_step,b_level,b_date,b_like) values(board_no_seq.nextval,?,?,?,?,?,?,?,"
+"sysdate,?)"; 
			pt=con.prepareStatement(sql);
			pt.setString(1,rb.getB_name());
			pt.setString(2,rb.getB_title());
			pt.setString(3,rb.getB_pwd());
			pt.setString(4,rb.getB_cont());
			pt.setInt(5,rb.getB_ref());
			pt.setInt(6,rb.getB_step()+1);
			pt.setInt(7,rb.getB_level()+1);
			pt.setInt(7,rb.getB_like());
			pt.executeUpdate();//저정 쿼리문 수행
			
		}catch(Exception e) {e.printStackTrace();}
		finally {
			try {
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {e.printStackTrace();}
		}
	}//replyBoard()
	


	   public void updateBoard(BoardVO eb) {
		      try {
		         con=ds.getConnection();
		         sql="update golforboard set b_id=?,b_title=?,b_cont=? where b_no=?";
		         pt=con.prepareStatement(sql);
		         pt.setString(1,eb.getB_name());
		         pt.setString(2, eb.getB_title());
		         pt.setString(3, eb.getB_cont());
		         pt.setInt(4, eb.getB_no());
		         
		         pt.executeUpdate();
		         
		      }catch(Exception e) {e.printStackTrace();}
		      finally {
		         try {
		            if(pt != null) pt.close();
		            if(con != null) con.close();
		         }catch(Exception e) {e.printStackTrace();}
		      }
		   }//updateBoard()


	   public void delBoard(int b_no) {
		      try {
		         con=ds.getConnection();
		         sql = "delete from golforboard where b_no=?";
		          pt = con.prepareStatement(sql);
		          pt.setInt(1, b_no);
		               
		          pt.executeUpdate();

		      }catch (Exception e) {
		       e.printStackTrace();
		      }
		      finally {
		         try {
		            if(pt != null)pt.close();
		            if(con != null)con.close();
		         }catch (Exception e) {
		            e.printStackTrace();
		         }
		      }
		   }//delBoard()


		
	   
}
