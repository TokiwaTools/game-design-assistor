package me.kiito.gda.game;

class Piece {
	public static final Piece NONE = new Piece(true);
	public static final Piece ALL = new Piece(false);
	private String name;
	private final boolean isNone;
	private final boolean isAll;

	protected Piece(String name) {
		setName(name);
		isNone = false;
		isAll = false;
	}

	private Piece(boolean isNone) {
		if (isNone) {
			setName("NONE");
			this.isNone = true;
			this.isAll = false;
		} else {
			this.isNone = false;
			this.isAll = true;
		}
	}

	protected void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return toString();
	}

	public boolean isNone() {
		return isNone;
	}

	public boolean isAll() {
		return isAll;
	}

	@Override
	public String toString() {
		return name;
	}

	@Override
	public boolean equals(Object obj) {
		return obj == this;
	}
}
