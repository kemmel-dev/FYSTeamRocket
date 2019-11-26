class Controls {

  // 1 = up
  // 2 = down
  // 3 = left
  // 4 = right

  int selectionX, selectionY;

  void initControls()
  {
      // Set selected tile to the approximate middle of the grid
      selectionX = 7;
      selectionY = 4;
      grid.grid[controls.selectionX][controls.selectionY].selected = true;
  }

  // Moves the selected tile towards moveType
  void Move(int moveType) 
  {
    grid.grid[selectionX][selectionY].selected = false;
    if (moveType == 1) 
    {
      selectionY = constrain(selectionY - 1, 0, 8);
    }
    if (moveType == 2) 
    {
      selectionY = constrain(selectionY + 1, 0, 8);
    }
    if (moveType == 3) 
    {
      selectionX = constrain(selectionX - 1, 0, 14);
    }
    if (moveType == 4) 
    {
      selectionX = constrain(selectionX + 1, 0, 14);
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
      if (keyCode == SHIFT)
      {
        gamePaused = true;
      }
      if (keyCode == CONTROL)
      {
        Tile currentTile = grid.grid[selectionX][selectionY]; 
        if (currentTile.tower.towerType == 0 && statistics.amount >= 100)
        {
          int x = currentTile.x;
          int y = currentTile.y;
          int d = grid.grid[0][0].w / 2;
          currentTile.tower = new Tower(x, y, d, 2);
          statistics.amount -= 100;
        }
      }
    }
    if (key == 'x')
    {
      Tile currentTile = grid.grid[selectionX][selectionY]; 
        if (currentTile.tower.towerType == 0 && statistics.amount >= 50)
        {
          int x = currentTile.x;
          int y = currentTile.y;
          int d = grid.grid[0][0].w / 2;
          currentTile.tower = new Tower(x, y, d, 1);
          statistics.amount -= 50;
        }
    }
  }
}