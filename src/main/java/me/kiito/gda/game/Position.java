package me.kiito.gda.game;

import java.util.Objects;

final class Position implements Comparable<Position> {
	public static final Position ALL = new Position();
	public final int X, Y;
	public final Notation NOTATION;
	private final boolean isAll;

	protected Position(int x, int y) {
		this(x, y, Notation.ABSTRACT);
	}

	protected Position(int x, int y, Notation notation) {
		this.X = x;
		this.Y = y;
		this.NOTATION = notation;
		this.isAll = false;
	}

	private Position() {
		this.X = 0;
		this.Y = 0;
		this.NOTATION = Notation.ABSTRACT;
		this.isAll = true;
	}

	public boolean isAll() {
		return isAll;
	}

	@Override
	public String toString() {
		if (this == ALL) {
			return "(all, all)";
		}
		return "(" + X + ", " + Y + ")";
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == this || this == ALL || obj == ALL) {
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
        return Objects.hash(X, Y, NOTATION, isAll);
    }

    @Override
	public int compareTo(Position o) {
    	if (this.Y > o.Y) return 1;
    	if (this.X > o.X) return 1;
    	if (this.X == o.X && this.Y == o.Y) return 0;
    	return -1;
    }
}
