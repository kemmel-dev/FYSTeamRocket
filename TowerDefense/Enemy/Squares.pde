//Chris van Schagen

class Squares {

//Chris: creating variables for the square enemy
  float squareX;
  float squareY;
  float squareSize;
  float squareMove;

  Squares() {
    
//Chris: assigning values to the variables of the square enemy
    squareSize = 50;
    squareMove = 5;
    squareX = 50;
    squareY = 425;
  }

  void appear() {
    fill(style.enemyColor);
    square(squareX, squareY, squareSize);

//Chris: square moves right on path until it can't go right, then it moves up
    if(squareX > path.path1X && squareX < path.path1X + path.path1Width + squareSize/2) {
      squareX += squareMove;
    }
    else {
      squareY -= squareMove;
    }
    
  }
}