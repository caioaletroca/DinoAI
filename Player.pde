/**
 * Defines the basic player object
 */
public class Player extends GameObject {

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
		position.x = 50;

		frames.add(loadImage("res/dinorun0000.png"));
		frames.add(loadImage("res/dinorun0001.png"));
		frames.add(loadImage("res/dinoduck0000.png"));
		frames.add(loadImage("res/dinoduck0001.png"));

		// Event handler
		this.game.addKeyListener("KeyPressed", onKeyPressed);
		this.game.addKeyListener("KeyReleased", onKeyReleased);
	}

	void update() {
		move();
		animate();
	}

	void move() {
		position.y += vy;
		if(position.y < height) {
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
		image(CurrentFrame, position.x, position.y);

		// Update collision
		collision.setSprite(position, CurrentFrame);

		if (AnimationFrame == TotalFrames)
			AnimationFrame = 0;
	}

	void onCollision(collided) {
		vy = 0;
	}

	void onKeyPressed(key) {
		if (key == 65535)
			duck();
	}

	void onKeyReleased(key) {
		if(key == 65535)
			stand();
	}

	void duck() {
		if(!Duck) {
			position.y += 48;
			Duck = true;
		}
	}

	void stand() {
		if(Duck) {
			position.y -= 48;
			Duck = false;
		}
	}

}