/**
 * Global Variables
 */
PImage dinoRun1;

int speed = 10;
int groundHeight = 100;
int groundTimer = 0;

ArrayList<Ground> grounds = new ArrayList<Ground>();

GameEngine game = new GameEngine();

/**
 * Main Setup Entry
 * @return {[type]} [description]
 */
void setup() {

	game.setup();

	// Engine setup
	frameRate(60);
	size(800, 500);
	background(250);


	stroke(0);
	strokeWeight(2);
	line(0, height - groundHeight - 30, width, height - groundHeight - 30);
	
	loadFiles();
}

/**
 * Load images from store
 * @return {[type]} [description]
 */
void loadFiles() {
	dinoRun1 = loadImage("res/dinorun0000.png");
}

/**
 * Main Draw loop
 * @return {[type]} [description]
 */
void draw() {
	background(250); 
    stroke(0);
    strokeWeight(2);
    line(0, height - groundHeight - 30, width, height - groundHeight - 30);

	image(dinoRun1, 0, 0);

	game.draw();
	
	updateObjects();
}

void updateObjects() {
	groundTimer++;
	if(groundTimer > 10) {
		groundTimer = 0;
		game.Instantiate(Ground);
	}
}