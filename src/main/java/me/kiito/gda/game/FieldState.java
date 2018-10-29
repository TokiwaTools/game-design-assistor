package me.kiito.gda.game;

class FieldState extends GameState {
	private final Player player;
	private final Piece piece;

	protected FieldState(Player player, Piece piece) {
		this("", player, piece);
	}

	protected FieldState(String name, Player player, Piece piece) {
		setName(name);
		this.player = player;
		this.piece = piece;
	}

	public Player getPlayer() {
		return player;
	}

	public Piece getPiece() {
		return piece;
	}

	@Override
	public String getStateString() {
		return "(Player: " + player.toString() + ") (Piece: " + piece.toString() + ")";
	}
}
