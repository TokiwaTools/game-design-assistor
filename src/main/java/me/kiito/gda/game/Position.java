package me.kiito.gda.game;

import java.util.Objects;

public final class Position implements Comparable<Position> {
	public final int X, Y;
	public final Notation NOTATION;

	protected Position(int x, int y) {
		this(x, y, Notation.ABSOLUTE);
	}

	protected Position(int x, int y, Notation notation) {
		this.X = x;
		this.Y = y;
		this.NOTATION = notation;
	}

	@Override
	public String toString() {
		return "(" + X + ", " + Y + ")";
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == this) {
			return true;
		}
		if (obj instanceof Position) {
			Position pos = (Position) obj;
            return this.X == pos.X && this.Y == pos.Y && this.NOTATION == pos.NOTATION;
		}
		return false;
    }

    @Override
    public int hashCode() {
        return Objects.hash(X, Y, NOTATION);
    }

    @Override
	public int compareTo(Position o) {
    	if (this.Y > o.Y) return 1;
    	if (this.X > o.X) return 1;
    	if (this.X == o.X && this.Y == o.Y) return 0;
    	return -1;
    }

    public enum Notation {
    	ABSOLUTE,
    	RELATIVE
    }
}
