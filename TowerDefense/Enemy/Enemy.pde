//Chris van Schagen

Squares enemy1 = new Squares();
Path path = new Path();
Style style = new Style();

void setup() {
  size(1600, 900);
}

void draw() {
  background(style.backgroundColor);

//Chris: draw the path
  path.appear();

//Chris: draw the enemy
  enemy1.appear();
}