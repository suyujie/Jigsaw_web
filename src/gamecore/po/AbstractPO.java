package gamecore.po;

import gamecore.entity.ICodable;
import gamecore.serialize.SerializerKryo;

/**
 * 持久数据   抽象类，
 */
public abstract class AbstractPO implements ICodable {

	private static final long serialVersionUID = -8697093451648080625L;

	public byte[] toObjectBytes() {
		return SerializerKryo.serialize(this);
	}

	public void toDebugString() throws Exception {
	}

}
