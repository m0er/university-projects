package com.moerog.test;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import junit.framework.TestCase;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.moerog.util.DesEncrypter;

public class ConnectionTest extends TestCase {
	static {
		try {
			Class.forName("net.sf.log4jdbc.DriverSpy");			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static Logger logger = LoggerFactory.getLogger(ConnectionTest.class);
	private Connection conn;
	private PreparedStatement pstmt;
	private CallableStatement cstmt;
	private ResultSet rs;
		
	@Override
	protected void setUp() throws Exception {
		String url = "jdbc:log4jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "moerog";
		String password = "cookie";
		conn = DriverManager.getConnection(url, user, password);
	}
	
	private void close() {
		if (rs != null) try { rs.close(); } catch (Exception e) {}
		if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
		if (cstmt != null) try { cstmt.close(); } catch (Exception e) {}
		if (conn != null) try { conn.close(); } catch (Exception e) {}
	}
	
	public void testRegisterAdmin() throws Exception {
		String adminId = "admin";
		String adminPassword = "moerog";
		String adminEmail = "ethdemor@gmail.com";
		String adminNickname = "mOer";
		
		// ¾ÏÈ£È­
		// SecretKey key = getKey();
		// DesEncrypter.init(key);
		adminPassword = DesEncrypter.encrypt(adminPassword);
		logger.info(adminPassword);
		
		String query = "INSERT INTO moerogAdmin(admin_id, admin_password, admin_nickname, admin_email) " +
				"VALUES (?, ?, ?, ?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, adminId);
		pstmt.setString(2, adminPassword);
		pstmt.setString(3, adminNickname);
		pstmt.setString(4, adminEmail);
		pstmt.execute();
		
		close();
	}
	
	public void testSelectAdmin() throws Exception {
		String sql = "SELECT admin_id, admin_password, admin_nickname, admin_email FROM moerogAdmin";
		pstmt = conn.prepareStatement(sql);		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			logger.info("id: " + rs.getString(1));
			String pword = DesEncrypter.decrypt(rs.getString(2));
			logger.info("pword: " + pword);			
			logger.info("nickname: " + rs.getString(3));
			logger.info("email: " + rs.getString(4));
		}
		
		close();
	}
	
	@SuppressWarnings("unused")
	private void createKey() throws Exception {
		SecretKey key = KeyGenerator.getInstance("DES").generateKey();
		String className = key.getClass().getName();
		logger.info(className);		
		
		ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("WebContent/WEB-INF/key.ser"));
		oos.writeObject(key);
		oos.close();
	}
	
	@SuppressWarnings("unused")
	@Deprecated
	private SecretKey getKey() throws Exception {
		ObjectInputStream ois = new ObjectInputStream(new FileInputStream("WebContent/WEB-INF/key.ser"));
		Object obj = ois.readObject();
		logger.info(obj.getClass().getName());
		SecretKey key = (SecretKey)obj;
		assertNotNull(key);
		ois.close();
		return key;
	}
}
