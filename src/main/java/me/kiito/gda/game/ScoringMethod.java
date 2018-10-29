package me.kiito.gda.game;

class ScoringMethod {
	public final Player PLAYER;
	public final GameState GAME_STATE;
	public final String FORMULA;

	protected ScoringMethod(Player player, GameState gameState, String formula) {
		PLAYER = player;
		GAME_STATE = gameState;
		FORMULA = formula;
	}
}
