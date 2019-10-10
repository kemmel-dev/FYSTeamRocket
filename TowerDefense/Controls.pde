class Controls {

  // 1 = up
  // 2 = down
  // 3 = left
  // 4 = right

  int selectionX, selectionY;

  // Moves the selected tile towards moveType
  void Move(int moveType) 
  {
    grid.grid[selectionX][selectionY].selected = false;
    if (moveType == 1) 
    {
      selectionY = constrain(selectionY - 1, 0, 9);
    }
    if (moveType == 2) 
    {
      selectionY = constrain(selectionY + 1, 0, 9);
    }
    if (moveType == 3) 
    {
      selectionX = constrain(selectionX - 1, 0, 16);
    }
    if (moveType == 4) 
    {
      selectionX = constrain(selectionX + 1, 0, 16);
    }
    grid.grid[selectionX][selectionY].selected = true;
  }

  // Called from TowerDefense's keyPressed function
  // Handles key press events
  void keyPressed()
  {
    if (key == CODED) 
    {
      if (keyCode == UP) 
      {
        Move(1);
      } 
      else if (keyCode == DOWN) 
      {
        Move(2);
      }
      if (keyCode == LEFT) 
      {
        Move(3);
      } 
      else if (keyCode == RIGHT) 
      {
        Move(4);
      }
    }
  }
}