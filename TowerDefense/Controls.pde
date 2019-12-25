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
       selectionX = constrain(selectionX - 1, 0, 15);
    }
    if (moveType == 4) 
    {
      selectionX = constrain(selectionX + 1, 0, 15);
    }
    grid.grid[selectionX][selectionY].selected = true;



    grid.grid[selectionX][selectionY].selected = true;
  }

  // Called from TowerDefense's keyPressed function
  // Handles key press events
  void keyPressed()
  {
    if (key == 'f')
      {
        stage = 4;
      }
    if (key == 's')
        {
        // Gets the data where the currentTile is
        Tile currentTile = grid.grid[selectionX][selectionY]; 
         
        
        if (currentTile.tower.towerType == 0 && statistics.amount >= 100)
          {
          //Variables from the currentTile converted to the variable values from Tower
          int x = currentTile.x;
          int y = currentTile.y;
          int d = grid.grid[0][0].w / 2;
          currentTile.tower = new Tower(x, y, d, 2);
          //Substracts an amount of gold
          statistics.amount -= 100;
         }
        }
    if (key == 'a')
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

 if (key == 'p')
    {
      Tile currentTile = grid.grid[selectionX][selectionY]; 
        
      if (currentTile.tower.towerType == 0 && statistics.amount >= 150)
      {
        int x = currentTile.x;
        int y = currentTile.y;
        int d = grid.grid[0][0].w / 2;
        currentTile.tower = new Tower(x, y, d, 3);
        statistics.amount -= 150;
      }                 
    }
    
      if(key == 'q')
      {
      Tile currentTile = grid.grid[selectionX][selectionY];
        int x = currentTile.x;
        int y = currentTile.y;
        int d = grid.grid[0][0].w / 2;
        switch(currentTile.tower.towerType)
        { 
          case 1:
            currentTile.tower = new Tower(x, y, d, 0);
            statistics.amount += 25;
            return;
          case 2:
            currentTile.tower = new Tower(x, y, d, 0);
            statistics.amount += 50;
            return;
        }

      }
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