/**
 * Handles the 2D collision behavior
 */
public class Collision {

	/**
	 * The game object instance
	 */
	GameObject gameObject;

	/**
	 * The collision shape as a rectangular object
	 * @type {Vector2}
	 */
	Vector2[] shape = new Vector2[2];

	/**
	 * Default constructor
	 */
	public Collision() {
		shape[0] = new Vector2();
		shape[1] = new Vector2();
	}

	public Collision (gameObject) {
		shape[0] = new Vector2();
		shape[1] = new Vector2();

		this.gameObject = gameObject;
	}

	boolean evaluate(s) {
		//console.log(s.collision.shape, shape);
		if(
			s.collision.shape[1].x > shape[0].x &&
			s.collision.shape[0].x < shape[1].x &&
			s.collision.shape[1].y > shape[0].y &&
			s.collision.shape[0].y < shape[1].y
		)
			return true;
		else
			return false;
	}

	void setSprite(position, sprite) {
		shape[0].x = position.x;
		shape[0].y = position.y;
		shape[1].x = position.x + sprite.width;
		shape[1].y = position.y + sprite.height;
	}

	void trigger(collided) {
		gameObject.onCollision(collided);
	}

}