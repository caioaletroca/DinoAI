public class GameObject {

	GameEngine game;

	public GameObject (game) {
		this.game = game;
	}

	void show() { }

	void setup() { }

	void update() { }

	void delete() {
		this.game.gameObjects.remove(this);
	}

}