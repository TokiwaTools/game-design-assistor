package me.kiito.me.gda.math;

public enum ComparisonOperator {
	EQUAL("="),
	NOT_EQUAL("≠"),
	LESS("<"),
	GREATER(">"),
	LESS_OR_EQUAL("≤"),
	GREATER_OR_EQUAL("≥");

	private final String SIGN;

	private ComparisonOperator(final String sign) {
		SIGN = sign;
	}

	public String getSign() {
		return SIGN;
	}
}
