class Controls {

  // 1 = up
  // 2 = down
  // 3 = left
  // 4 = right

  int selectionX, selectionY;
  PVector towerLocation = new PVector(0,0);

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

    //  Selector can't move horizontally while in upgrade menu @Twab
    if (selectionX == 15) {
      if (moveType == 1) 
      {
        selectionY = constrain(selectionY - 1, 0, 8);
      }
      if (moveType == 2) 
      {
        selectionY = constrain(selectionY + 1, 0, 8);
      }

    } else {
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
        //
        Tile currentTile = grid.grid[selectionX][selectionY]; 
         
         // Building towers in the menu is not allowed @Twab
        if (currentTile.tower.towerType == 0 && statistics.amount >= 100 && selectionX != 15)
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
        
        // Building towers in the menu is not allowed @Twab
        if (currentTile.tower.towerType == 0 && statistics.amount >= 50 && selectionX != 15)
        {
          int x = currentTile.x;
          int y = currentTile.y;
          int d = grid.grid[0][0].w / 2;
          currentTile.tower = new Tower(x, y, d, 1);
          statistics.amount -= 50;
        } else {

            // If selector is in upgrade menu, x press exits the menu @Twab
            if (selectionX == 15) {
              selectionX = int(towerLocation.x);
              selectionY = int(towerLocation.y);
            } else {

                // If selector is on a tower inhabited tile, move selector to upgrade menu @Twab
                if (currentTile.tower.towerType > 0) {
                  towerLocation.x = float(selectionX);
                  towerLocation.y = float(selectionY); 
                  selectionX = 15;
                  selectionY = 0;
                }
              }        
          }       
    }
  }
}