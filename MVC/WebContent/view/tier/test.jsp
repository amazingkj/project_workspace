<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.GolForYou.dao.rankDAO" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
String user = "kong";
String password = "kong";

Connection con = null;
Statement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

String rankid;

		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
			sql = "select * from ranking order by r_sum asc";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			int i = 1;
			
			while(rs.next()) { //그때그때 출력이 계속되어야 함.
				rankid = rs.getString("r_id");
				out.print(rankid);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		}
%>