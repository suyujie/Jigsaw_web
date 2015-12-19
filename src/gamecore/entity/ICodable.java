package gamecore.entity;

import java.io.Serializable;

/** 可进行 JSON 编码接口定义。
 */
public interface ICodable extends Serializable {

	public byte[] toByteArray();
	
}
