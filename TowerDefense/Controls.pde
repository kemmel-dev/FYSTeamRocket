class Controls {

  // 1 = up
  // 2 = down
  // 3 = left
  // 4 = right

  boolean upgrading = false;
  int upgradeX, upgradeY;
  int selectionX, selectionY;
  PVector towerLocation = new PVector(0,0);

  //Variable for the total amount of towers placed
  int totalTowersPlaced = 0;

  //Variable for the total amount of towers sold
  int totalTowersSold = 0;

  int laserUpgradeCost;
  int freezeUpgradeCost;
  int bombUpgradeCost;
  int farmUpgradeCost;

  //ArrayList containing the 'path' tiles
  ArrayList<Tile> path = new ArrayList<Tile>() {
    {
      add(new Tile(60 + 120 * 0, 60 + 120 * 5, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 1, 60 + 120 * 5, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 2, 60 + 120 * 5, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 3, 60 + 120 * 5, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 3, 60 + 120 * 4, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 3, 60 + 120 * 3, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 3, 60 + 120 * 2, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 4, 60 + 120 * 2, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 5, 60 + 120 * 2, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 6, 60 + 120 * 2, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 6, 60 + 120 * 3, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 6, 60 + 120 * 4, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 6, 60 + 120 * 5, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 6, 60 + 120 * 6, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 6, 60 + 120 * 7, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 7, 60 + 120 * 7, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 8, 60 + 120 * 7, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 9, 60 + 120 * 7, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 10, 60 + 120 * 7, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 10, 60 + 120 * 6, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 10, 60 + 120 * 5, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 10, 60 + 120 * 4, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 10, 60 + 120 * 3, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 11, 60 + 120 * 3, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 12, 60 + 120 * 3, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 13, 60 + 120 * 3, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 14, 60 + 120 * 3, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 15, 60 + 120 * 3, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 15, 60 + 120 * 1, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 15, 60 + 120 * 2, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 15, 60 + 120 * 3, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 15, 60 + 120 * 4, int(SIZE_X/16)));
      add(new Tile(60 + 120 * 15, 60 + 120 * 5, int(SIZE_X/16)));
    }  
  };

  // Sets the grid selector at 7th tile from at the x and the 4th tile of the y
  void initControls()
  {
      // Set selected tile to the approximate middle of the grid
      selectionX = 7;
      selectionY = 4;
      grid.grid[controls.selectionX][controls.selectionY].selected = true;
  }

  // Compares current tile to the path tile list tiles
  boolean pathCheck(Tile curr){

    for( Tile tile : path) {
      if (tile.x == curr.x && tile.y == curr.y) {
        return false;
      }
    }
    return true;
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
    if (stage == 7)
    {

    
    if (key == 'f')
      {
        stage = 9;
      }


    // Placing the Freeze tower
    if (key == 's')
        {
        // Gets the data where the currentTile is
        Tile currentTile = grid.grid[selectionX][selectionY]; 
         
        
        if (currentTile.tower.towerType == 0 && statistics.amount >= 100)
        
        if (currentTile.tower.towerType == 0 && statistics.amount >= statistics.freezeTowerCost && pathCheck(currentTile))
          {
          //Variables from the currentTile converted to the variable values from Tower
          int x = currentTile.x;
          int y = currentTile.y;
          int d = grid.grid[0][0].w / 2;
          currentTile.tower = new Tower(x, y, d, 2, 1);
          //Substracts an amount of gold
          statistics.amount -= statistics.freezeTowerCost;
          totalTowersPlaced++;
         }
        }


    // Placing a Laser tower
    if (key == 'a')
    {
      // Getting the information of the current x & y from your selected tile
      Tile currentTile = grid.grid[selectionX][selectionY]; 

      // The tile must be empty (towerType = 0) and the player must atleast have 50 gold  
      if (currentTile.tower.towerType == 0 && statistics.amount >= statistics.laserTowerCost && pathCheck(currentTile))
      {
        // Variable x & y get the same values as the x & y of the selected tile

        int x = currentTile.x;
        int y = currentTile.y;

        // Variable d gets the values of the height & width of one tile divided by 2

        int d = grid.grid[0][0].w / 2;
        currentTile.tower = new Tower(x, y, d, 1, 1);
        statistics.amount -= statistics.laserTowerCost;
        totalTowersPlaced++;
      }                 
    }
// controls for placing a farm tower
 if (key == 'z')
    {
      Tile currentTile = grid.grid[selectionX][selectionY]; 
        
      if (currentTile.tower.towerType == 0 && statistics.amount >= statistics.farmTowerCost && pathCheck(currentTile))
      {
        int x = currentTile.x;
        int y = currentTile.y;
        int d = grid.grid[0][0].w / 2;
        currentTile.tower = new Tower(x, y, d, 4, 1);
        statistics.amount -= statistics.farmTowerCost;
        totalTowersPlaced++;
      }                 
    }

    //Controls for placing the bomb tower
        if (key == 'x')
        {
        Tile currentTile = grid.grid[selectionX][selectionY]; 
         
        if (currentTile.tower.towerType == 0 && statistics.amount >= statistics.bombTowerCost && pathCheck(currentTile))
          {
          int x = currentTile.x;
          int y = currentTile.y;
          int d = grid.grid[0][0].w / 2;
          currentTile.tower = new Tower(x, y, d, 3, 1);
          statistics.amount -= statistics.bombTowerCost;
          totalTowersPlaced++;
         }
        }


      //Controls for selling a tower
      if(key == 'q')
      {
        //selects your currentTile
      Tile currentTile = grid.grid[selectionX][selectionY];
        int x = currentTile.x;
        int y = currentTile.y;
        int d = grid.grid[0][0].w / 2;
        // a different case for each tower. If it's located on the currentTile get some money back,removes tower.
        switch(currentTile.tower.towerType)
        { 
          case 1:
            statistics.amount += (statistics.laserTowerCost/2) * currentTile.tower.towerLevel;
            currentTile.tower = new Tower(x, y, d, 0, 1);
            totalTowersSold++;
            return;
          case 2:
            statistics.amount += (statistics.freezeTowerCost/2) * currentTile.tower.towerLevel;
            currentTile.tower = new Tower(x, y, d, 0, 1);
            totalTowersSold++;
            return;
          case 3:
            statistics.amount += (statistics.bombTowerCost/2) * currentTile.tower.towerLevel;
            currentTile.tower = new Tower(x, y, d, 0, 1);
            totalTowersSold++;
            return;
          case 4:
            statistics.amount += (statistics.farmTowerCost/2) * currentTile.tower.towerLevel;
            currentTile.tower = new Tower(x, y, d, 0, 1);
            totalTowersSold++;
            return;
        }
      }

        // Upgrade towers
        if(key == 'p')
        {
          Tile currentTile = grid.grid[selectionX][selectionY];

          upgradeX = (selectionX * grid.grid[0][0].w) + grid.grid[0][0].w/2;
          upgradeY = (selectionY * grid.grid[0][0].w) + grid.grid[0][0].w;
          //LaserTower upgrade
          if(currentTile.tower.towerType == 1 && statistics.amount >= (statistics.laserTowerCost + (statistics.laserTowerCost/2)) * currentTile.tower.towerLevel)
          {
            upgrading = true;
            statistics.amount -= (statistics.laserTowerCost + (statistics.laserTowerCost/2)) * currentTile.tower.towerLevel;
            currentTile.tower.towerLevel += 1;
            currentTile.tower.laserDamage = currentTile.tower.towerLevel;
          }

          //FreezeTower upgrade
          else if(currentTile.tower.towerType == 2 && statistics.amount >= (statistics.freezeTowerCost + (statistics.freezeTowerCost/2)) * currentTile.tower.towerLevel)
          {
            upgrading = true;
            statistics.amount -= (statistics.freezeTowerCost + (statistics.freezeTowerCost/2)) * currentTile.tower.towerLevel;
            currentTile.tower.towerLevel += 1;
            currentTile.tower.freezeDamage = currentTile.tower.towerLevel * 0.01;
            if(currentTile.tower.towerLevel <= 4)
            {
              currentTile.tower.freezePower = 0.9 - (currentTile.tower.towerLevel * 0.1);
            }
          }

          //FarmTower upgrade
          if(currentTile.tower.towerType == 4 && statistics.amount >= statistics.farmTowerCost * currentTile.tower.towerLevel)
          {
            upgrading = true;
            statistics.amount -= statistics.farmTowerCost * currentTile.tower.towerLevel;
            currentTile.tower.towerLevel += 1;
            currentTile.tower.goldPerFarm += 50;
          }

          //Bombtower upgrade
          if (currentTile.tower.towerType == 3 && statistics.amount >= statistics.bombTowerCost * currentTile.tower.towerLevel)
          {
            upgrading = true;
            statistics.amount -= statistics.bombTowerCost * currentTile.tower.towerLevel;
            currentTile.tower.towerLevel += 1;
            currentTile.tower.bombDamage *= currentTile.tower.towerLevel;
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

  void upgradeText()
  {
    Tile currentTile = grid.grid[selectionX][selectionY];

        laserUpgradeCost = (statistics.laserTowerCost + (statistics.laserTowerCost/2)) * currentTile.tower.towerLevel;
        freezeUpgradeCost = (statistics.freezeTowerCost + (statistics.freezeTowerCost/2)) * currentTile.tower.towerLevel;
        bombUpgradeCost = statistics.bombTowerCost * currentTile.tower.towerLevel;
        farmUpgradeCost = statistics.farmTowerCost * currentTile.tower.towerLevel;

        if(currentTile.selected && currentTile.tower.towerType == 1)
      {
        fill(50);
        textAlign(CENTER);
        text("Upgrade cost: " + laserUpgradeCost, SIZE_X/2, 75);
        textAlign(CORNER);
      }

              if(currentTile.selected && currentTile.tower.towerType == 2)
      {
        fill(50);
        textAlign(CENTER);
        text("Upgrade cost: " + freezeUpgradeCost, SIZE_X/2, 75);
        textAlign(CORNER);
      }

              if(currentTile.selected && currentTile.tower.towerType == 3)
      {
        fill(50);
        textAlign(CENTER);
        text("Upgrade cost: " + bombUpgradeCost, SIZE_X/2, 75);
        textAlign(CORNER);
      }

              if(currentTile.selected && currentTile.tower.towerType == 4)
      {
        fill(50);
        textAlign(CENTER);
        text("Upgrade cost: " + farmUpgradeCost, SIZE_X/2, 75);
        textAlign(CORNER);
      }

  }
}