package com.GolForYou.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class DBInfo {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user = "week";
	String password = "week";
	
	Connection con = null;
	//Statement stmt = null;
	PreparedStatement pt = null;
	ResultSet rs = null;
	DataSource ds = null;
	String sql = null;
	

	
}
