/**
 * Defines the basic player object
 */
public class Player extends GameObject {

	float x = 50;
	float y = 0;
	float vy = 0;

	PImage CurrentFrame;
	ArrayList<PImage> frames = new ArrayList<PImage>();
	int AnimationFrame = 0;

	// States
	boolean Duck;

	/**
	 * The Collision system instance
	 * @type {Collision}
	 */
	Collision collision;

	public Player (game) {
		super(game);

		collision = new Collision(this);
	}

	void setup() {
		frames.add(loadImage("res/dinorun0000.png"));
		frames.add(loadImage("res/dinorun0001.png"));
		frames.add(loadImage("res/dinoduck0000.png"));
		frames.add(loadImage("res/dinoduck0001.png"));
	}

	void update() {
		move();
		animate();
	}

	void move() {
		y += vy;
		if(y < height) {
			vy += this.game.getGravity();
		}
		else {
			vy = 0;
			//y = height;
		}
	}

	void animate() {
		int TotalFrames = 10;
		AnimationFrame++;
		if (AnimationFrame < TotalFrames / 2) {
			if(this.Duck)
				CurrentFrame = frames.get(2);
			else
				CurrentFrame = frames.get(0);
		}
		else {
			if(this.Duck)
				CurrentFrame = frames.get(3);
			else
				CurrentFrame = frames.get(1);
		}

		// Update frame
		image(CurrentFrame, x, y);

		// Update collision
		collision.setSprite(new Vector2(x, y), CurrentFrame);

		if (AnimationFrame == TotalFrames)
			AnimationFrame = 0;
	}

	void onCollision(collided) {
		vy = 0;
	}

}