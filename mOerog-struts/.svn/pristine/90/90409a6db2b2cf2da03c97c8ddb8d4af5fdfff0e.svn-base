package com.moerog.test;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import junit.framework.TestCase;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DesEncrypterTest extends TestCase {
	private static Logger logger = LoggerFactory.getLogger(DesEncrypterTest.class);
	private Cipher ecipher;
	private Cipher dcipher;
	
	public void init(SecretKey key) {
		try {
			ecipher = Cipher.getInstance("DES");
			dcipher = Cipher.getInstance("DES");
			ecipher.init(Cipher.ENCRYPT_MODE, key);
			dcipher.init(Cipher.DECRYPT_MODE, key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String encrypt(String str) {
		try {
			// Encode the string into bytes using utf-8
			byte[] utf8 = str.getBytes("UTF8");
			
			// Encrypt
			byte[] enc = ecipher.doFinal(utf8);
			
			// Encode bytes to base64 to get a string
			return new sun.misc.BASE64Encoder().encode(enc);			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String decrypt(String str) {
		try {
			// Decode base64 to get bytes
			byte[] dec = new sun.misc.BASE64Decoder().decodeBuffer(str);
			
			// Decrypt
			byte[] utf8 = dcipher.doFinal(dec);
			
			// Decode using utf-8
			return new String(utf8, "UTF8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void testDes() throws Exception {
		// Generate a temporary key. In practice, you would save this key.
		SecretKey key = KeyGenerator.getInstance("DES").generateKey();
		
		// Create encrypter/decrypter class
		DesEncrypterTest des = new DesEncrypterTest();
		des.init(key);
		
		// Encrypt
		String encrypted = des.encrypt("좋은 저녁입니다.");
		logger.info(encrypted);
		
		// Decrypt
		String decrypted = des.decrypt(encrypted);
		logger.info(decrypted);		
	}
}
