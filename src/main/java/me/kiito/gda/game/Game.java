package me.kiito.gda.game;

import java.util.ArrayList;
import java.util.List;

public class Game {
	private String name;
	private String description;
	private final Board board;
	private final Player [] players;
	private final List<Piece> pieces;
	private final RuleSheet ruleSheet;

	public Game(String name) {
		this.name = name;
		description = "";
		board = new Board();
		players = new Player[2];
		players[0] = new Player("Player 1");
		players[1] = new Player("Player 2");
		pieces = new ArrayList<>();
		ruleSheet = new RuleSheet(this);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Board getBoard() {
		return board;
	}

	public Player[] getPlayers() {
		return players;
	}

	public Player getFirstMovePlayer() {
		return players[0];
	}

	public void changeFirstMovePlayer() {
		Player player = players[0];
		players[0] = players[1];
		players[1] = player;
	}

	public Piece[] getPieces() {
		return pieces.toArray( new Piece[pieces.size()] );
	}

	public void addPiece(Piece piece) {
		pieces.add(piece);
	}

	public RuleSheet getRuleSheet() {
		return ruleSheet;
	}

	@Override
	public String toString() {
		return name;
	}
}
