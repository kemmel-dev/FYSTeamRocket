class Controls {

  // 1 = up
  // 2 = down
  // 3 = left
  // 4 = right
  void Move(int moveType) {
    if (moveType == 1) {
      grid.gridY = grid.gridY - grid.gridHeight;
    }
    if (moveType == 2) {
      grid.gridY = grid.gridY + grid.gridHeight;
    }
    if (moveType == 3) {
      grid.gridX = grid.gridX - grid.gridWidth;
    }
    if (moveType == 4) {
      grid.gridX = grid.gridX + grid.gridWidth;
    }
  }
}