package me.kiito.gda.game;

class BoardState extends GameState {
	private final Square square;

	protected BoardState(Position position, Player player, Piece piece) {
		this("", position, player, piece);
	}

	protected BoardState(String name, Position position, Player player, Piece piece) {
		setName(name);
		square = new Square(position, player, piece);
	}

	public Position getPosition() {
		return square.getPosition();
	}

	public Player getPlayer() {
		return square.getPlayer();
	}

	public Piece getPiece() {
		return square.getPiece();
	}

	@Override
	public String getStateString() {
		return square.toString();
	}
}
