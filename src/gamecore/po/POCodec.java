package gamecore.po;

/**
 * 大字段编码解码器。
 * @param <T> 
 */
public abstract class POCodec<T> {
    
    /**
     * 解码游戏对象。
     * @param in
     * @return 
     */
    public abstract T read(POInput in);
    
    /**
     * 编码游戏对象。
     * @param object
     * @param out 
     */
    public abstract void write(T object, POOutput out);
    
    
    /**
     * 将对象编码为BLOB。
     * @param obj
     * @return 
     */
    public final byte[] encode(T obj) {
        POOutput out = new POOutput();
        out.putObject(this, obj);
        return out.toByteArray();
    }
    
    /**
     * 将字节数组解码为对象。
     * @param blob
     * @return 
     */
    public final T decode(byte[] blob) {
        return new POInput(blob).getObject(this);
    }
    
}
