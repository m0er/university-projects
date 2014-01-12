package com.moerog.util;

import java.io.FileInputStream;
import java.io.ObjectInputStream;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;

public class DesEncrypter {
	private static Cipher ecipher;
	private static Cipher dcipher;
	
	public static void init(String keyPath) {
		try {
			SecretKey key = getKey(keyPath);
			ecipher = Cipher.getInstance("DES");
			dcipher = Cipher.getInstance("DES");
			ecipher.init(Cipher.ENCRYPT_MODE, key);
			dcipher.init(Cipher.DECRYPT_MODE, key);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String encrypt(String str) {
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
	
	public static String decrypt(String str) {
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
	
	private static SecretKey getKey(String keyPath) {
		ObjectInputStream ois = null;
		SecretKey key = null;
		
		try {
			ois = new ObjectInputStream(new FileInputStream(keyPath));
			Object obj = ois.readObject();
			key = (SecretKey)obj;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { ois.close(); } catch (Exception e) {}
		}
		
		return key;
	}
}
