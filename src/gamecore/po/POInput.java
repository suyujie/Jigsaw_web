package gamecore.po;

import gamecore.io.ByteArrayGameInput;

/**
 * 用于BLOB解码。
 */
public class POInput extends ByteArrayGameInput {

	public POInput(byte[] blob) {
		super(blob);
	}

	/**
	 * 从流中读对象。
	 * @param <T>
	 * @param codec
	 * @return 
	 */
	public <T> T getObject(POCodec<T> codec) {
		return codec.read(this);
	}

}
