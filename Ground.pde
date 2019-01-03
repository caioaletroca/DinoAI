/**
 * Defines the main ground object
 */
public class Ground extends GameObject {

	float GroundHeight = 100;

	/**
	 * The Collision system instance
	 * @type {Collision}
	 */
	Collision collision;

	/**
	 * Default constructor
	 * @param {[type]} game [description]
	 */
	public Ground (game) {
		super(game);

		collision = new Collision(this);
	}

	void setup() {
		// Create the ground shape manually
		collision.shape[0].x = 0;
		collision.shape[0].y = height - GroundHeight - 30;
		collision.shape[1].x = width;
		collision.shape[1].y = height;
	}

}