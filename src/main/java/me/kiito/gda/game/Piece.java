package me.kiito.gda.game;

class Piece {
	public static final Piece NONE = new Piece();
	private String name;

	protected Piece(String name) {
		setName(name);
	}

	private Piece() {
		setName("{NONE}");
	}

	protected void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return toString();
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
