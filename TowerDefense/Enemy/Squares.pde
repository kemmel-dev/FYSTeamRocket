//Chris van Schagen

class Squares {

//Chris: creating variables for the square enemy
  int squareX;
  int squareY;
  int squareSize;
  int squareSpeed;

  Squares() {
    
//Chris: assigning values to the variables of the square enemy
    squareSize = 50;
    squareSpeed = 5;
    squareX = 50;
    squareY = 425;
  }

  void appear() {
    fill(style.enemyColor);
    square(squareX, squareY, squareSize);

//Chris: square moves right on path until the first waypoint, then it moves up
    if (squareX < path.wayPoint1X && squareY == path.wayPoint1Y) {
      squareX += squareSpeed;
    }
    else if (squareY > path.wayPoint2Y) {
      squareY -= squareSpeed;
    }
  }
}