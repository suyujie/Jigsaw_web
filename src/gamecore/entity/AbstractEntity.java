package gamecore.entity;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.Serializable;

/**
 * 抽象实体，用于结构性继承。
 */
public abstract class AbstractEntity implements Serializable {
	
	private static final long serialVersionUID = 60123005368223440L;

	public byte[] toObjectBytes() {
		ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		ObjectOutputStream outObj;
		try {
			outObj = new ObjectOutputStream(byteOut);
			outObj.writeObject(this);
		} catch (IOException e) {
			e.printStackTrace();
		}
		byte[] objbytes = byteOut.toByteArray();
		return objbytes;
	}

}
