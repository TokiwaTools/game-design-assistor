package me.kiito.gda.game;

class TurnState extends GameState {
	private final Turn turn;

	protected TurnState(int number, Player player) {
		this("", number, player);
	}

	protected TurnState(String name, int number, Player player) {
		setName(name);
		turn = new Turn(number, player);
	}

	public int getTurnNumber() {
		return turn.getTurnNumber();
	}

	public Player getTurnPlayer() {
		return turn.getTurnPlayer();
	}

	@Override
	public String getStateString() {
		return turn.toString();
	}
}
