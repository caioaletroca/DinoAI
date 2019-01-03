/**
 * Global Variables
 */
int speed = 10;
int groundTimer = 0;

/**
 * The Game Engine instance
 * @type {GameEngine}
 */
GameEngine game = new GameEngine();

/**
 * Main Setup Entry
 * @return {[type]} [description]
 */
void setup() {

	// Engine setup
	frameRate(60);
	size(800, 500);
	background(250);

	// Change gravity force
	game.gravity = 0.15;

	// Create basic game objects
	game.Instantiate(Player);
	game.Instantiate(Ground);

	game.Instantiate(ObstaclesSpawner);

	game.setup();
}

/**
 * Main Draw loop
 * @return {[type]} [description]
 */
void draw() {
	background(250);

	game.draw();
	
	updateObjects();
}


void keyPressed(){
	game.keyPressed(key);
}

void keyReleased() {
	game.keyReleased(key);
}

void updateObjects() {
	groundTimer++;
	if(groundTimer > 10) {
		groundTimer = 0;
		game.Instantiate(GroundSparks);
	}
}