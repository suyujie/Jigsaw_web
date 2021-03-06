package gamecore;

/**
 * 游戏内异常。
 * 游戏内异常可能会和一个错误码关联。
 */
public class GameException extends RuntimeException {

	private static final long serialVersionUID = -7116732455443850604L;

	private int errorCode;

	public GameException(int errorCode, String message, Throwable cause) {
		super(message, cause);
		this.errorCode = errorCode;
	}

	public GameException(String message, Throwable cause) {
		super(message, cause);
	}

	public GameException(int errorCode, String message) {
		super(message);
		this.errorCode = errorCode;
	}

	public GameException(String message) {
		super(message);
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

}
