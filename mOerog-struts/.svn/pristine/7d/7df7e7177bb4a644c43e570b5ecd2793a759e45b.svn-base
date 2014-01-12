package com.moerog.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCConnection {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "moerog";
			String password = "cookie";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	public static Connection getConnection() {
		return conn;
	}
	
	public static PreparedStatement getPstmt() {
		return pstmt;
	}

	public static ResultSet getRs() {
		return rs;
	}

	public static void close() {
		if (conn != null) try { conn.close(); } catch (Exception e) {}
		if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
		if (rs != null) try { rs.close(); } catch (Exception e) {}
	}
}
