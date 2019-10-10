static Grid grid;
Backgrnd map;
Controls controls;

void setup() {
  size(1600, 900);
  map = new Backgrnd();
  controls = new Controls();
  grid = new Grid();
}

void draw() {
  map.Display();
  grid.vierkant();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      controls.Move(1);
    } else if (keyCode == DOWN) {
      controls.Move(2);
    }
    if (keyCode == LEFT) {
      controls.Move(3);
    } else if (keyCode == RIGHT) {
      controls.Move(4);
    }
  }
}