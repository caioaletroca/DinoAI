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
	boolean Jumping;

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

		// Running
		frames.add(loadImage("res/dinorun0000.png"));
		frames.add(loadImage("res/dinorun0001.png"));

		// Ducking
		frames.add(loadImage("res/dinoduck0000.png"));
		frames.add(loadImage("res/dinoduck0001.png"));

		// Jumping
		frames.add(loadImage("res/dinoJump0000.png"));

		// Input handlers
		this.game.addKeyListener("KeyPressed", onKeyPressed);
		this.game.addKeyListener("KeyReleased", onKeyReleased);
	}

	void update() {
		move();
		animate();
	}

	/**
	 * Moves the player and apply gravity
	 * @return {[type]} [description]
	 */
	void move() {
		position.y += vy;

		if(position.y < height) {
			vy += this.game.getGravity();
		}
		else {
			vy = 0;
		}
	}

	void animate() {
		int TotalFrames = 10;

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

		if(this.Jumping)
			CurrentFrame = frames.get(4);

		// Update frame
		image(CurrentFrame, position.x, position.y);

		// Update collision
		collision.setSprite(position, CurrentFrame);

		AnimationFrame++;

		if (AnimationFrame == TotalFrames)
			AnimationFrame = 0;
	}

	void onCollision(collided) {
		// Remove velocity
		vy = 0;

		// Clear jumping flag
		Jumping = false;
	}

	void onKeyPressed(key) {
		if (key == 65535) // Arrows keys
			duck();
		else if(key == 32) // Space bar
			jump();
	}

	void onKeyReleased(key) {
		if(key == 65535)
			stand();
	}

	void jump() {
		if(!Jumping) {
			// Remove ducking state
			if(Duck)
				stand();	

			// Jump force
			vy -= 25;

			Jumping = true;
		}
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