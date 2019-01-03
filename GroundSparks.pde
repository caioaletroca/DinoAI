/**
 * Defines a base ground spark class
 */
public class GroundSparks extends GameObject {

	float GroundHeight = 100;

	float x = width;
	float y = height - floor(random(GroundHeight - 20, GroundHeight + 30));
	int w = random(1, 10);

	public GroundSparks (game) {
		super(game);
	}

	void show() {
		stroke(0);
		strokeWeight(3);
		line(x, y, x + w, y);
	}

	void move(float speed) {
		x -= speed;
	}

	void update() {
		ArrayList<GroundSparks> grounds = this.game.getObjects(GroundSparks);
		for (int i = 0; i < grounds.size(); i++) {
			grounds.get(i).move(speed);
			if(grounds.get(i).x < 0) {
				delete();
			}
		}

		move(speed);

		show();
	}

}