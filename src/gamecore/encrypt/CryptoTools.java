package gamecore.encrypt;

import sun.misc.BASE64Encoder;
import sun.misc.BASE64Decoder;
import gamecore.util.FileUtil;

import javax.crypto.*;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

import java.security.Key;
import java.security.spec.AlgorithmParameterSpec;

/**
* 使用DES加密和解密的方法
* */
public class CryptoTools {

	private final byte[] DESkey = "kingfykj".getBytes("UTF-8");// 设置密钥，略去
	private final byte[] DESIV = { 0x12, 0x34, 0x56, 0x78, (byte) 0x90, (byte) 0xAB, (byte) 0xCD, (byte) 0xEF };// 设置向量，略去

	private AlgorithmParameterSpec iv = null;// 加密算法的参数接口，IvParameterSpec是它的一个实现
	private Key key = null;

	public CryptoTools() throws Exception {
		DESKeySpec keySpec = new DESKeySpec(DESkey);// 设置密钥参数
		iv = new IvParameterSpec(DESIV);// 设置向量
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");// 获得密钥工厂
		key = keyFactory.generateSecret(keySpec);// 得到密钥对象
	}

	public byte[] encode(byte[] data) throws Exception {
		Cipher enCipher = Cipher.getInstance("DES/CBC/PKCS5Padding");// 得到加密对象Cipher
		enCipher.init(Cipher.ENCRYPT_MODE, key, iv);// 设置工作模式为加密模式，给出密钥和向量
		byte[] pasByte = enCipher.doFinal(data);
		BASE64Encoder base64Encoder = new BASE64Encoder();
		return base64Encoder.encode(pasByte).getBytes("UTF-8");
	}

	public byte[] decode(byte[] data) throws Exception {
		Cipher deCipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
		deCipher.init(Cipher.DECRYPT_MODE, key, iv);
		BASE64Decoder base64Decoder = new BASE64Decoder();
		byte[] pasByte = deCipher.doFinal(base64Decoder.decodeBuffer(new String(data)));
		return pasByte;
	}

	public static void main(String[] args) {

		String fileUrl1 = "C:\\Users\\suiyujie\\Desktop\\weapon.xml";
		String fileUrl2 = "C:\\Users\\suiyujie\\Desktop\\weapon2.xml";
		String fileUrl3 = "C:\\Users\\suiyujie\\Desktop\\weapon3.xml";

		try {

			CryptoTools des = new CryptoTools();//自定义密钥

			byte[] f1 = FileUtil.readFile(fileUrl1);
			byte[] f2 = des.encode(f1);
			FileUtil.writeFile(fileUrl2, f2, false);
			byte[] f3 = des.decode(f2);
			FileUtil.writeFile(fileUrl3, f3, false);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}