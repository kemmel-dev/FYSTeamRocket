//Chris van Schagen

class Path {

  //Chris: creating variables for horizontal part of the path
  float path1X;
  float path1Y;
  float path1Width;
  float path1Height;

  //Chris: creating variables for vertical part of the path
  float path2X;
  float path2Y;
  float path2Width;
  float path2Height;

  Path() {

    //Chris: Assigning values to horizontal part of the path
    path1X = 0;
    path1Y = 400;
    path1Width = 1000;
    path1Height = 100;

    //Chris: Assigning values to vertical part of the path
    path2X = 1000;
    path2Y = 0;
    path2Width = 100;
    path2Height = 500;
  }

  void appear() {
    fill(style.pathColor);
    noStroke();

    rect(path1X, path1Y, path1Width, path1Height);
    rect(path2X, path2Y, path2Width, path2Height);
  }
}



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



//Chris van Schagen

class Style {

  color backgroundColor;
  color pathColor;
  color enemyColor;

  Style() {
    
    backgroundColor = color(50, 205, 50);
    pathColor = color(231,245,203);
    enemyColor = color(255, 0, 0);
    
  }
}



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