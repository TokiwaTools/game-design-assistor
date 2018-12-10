package me.kiito.gda.game;

import me.kiito.me.gda.math.GdlArithmeticTerm;

public class GameStateCounter extends GdlArithmeticTerm {
	private String name;
	private GameState state;

	public GameStateCounter(String name, GameState state) {
		setName(name);
		setState(state);
	}

	public GameState getState() {
		return state;
	}

	public String getName() {
		return toString();
	}

	public void setState(GameState state) {
		this.state = state;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return name;
	}
}
