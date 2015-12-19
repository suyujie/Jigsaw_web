package gamecore.encrypt;

import gamecore.util.FileUtil;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class EncryptUtil {
	
	 public static String aesEncrypt(String str, String key) throws Exception {
	        if (str == null || key == null) return null;
	        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	        cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key.getBytes("utf-8"), "AES"));
	        byte[] bytes = cipher.doFinal(str.getBytes("utf-8"));
	        return new BASE64Encoder().encode(bytes);
	    }

	    public static String aesDecrypt(String str, String key) throws Exception {
	        if (str == null || key == null) return null;
	        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
	        cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key.getBytes("utf-8"), "AES"));
	        byte[] bytes = new BASE64Decoder().decodeBuffer(str);
	        bytes = cipher.doFinal(bytes);
	        return new String(bytes, "utf-8");
	    }

	public static byte[] aesEncrypt(byte[] data, String key) throws Exception {
		if (data == null || key == null)
			return null;
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key.getBytes("utf-8"), "AES"));
		byte[] bytes = cipher.doFinal(data);
		return new BASE64Encoder().encode(bytes).getBytes("utf-8");
	}

	public static byte[] aesDecrypt(byte[] data, String key) throws Exception {
		if (data == null || key == null)
			return null;
		Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
		cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key.getBytes("utf-8"), "AES"));
		byte[] bytes = new BASE64Decoder().decodeBuffer(new String(data, "utf-8"));
		bytes = cipher.doFinal(bytes);
		return bytes;
	}
	
	public static String replaceBlank(String str) {
        String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest;
    }

	public static void main(String[] args) {

		String key = "robotsrulesgames";

		String fileUrl = "C:\\Users\\suiyujie\\Desktop\\head.xml";
		String fileUrl1 = "C:\\Users\\suiyujie\\Desktop\\head1.abcd";
		String fileUrl2 = "C:\\Users\\suiyujie\\Desktop\\head2.abcd";
		String fileUrl11 = "C:\\Users\\suiyujie\\Desktop\\head11.abcd";
		String fileUrl22 = "C:\\Users\\suiyujie\\Desktop\\head22.abcd";

		try {
			byte[] f2 = aesEncrypt(FileUtil.readFile(fileUrl), key);
			FileUtil.writeFile(fileUrl1, f2, false);
			byte[] f3 = aesDecrypt(FileUtil.readFile(fileUrl1), key);
			FileUtil.writeFile(fileUrl2, f3, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String src;
		try {
			src = FileUtil.readFileByFileInputStream(fileUrl);
			src = src.replaceAll("\\s","");
			src = replaceBlank(src);
			
			byte[] f22 = aesEncrypt(src.getBytes("UTF-8"), key);
			FileUtil.writeFile(fileUrl11, f22, false);
			byte[] f33 = aesDecrypt(FileUtil.readFile(fileUrl11), key);
			FileUtil.writeFile(fileUrl22, f33, false);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			String code = aesEncrypt("abcd", key);
			System.out.println(code);
			System.out.println(aesDecrypt(code, key));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	

}