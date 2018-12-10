package me.kiito.me.gda.math;

public class ConditionalExpression {
	public final ComparisonOperator OPERATOR;
	public final int THRESHOLD;

	public ConditionalExpression(ComparisonOperator operator, int threshold) {
		OPERATOR = operator;
		THRESHOLD = threshold;
	}

}
