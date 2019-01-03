/**
 * The base default obstacle class
 */
public class Obstacle extends GameObject {

	Collision collision;

	public Obstacle (game) {
		super(game);

		collision = new Collision(this);
	}

	void update() {
		// Despaw if out of bounds
		if(
			position.x < 0
		)
			delete();
	}

}

public class Cactus extends Obstacle {

	PImage sprite;

	public Cactus (game) {
		super(game);
	}

	void setup() {
		// Load sprite
		sprite = this.game.getObjects(ObstaclesSpawner).get(0).sprite;
		
		// Set initial position
		position.x = width;
		position.y = height - 100 - 30 - sprite.height;

		// Configure collision system
		collision.setSprite(position, sprite);
	}

	void update() {
		super.update();

		// Move to the left
		position.x -= this.game.speed;

		// Render image
		image(sprite, position.x, position.y);
	}

}

public class ObstaclesSpawner extends GameObject {

	PImage sprite;

	float SpawnTimer = 0;

	public ObstaclesSpawner (game) {
		super(game);
	}

	void setup() {
		sprite = loadImage("res/cactusBig0000.png");
	}

	void update(deltaTime, elapsedTime) {

		if(SpawnTimer - elapsedTime < 0) {
			if(random(1) < 0.5)
				Cactus cactus = this.game.Instantiate(Cactus);
			//cactus.sprite = sprite;

			SpawnTimer = elapsedTime + 1000;
		}
		else {
			
		}

	}

}