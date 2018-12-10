package me.kiito.gda.game;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class RuleSheet {
	private final Game game;
	private GameState initialState;
	private List<GameState> endStates;
	private List<GameState> movingRules;
	private Map<Player, ScoringMethod> scoringMethods;
	private Map<String, GameStateCounter> stateCounters;

	RuleSheet(Game game) {
		this.game = game;
		//initialState = new BoardState(Position.ALL, Player.NONE, Piece.NONE);
		endStates = new ArrayList<>();
		movingRules = new ArrayList<>();
		scoringMethods = new HashMap<>();
		stateCounters = new HashMap<>();
	}

	public GameState getInitialState() {
		return initialState;
	}

	public List<GameState> getEndStates() {
		return endStates;
	}

	public void addEndState(GameState state) {
		endStates.add(state);
	}

	public List<GameState> getMovingRules() {
		return movingRules;
	}

	public void addMovingRule(GameState state) {
		movingRules.add(state);
	}

	public Game getGame() {
		return game;
	}

	public ScoringMethod getScoringMethod(Player player) {
		return scoringMethods.get(player);
	}

	public void addScoringMethod(ScoringMethod method) {
		scoringMethods.put(method.PLAYER, method);
	}

	public GameStateCounter getCountableComponent(String name) {
		return stateCounters.get(name);
	}

	public void addCountableComponent(GameStateCounter component) {
		stateCounters.put(component.getName(), component);
	}
}
