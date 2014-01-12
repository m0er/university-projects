package kr.ac.bu.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import junit.framework.TestCase;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JDBCTest extends TestCase {
	private final Logger logger = LoggerFactory.getLogger(JDBCTest.class);
	
	@Override
	protected void setUp() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
	}
	
	public void testGetList() {
		String url = "jdbc:mysql://localhost/food_system";
		String user = "bu";
		String password = "food";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		
		try {
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement("SELECT * FROM client");
			rs = pstmt.executeQuery();
			rsmd = rs.getMetaData();
			
			while (rs.next()) {
				StringBuilder sb = new StringBuilder();
				
				for (int i=1; i <= rsmd.getColumnCount(); i++) {
					sb.append(rs.getString(i));
				}
				
				logger.info(sb.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (Exception e) {}
			if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
			if (conn != null) try { conn.close(); } catch (Exception e) {}
		}
	}
}
