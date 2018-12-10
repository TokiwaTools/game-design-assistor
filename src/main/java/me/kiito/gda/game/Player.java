package me.kiito.gda.game;

import java.util.HashMap;
import java.util.Map;

class Player {
	public static final Player NONE = new Player();
	private String name;
	private final Map<Piece, Integer> field;

	protected Player(String name) {
		this.name = name;
		field = new HashMap<>();
	}

	private Player() {
		this.name = "{NONE}";
		field = null;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return toString();
	}

	protected Map<Piece, Integer> getField() {
		return field;
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
