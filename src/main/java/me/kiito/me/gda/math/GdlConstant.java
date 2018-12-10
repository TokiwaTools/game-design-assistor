package me.kiito.me.gda.math;

public class GdlConstant extends GdlArithmeticTerm {
	public final int NUMBER;

	public GdlConstant(int number) {
		NUMBER = number;
	}

	@Override
	public String toString() {
		return String.valueOf(NUMBER);
	}

}
