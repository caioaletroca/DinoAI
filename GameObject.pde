/**
 * Defines the basic Game Object in the engine
 */
public class GameObject {

	/**
	 * The game instance
	 */
	GameEngine game;

	/**
	 * The object position in a Vector2
	 * @type {Vector2}
	 */
	Vector2 position = new Vector2();

	/**
	 * Default constructor
	 * @param {[type]} game The game instance
	 */
	public GameObject (game) {
		this.game = game;
	}

	/**
	 * GameObject setup, runs at the very start
	 * @return {[type]} [description]
	 */
	void setup() { }

	/**
	 * Update is executed on every game draw execution
	 * @return {[type]} [description]
	 */
	void update() { }

	/**
	 * Deletes the game object
	 * @return {[type]} [description]
	 */
	void delete() {
		this.game.gameObjects.remove(this);
	}

	/**
	 * Triggered when game object collides with another object
	 * @return {[type]} [description]
	 */
	void onCollision(collided) { }

}