package gamecore.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class SHA256 {

	public static byte[] Encrypt(byte[] bt) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(bt);
			return md.digest();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String args[]) {
		byte[] x = { 1, 2, 3 };

		byte[] r = Encrypt(x);

		System.out.println(Arrays.toString(r));

	}
}