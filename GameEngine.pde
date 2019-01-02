/**
 * The Game engine main core
 */
public class GameEngine {

	ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

	void setup() {
		for (GameObject o : gameObjects) {
			o.setup();
		}
	}

	void draw() {
		for (GameObject o : gameObjects) {
			o.update();
		}
	}

	/**
	 * Default constructor
	 * @param {[type]} arguments [description]
	 */
	public GameEngine (arguments) {
		
	}

	/**
	 * Instantiate a new Game Object
	 * @param {[type]} Type [description]
	 */
	GameObject Instantiate(Type) {
		GameObject o = new Type(this);
		gameObjects.add(o);
		return o;
	}

	/**
	 * Return a list of game Objects of the Type specified
	 * @param  {[type]} Type [The type specified]
	 * @return {[type]}      [description]
	 */
	ArrayList<GameObject> getObjects(Type) {
		ArrayList<GameObject> results = new ArrayList<GameObject>();

		for (GameObject o : gameObjects) {
			if(o instanceof Type)
				results.add(o);
		}

		return results;
	}
}