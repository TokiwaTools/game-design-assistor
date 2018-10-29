package me.kiito.gda.game;

abstract class CountableComponent {
	protected String name;
	protected GameState state;

	public GameState getState() {
		return state;
	}

	public String getName() {
		return toString();
	}

	@Override
	public String toString() {
		return name;
	}
}
