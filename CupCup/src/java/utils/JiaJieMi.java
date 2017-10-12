package utils;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESedeKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class JiaJieMi {
	/**
	 * 3-DES����
	 * 
	 * @param String
	 *            src Ҫ����3-DES���ܵ�String
	 * @param String
	 *            spkey�����SPKEY
	 * @return String 3-DES���ܺ��String
	 */
	public static String get3DESEncrypt(String src, String spkey) {
		String requestValue = "";
		try {
			// �õ�3-DES����Կ��
			byte[] enKey = getEnKey(spkey);
			// Ҫ����3-DES���ܵ������ڽ���/"UTF-16LE/"ȡ�ֽ�
			byte[] src2 = src.getBytes("UTF-16LE");
			// ����3-DES���ܺ�����ݵ��ֽ�
			byte[] encryptedData = Encrypt(src2, enKey);
			// ����3-DES���ܺ�����ݽ���BASE64����
			String base64String = getBase64Encode(encryptedData);
			// BASE64����ȥ�����з���
			String base64Encrypt = filter(base64String);
			// ��BASE64�����е�HTML���������ת��Ĺ���
			requestValue = getURLEncode(base64Encrypt);
			// System.out.println(requestValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestValue;
	}

	/**
	 * 3-DES����
	 * 
	 * @param String
	 *            src Ҫ����3-DES���ܵ�String
	 * @param String
	 *            spkey�����SPKEY
	 * @return String 3-DES���ܺ��String
	 */
	public static  String get3DESDecrypt(String src, String spkey) {
		String requestValue = "";
		try {
			// �õ�3-DES����Կ��
			// URLDecoder.decodeTML���������ת��Ĺ���
			String URLValue = getURLDecoderdecode(src);
			// ����3-DES���ܺ�����ݽ���BASE64����
			BASE64Decoder base64Decode = new BASE64Decoder();
			byte[] base64DValue = base64Decode.decodeBuffer(URLValue);
			// Ҫ����3-DES���ܵ������ڽ���/"UTF-16LE/"ȡ�ֽ�
			requestValue = deCrypt(base64DValue, spkey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestValue;
	}
//////////////////////////////////////////////////////////////////////////////
	/**
	 *
	 * ����3-DES���ܣ���Կ�׵�ͬ�ڼ��ܵ���Կ�ף���
	 * 
	 * @param byte[] src Ҫ����3-DES����byte[]
	 * @param String
	 *            spkey�����SPKEY
	 * @return String 3-DES���ܺ��String
	 */
	public static  String deCrypt(byte[] debase64, String spKey) {
		String strDe = null;
		Cipher cipher = null;
		try {
			cipher = Cipher.getInstance("DESede");
			byte[] key = getEnKey(spKey);
			DESedeKeySpec dks = new DESedeKeySpec(key);
			SecretKeyFactory keyFactory = SecretKeyFactory
					.getInstance("DESede");
			SecretKey sKey = keyFactory.generateSecret(dks);
			cipher.init(Cipher.DECRYPT_MODE, sKey);
			byte ciphertext[] = cipher.doFinal(debase64);
			strDe = new String(ciphertext, "UTF-16LE");
		} catch (Exception ex) {
			strDe = "";
			ex.printStackTrace();
		}
		return strDe;
	}

	/**
	 * ���ַ�������URLDecoder.decode(strEncoding)����
	 * 
	 * @param String
	 *            src Ҫ���н�����ַ���
	 *
	 * @return String ���н������ַ���
	 */
	public static  String getURLDecoderdecode(String src) {
		String requestValue = "";
		try {
			requestValue = URLDecoder.decode(src);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestValue;
	}

	/**
	 * �õ�3-DES����Կ�� ���ݸ�����Ҫ������Կ��Ϊ24���ֽڣ�md5���ܳ�������16���ֽڣ���˺��油8���ֽڵ�0
	 * 
	 * @param String
	 *            ԭʼ��SPKEY
	 * @return byte[] ָ�����ܷ�ʽΪmd5���byte[]
	 */
	private static  byte[] getEnKey(String spKey) {
		byte[] desKey = null;
		try {
			byte[] desKey1 = md5(spKey);
			desKey = new byte[24];
			int i = 0;
			while (i < desKey1.length && i < 24) {
				desKey[i] = desKey1[i];
				i++;
			}
			if (i < 24) {
				desKey[i] = 0;
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return desKey;
	}

	/**
	 * ����MD5����
	 * 
	 * @param String
	 *            ԭʼ��SPKEY
	 * @return byte[] ָ�����ܷ�ʽΪmd5���byte[]
	 */
	private static  byte[] md5(String strSrc) {
		byte[] returnByte = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			returnByte = md5.digest(strSrc.getBytes("GBK"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnByte;
	}

	/**
	 * 3-DES����
	 * 
	 * @param byte[] src Ҫ����3-DES���ܵ�byte[]
	 * @param byte[] enKey 3-DES������Կ
	 * @return byte[] 3-DES���ܺ��byte[]
	 */
	public static  byte[] Encrypt(byte[] src, byte[] enKey) {
		byte[] encryptedData = null;
		try {
			DESedeKeySpec dks = new DESedeKeySpec(enKey);
			SecretKeyFactory keyFactory = SecretKeyFactory
					.getInstance("DESede");
			SecretKey key = keyFactory.generateSecret(dks);
			Cipher cipher = Cipher.getInstance("DESede");
			cipher.init(Cipher.ENCRYPT_MODE, key);
			encryptedData = cipher.doFinal(src);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return encryptedData;
	}

	/**
	 * ���ַ�������Base64����
	 * 
	 * @param byte[] src Ҫ���б�����ַ�
	 *
	 * @return String ���б������ַ���
	 */
	public static  String getBase64Encode(byte[] src) {
		String requestValue = "";
		try {
			BASE64Encoder base64en = new BASE64Encoder();
			requestValue = base64en.encode(src);
			// System.out.println(requestValue);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestValue;
	}

	/**
	 * ȥ���ַ����Ļ��з��� base64����3-DES������ʱ���õ����ַ����л��з��ţ�������Ҫ����ȥ��
	 */
	private static  String filter(String str) {
		String output = null;
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			int asc = str.charAt(i);
			if (asc != 10 && asc != 13)
				sb.append(str.subSequence(i, i + 1));
		}
		output = new String(sb);
		return output;
	}

	/**
	 * ���ַ�������URLDecoder.encode(strEncoding)����
	 * 
	 * @param String
	 *            src Ҫ���б�����ַ���
	 *
	 * @return String ���б������ַ���
	 */
	public static  String getURLEncode(String src) {
		String requestValue = "";
		try {
			requestValue = URLEncoder.encode(src);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return requestValue;
	}
}
