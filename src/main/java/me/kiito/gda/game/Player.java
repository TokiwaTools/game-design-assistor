package me.kiito.gda.game;

import java.util.HashSet;
import java.util.Set;

class Player {
	public static final Player NONE = new Player(true);
	public static final Player ALL = new Player(false);
	private String name;
	private final Set<Piece> field;
	private final boolean isNone;
	private final boolean isAll;

	protected Player(String name) {
		this.name = name;
		field = new HashSet<>();
		isNone = false;
		isAll = false;
	}

	private Player(boolean isNone) {
		field = null;
		if (isNone) {
			this.name = "NONE";
			this.isNone = true;
			this.isAll = false;
		} else {
			this.name = "ALL";
			this.isNone = false;
			this.isAll = true;
		}
	}

	public void setName(String name) {
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

	protected boolean hasPiece(Piece piece) {
		return field.contains(piece);
	}

	protected void addPiece(Piece piece) {
		field.add(piece);
	}

	protected void removePiece(Piece piece) {
		field.remove(piece);
	}

	protected Piece[] getField() {
		return field.toArray( new Piece [field.size()] );
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
