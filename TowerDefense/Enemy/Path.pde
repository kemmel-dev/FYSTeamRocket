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