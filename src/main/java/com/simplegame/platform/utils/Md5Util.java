package com.simplegame.platform.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class Md5Util {
	
	private static final Logger LOG = LogManager.getLogger(Md5Util.class);

	private static final String[] hexDigits = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	public static final String SECURE_KEY = "game-platform secure key";
	
	public static String md5To32(String value) {
		StringBuffer stringBuffer = new StringBuffer("");
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update(value.getBytes());
			byte[] bytes = messageDigest.digest();
			for (int i = 0; i < bytes.length; i++) {
				int j = bytes[i];
				if (j < 0) {
					j += 256;
				}
				if (j < 16) {
					stringBuffer.append("0");
				}
				stringBuffer.append(Integer.toHexString(j));
			}
			return stringBuffer.toString();
		} catch (NoSuchAlgorithmException e) {
			LOG.error("", e);
		}
		return null;
	}

	public static String md5To16(String value) {
		StringBuffer stringBuffer = new StringBuffer("");
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update(value.getBytes());
			byte[] bytes = messageDigest.digest();
			for (int i = 0; i < bytes.length; i++) {
				int j = bytes[i];
				if (j < 0) {
					j += 256;
				}
				if (j < 16) {
					stringBuffer.append("0");
				}
				stringBuffer.append(Integer.toHexString(j));
			}
			return stringBuffer.toString().substring(8, 24);
		} catch (NoSuchAlgorithmException e) {
			LOG.error("", e);
		}
		return null;
	}

	public static String md5Bytes(byte[] bytes) {
		String str = null;
		try {
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			messageDigest.update(bytes);
			str = byteArrayToHexString(messageDigest.digest());
		} catch (Exception localException) {
			LOG.error("", localException);
		}
		return str;
	}

	public static String byteArrayToHexString(byte[] parambytes) {
		StringBuffer stringBuffer = new StringBuffer();
		for (int i = 0; i < parambytes.length; i++) {
			stringBuffer.append(byteToHexString(parambytes[i]));
		}
		return stringBuffer.toString();
	}

	private static String byteToHexString(byte paramByte) {
		int i = paramByte;
		if (i < 0) {
			i = 256 + i;
		}
		int j = i / 16;
		int k = i % 16;
		return hexDigits[j] + hexDigits[k];
	}

	public static void main(String[] paramArrayOfString) {

		
	}
}