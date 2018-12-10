package me.kiito.me.gda.math;

public class GdlArithmeticFunction extends GdlArithmeticTerm {
	public final GdlArithmeticTerm TERM1, TERM2;
	public final ArithmeticOperator OPERATOR;

	public GdlArithmeticFunction(ArithmeticOperator operator, GdlArithmeticTerm term1, GdlArithmeticTerm term2) {
		OPERATOR = operator;
		TERM1 = term1;
		TERM2 = term2;
	}

	@Override
	public String toString() {
		return TERM1 + " " + OPERATOR.getSign() + " " + TERM2;
	}

}
