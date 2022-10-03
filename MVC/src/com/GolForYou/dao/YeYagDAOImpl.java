package com.GolForYou.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.GolForYou.vo.YeYag_listVO;


public class YeYagDAOImpl {

	   Connection con=null;//DB연결
	   PreparedStatement pt=null; //쿼리문 수행
	   ResultSet rs=null;//검색 결과 레코드를 저장 rs
	   DataSource ds=null;//DBCP 커넥션풀 관리 ds
	   String sql=null;
	   
	   public YeYagDAOImpl() {
	      try {      
	         
	           Context initContext = new InitialContext();           
	           ds = (DataSource)initContext.lookup("java:comp/env/jdbc/xe");          
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	   }
	   
	   
	   //게시물 찾기
	   public List<YeYag_listVO> YeYaglist(String y_name) {
	      List<YeYag_listVO> list = new ArrayList<>();
	      try {
	         
	         con=ds.getConnection();
	         
	         String sql = "SELECT * FROM YeYag_list WHERE y_name LIKE ?";
	         pt = con.prepareStatement(sql);
	         pt.setString(1, "%" + y_name + "%");
	         rs= pt.executeQuery();
	         
	         while(rs.next()) {
	            YeYag_listVO vo=new YeYag_listVO();
	            vo.setY_img(rs.getString("y_img"));
	            vo.setY_name(rs.getString("y_name"));
	            vo.setY_info(rs.getString("y_info"));
	            vo.setY_area(rs.getString("y_area"));
	            vo.setY_url(rs.getString("y_url"));
	            list.add(vo);
	         }

	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if(rs!=null) rs.close();
	            if(pt!=null) pt.close();
	            if(con!=null) con.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      return list;
	   }

	}
	   
