float x = 0;
float y = 0;
PImage grass;
PImage sand;
PImage bg;

int gridX = 0;
int gridY = 0;
int gridRadius = 100;
int gridWidth = 100;
int gridHeight = 100;

void setup() {
  size(1602, 902);
  grass = loadImage("grass.jpg");
  sand = loadImage("sand.png");
  bg = loadImage("bg.PNG");
}


void draw() {
  background(bg);
  fill(255,0,0,80);
  rect(gridX, gridY, gridRadius, gridRadius);

  if (gridX >=width) {
    gridX = 0;
  }
  if (gridX < 0) {
    gridX = width-gridRadius;
  }
  if (gridY >=height) {
    gridY = 0;
  }
  if (gridY < 0) {
    gridY = height-gridRadius;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      gridY = gridY -gridHeight;
    } else if (keyCode == DOWN) {
      gridY = gridY +gridHeight;
    } 
    if (keyCode == RIGHT) {
      gridX = gridX +gridWidth;
    } else if (keyCode == LEFT) {
      gridX = gridX -gridWidth;
    }
  }
}
