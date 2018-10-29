package me.kiito.gda.game;

import java.util.HashMap;
import java.util.Map;

class Board {
	private Map<Position, Square> squares;
	private Position rangeTopLeft, rangeBottomRight;

	protected Board() {
		squares = new HashMap<>();
		rangeTopLeft = new Position(0, 0);
		rangeBottomRight = new Position(7, 7);
		initBoard(rangeTopLeft, rangeBottomRight);
	}

	public Position getTopLeftRange() {
		return rangeTopLeft;
	}

	public Position getBottomRightRange() {
		return rangeBottomRight;
	}

	public Square getSquare(int x, int y) {
		return squares.get( new Position(x, y) );
	}

	public void setRange(int topLeftX, int topLeftY, int bottomRightX, int bottomRightY) {
		Position topLeft = new Position(topLeftX, topLeftY);
		Position bottomRight = new Position(bottomRightX, bottomRightY);
		updateRange(topLeft, bottomRight);
		rangeTopLeft = topLeft;
		rangeBottomRight = bottomRight;
	}

	private void updateRange(Position topLeft, Position bottomRight) {
		if (rangeTopLeft.compareTo(topLeft) <= 0) {
			for (int y = rangeTopLeft.Y; y < topLeft.Y; y++) {
				for (int x = rangeTopLeft.X; x < topLeft.X; x++) {
					squares.remove( new Position(x, y) );
				}
			}
		} else {
			for (int y = topLeft.Y; y < rangeTopLeft.Y; y++) {
				for (int x = topLeft.X; x < rangeTopLeft.X; x++) {
					createSquare(x, y);
				}
			}
		}
		if (rangeBottomRight.compareTo(bottomRight) >= 0) {
			for (int y = rangeBottomRight.Y; y > bottomRight.Y; y--) {
				for (int x = rangeBottomRight.X; x > bottomRight.X; x--) {
					squares.remove( new Position(x, y) );
				}
			}
		} else {
			for (int y = bottomRight.Y; y > rangeBottomRight.Y; y--) {
				for (int x = bottomRight.X; x > rangeBottomRight.X; x--) {
					createSquare(x, y);
				}
			}
		}
	}

	private void initBoard(Position topLeftPos, Position bottomRightPos) {
		for (int y = topLeftPos.Y; y <= bottomRightPos.Y; y++) {
			for (int x = topLeftPos.X; x <= bottomRightPos.X; x++) {
				createSquare(x, y);
			}
		}
	}

	private void createSquare(int x, int y) {
		Position pos = new Position(x, y);
		Square square = new Square(pos);
		squares.put(pos, square);
	}
}
