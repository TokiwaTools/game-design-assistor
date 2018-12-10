package me.kiito.gda.game;

class BoardState extends GameState {
	public final Board BOARD;
	public final Player PLAYER;
	public final Piece PIECE;

	protected BoardState(String name, Board board, Player player, Piece piece) {
		setName(name);
		BOARD = board;
		PLAYER = player;
		PIECE = piece;
	}

	@Override
	public String getStateString() {
		return BOARD.toString();
	}
}
