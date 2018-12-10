package me.kiito.gda.game;

public abstract class GameState {
	private String name;
	private GameState previousState;
	private GameState nextState;

	public GameState getNext() {
		return nextState;
	}

	public GameState getPrevious() {
		return previousState;
	}

	public void setNext(GameState state) {
		nextState = state;
		state.previousState = this;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return toString();
	}

	public abstract String getStateString();

	public static void remove(GameState state) {
		if (state.previousState != null) {
			state.previousState.nextState = state.nextState;
		}
		if (state.nextState != null) {
			state.nextState.previousState = state.previousState;
		}
	}

	@Override
 	public String toString() {
		if (name.length() == 0) {
			return getStateString();
		}
		return name;
	}
}
