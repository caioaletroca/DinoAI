/**
 * The Game engine main core
 */
public class GameEngine {

	float gravity = 1;
	float gravityValue = 9.81;

	float speed = 10;

	float StartTime;
	float ElapsedTime;
	float LastUpdate;

	/**
	 * The Entire game object List
	 * @type {ArrayList}
	 */
	ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

	int KeyPressed;
	int KeyReleased;
	ArrayList<function> KeyPressedEventHandler = new ArrayList<function>();
	ArrayList<function> KeyReleasedEventHandler = new ArrayList<function>();

	/**
	 * [setup description]
	 * @return {[type]} [description]
	 */
	void setup() {
		StartTime = millis();

		for (GameObject o : gameObjects) {
			o.setup();
		}
	}

	/**
	 * [draw description]
	 * @return {[type]} [description]
	 */
	void draw() {
		ElapsedTime = millis() - StartTime;

		for (GameObject o : gameObjects) {
			o.update(millis() - LastUpdate, ElapsedTime);

			if(o.collision) {
				for (GameObject s : gameObjects) {
					if(s.collision && o != s)
						if(o.collision.evaluate(s))
							o.collision.trigger(s);
				}
			}
		}

		LastUpdate = millis();
	}

	void keyPressed(key) {
		KeyPressed = key;

		for (function o : KeyPressedEventHandler) {
			o(key);
		}
	}

	void keyReleased(key) {
		KeyReleased = key;

		for (function o : KeyReleasedEventHandler) {
			o(key);
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
		o.setup();
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

	float getGravity() {
		return gravity * gravityValue;
	}

	/**
	 * Adds a new input handler
	 * @param {[type]} Type    The input event type
	 * @param {[type]} Handler The handler method
	 */
	void addKeyListener(Type, Handler) {
		this[Type + "EventHandler"].add(Handler);
	}
}