class Controls {

  // 1 = up
  // 2 = down
  // 3 = left
  // 4 = right

  int selectionX, selectionY;
  PVector towerLocation = new PVector(0,0);

  // Sets the grid selector at 7th tile from at the x and the 4th tile of the y
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

    // Pausemenu
    if (key == 'f')
      {
        stage = 9;
      }


    // Placing the Freeze tower
    if (key == 's')
        {
        // Gets the data where the currentTile is
        Tile currentTile = grid.grid[selectionX][selectionY]; 
         
        // Building towers in the menu is not allowed @Twab
        if (currentTile.tower.towerType == 0 && statistics.amount >= statistics.freezeTowerCost)
          {
          //Variables from the currentTile converted to the variable values from Tower
          int x = currentTile.x;
          int y = currentTile.y;
          int d = grid.grid[0][0].w / 2;
          currentTile.tower = new Tower(x, y, d, 2, 1);
          //Substracts an amount of gold
          statistics.amount -= statistics.freezeTowerCost;
         }
        }


    // Placing a Laser tower
    if (key == 'a')
    {
      // Getting the information of the current x & y from your selected tile
      Tile currentTile = grid.grid[selectionX][selectionY]; 

      // The tile must be empty (towerType = 0) and the player must atleast have 50 gold  
      if (currentTile.tower.towerType == 0 && statistics.amount >= statistics.laserTowerCost)
      {
        // Variable x & y get the same values as the x & y of the selected tile

        int x = currentTile.x;
        int y = currentTile.y;

        // Variable d gets the values of the height & width of one tile divided by 2

        int d = grid.grid[0][0].w / 2;
        currentTile.tower = new Tower(x, y, d, 1, 1);
        statistics.amount -= statistics.laserTowerCost;
      }                 
    }


    //Controls for placing the bomb tower
        if (key == 'd')
        {
        Tile currentTile = grid.grid[selectionX][selectionY]; 
         
        if (currentTile.tower.towerType == 0 && statistics.amount >= 15)
          {
          int x = currentTile.x;
          int y = currentTile.y;
          int d = grid.grid[0][0].w / 2;
          currentTile.tower = new Tower(x, y, d, 3, 1);
          statistics.amount -= 15;
         }
        }


      //Controls for selling a tower
      if(key == 'q')
      {
      Tile currentTile = grid.grid[selectionX][selectionY];
        int x = currentTile.x;
        int y = currentTile.y;
        int d = grid.grid[0][0].w / 2;
        switch(currentTile.tower.towerType)
        { 
          case 1:
            statistics.amount += (statistics.laserTowerCost/2) * currentTile.tower.towerLevel;
            currentTile.tower = new Tower(x, y, d, 0, 1);
            return;
          case 2:
            statistics.amount += (statistics.freezeTowerCost/2) * currentTile.tower.towerLevel;
            currentTile.tower = new Tower(x, y, d, 0, 1);
            return;
          case 3:
            statistics.amount += (statistics.bombTowerCost/2) * currentTile.tower.towerLevel;
            currentTile.tower = new Tower(x, y, d, 0, 1);
            return;
        }
      }


        // Upgrade towers
        if(key == 'g')
        {
          Tile currentTile = grid.grid[selectionX][selectionY];
          if(currentTile.tower.towerType == 1 && statistics.amount >= statistics.laserTowerCost * currentTile.tower.towerLevel)
          {
            statistics.amount -= statistics.laserTowerCost * currentTile.tower.towerLevel;
            currentTile.tower.towerLevel += 1;
            currentTile.tower.laserDamage = currentTile.tower.towerLevel;
          }
          if(currentTile.tower.towerType == 2 && statistics.amount >= statistics.freezeTowerCost * currentTile.tower.towerLevel)
          {
            println(currentTile.tower.freezePower);
            statistics.amount -= statistics.freezeTowerCost * currentTile.tower.towerLevel;
            currentTile.tower.towerLevel += 1;
            currentTile.tower.freezePower = 1 - (currentTile.tower.towerLevel * 0.1);
            println(currentTile.tower.freezePower);
          }
        }


    // Movement through the grid
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