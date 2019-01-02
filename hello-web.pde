PImage dinoRun1;

int groundHeight = 100;


void setup() {
	frameRate(60);
	size(800, 500);
	background(250);

	stroke(0);
	strokeWeight(2);
	line(0, height - groundHeight - 30, width, height - groundHeight - 30);
	
	loadFiles();
}

void loadFiles() {
	dinoRun1 = loadImage("dinorun0000.png");
}

void draw() {
	image(dinoRun1, 0, 0);
}