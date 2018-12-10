package me.kiito.gda.game;


class Square {
	private final Position POSITION;
	private Player player;
	private Piece piece;

	protected Square(Position position) {
		this.POSITION = position;
		this.player = Player.NONE;
		this.piece = Piece.NONE;
	}

	protected Square(Position position, Player player, Piece piece) {
		this.POSITION = position;
		this.player = player;
		this.piece	= piece;
	}

	public Position getPosition() {
		return POSITION;
	}

	public Player getPlayer() {
		return player;
	}

	public Piece getPiece() {
		return piece;
	}

	protected void setPiece(Piece piece, Player player) {
		this.piece = piece;
		this.player = player;
	}

	@Override
	public String toString() {
		String posStr = POSITION.toString();
		String playerStr = "Player: " + player.toString();
		String pieceStr = "Piece: " + piece.toString();
		return posStr + " (" + playerStr + ") (" + pieceStr + ")";
	}
}
