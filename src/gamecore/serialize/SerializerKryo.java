package gamecore.serialize;

import org.wicketstuff.pageserializer.kryo2.KryoSerializer;

public class SerializerKryo {

	protected static KryoSerializer kryo = null;// 创建全局的唯一实例

	public static KryoSerializer getKryo() {
		if (kryo != null) {
			return kryo;
		} else {
			kryo = new KryoSerializer();
			return kryo;
		}

		//return new KryoSerializer();
	}

	public static byte[] serialize(Object object) {
		if (object == null) {
			return null;
		}
		return getKryo().serialize(object);
	}

	public static Object deSerialize(byte[] bytes) {
		if (bytes == null) {
			return null;
		}
		return getKryo().deserialize(bytes);
	}

	//	public static byte[] serialize(Object object) {
	//		Output output = new Output(new ByteArrayOutputStream());
	//		byte[] bytes = null;
	//		try {
	//			getKryo().writeObject(output, object);
	//			bytes = output.toBytes();
	//		} catch (Exception e) {
	//			e.printStackTrace();
	//		} finally {
	//			output.close();
	//		}
	//
	//		return bytes;
	//	}
	//
	//	public static <T> Object deSerialize(byte[] bytes, Class<T> t) {
	//		Input input = new Input(bytes);
	//		T tt = (T) getKryo().readObject(input, t);
	//		input.close();
	//		return tt;
	//	}

}
