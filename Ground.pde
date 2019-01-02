/**
 * Defines a base ground class
 */
public class Ground extends GameObject {

	float x = width;
	float y = height - floor(random(groundHeight - 20, groundHeight + 30));
	int w = random(1, 10);

	public Ground (game) {
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
		ArrayList<Ground> grounds = game.getObjects(Ground);
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