/**
 * Global Variables
 */
int speed = 10;
int groundTimer = 0;

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

	game.gravity = 0.15;

	game.Instantiate(Player);
	game.Instantiate(Ground);

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