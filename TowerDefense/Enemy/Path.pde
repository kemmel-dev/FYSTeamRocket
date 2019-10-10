//Chris van Schagen

class Path {

  //Chris: creating variables for horizontal part of the path
  int path1X;
  int path1Y;
  int path1Width;
  int path1Height;

  //Chris: creating variables for vertical part of the path
  int path2X;
  int path2Y;
  int path2Width;
  int path2Height;
  
  //Creating wayPoints
  int wayPoint1X;
  int wayPoint1Y;
  
  int wayPoint2Y;

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
    
    //waypoints
    wayPoint1X = 1025;
    wayPoint1Y = 425;
    
    wayPoint2Y = 225;
  }

  void appear() {
    fill(style.pathColor);
    noStroke();

    rect(path1X, path1Y, path1Width, path1Height);
    rect(path2X, path2Y, path2Width, path2Height);
  }
}