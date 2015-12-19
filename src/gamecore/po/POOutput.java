package gamecore.po;

import gamecore.io.ByteArrayGameOutput;

/**
 * 用于BLOB编码。
 */
public class POOutput extends ByteArrayGameOutput {

    /**
     * 将对象写入流。
     * @param <T>
     * @param codec
     * @param object 
     */
    public <T> void putObject(POCodec<T> codec, T object) {
        codec.write(object, this);
    }
    
}
