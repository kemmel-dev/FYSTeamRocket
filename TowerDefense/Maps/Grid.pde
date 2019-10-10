class Grid {

  float gridX = 800;
  float gridY = 400;
  float gridRadius = 100;
  float gridWidth = 100;
  float gridHeight = 100;

  void vierkant() {
    fill(255, 0, 0, 80);
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
}