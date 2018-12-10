package me.kiito.me.gda.math;

public enum ArithmeticOperator {
	ADDITION("+"),
	SUBTRACTION("-"),
	MULTIPLICATION("*"),
	DIVISION("/"),
	REMAINDER("%");

	private final String SIGN;

	private ArithmeticOperator(final String sign) {
		SIGN = sign;
	}

	public String getSign() {
		return SIGN;
	}
}
