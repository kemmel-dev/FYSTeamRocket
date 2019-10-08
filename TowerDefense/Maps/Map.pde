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
  size(1600, 900);
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
  //Path:
  //0,500
  //100,500
  //200,500
  //300,500
  //300,400
  //300,300
  //300,200
  //400,200
  //500,200
  //600,200
  //600,300
  //600,400
  //600,500
  //600,600
  //600,700
  //700,700
  //800,700
  //900,700
  //1000,700
  //1000,600
  //1000,500
  //1000,400
  //1000,300
  //1100,300
  //1200,300
  //1300,300
  //1400,300
  //1500,300
}