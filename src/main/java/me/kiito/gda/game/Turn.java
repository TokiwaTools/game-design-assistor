package me.kiito.gda.game;

class Turn {
	public static final int INITIAL = 0;
	public static final int END = -1;
	private final int turnNumber;
	private final Player turnPlayer;

	protected Turn(int number, Player player) {
		turnNumber = number;
		turnPlayer = player;
	}

	public int getTurnNumber() {
		return turnNumber;
	}

	public Player getTurnPlayer() {
		return turnPlayer;
	}

	@Override
	public String toString() {
		String turnNumberStr = String.valueOf(turnNumber);
		if (turnNumber == 0) {
			turnNumberStr = "[INITIAL]";
		} else if (turnNumber == -1) {
			turnNumberStr = "[END]";
		}
		return "(Turn: " + turnNumberStr + ") (Player: " + getTurnPlayer() + ")";
	}
}
