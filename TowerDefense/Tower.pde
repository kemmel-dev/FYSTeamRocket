/**
  * Towers can be placed on Tiles and can be used i.e. to shoot enemies
  * @author Kamiel de Visser | 500838438
  */
class Tower 
{ 
  // Has an x and y position
  int x;
  int y;
  // diameter and radius for the tower itself
  int d;
  int r;
  int wTile = int(SIZE_X / 16);
  // Damage dealt to the enemy
  float laserDamage, freezePower, freezeDamage, bombDamage;

  // The enemy the tower is targetting
  Enemy enemy;

  // Is the tower shooting?
  Boolean shooting = false;

  // What type of tower is this tower?
  // 0 = Tower "doesn't exist"
  // 1 = Lasertower
  // 2 = Freezetower
  // 3 = Bombtower
  // 4 = Farmtower
  int towerType;

  // The level of the Tower
  int towerLevel;

  // radius for the towers shooting range
  int range;
  float rangeFreezeTower, rangeDFT;
  int rangeBombTower;
  // and it's shooting range diameter
  int rangeD;

  int timer = 0;
  int goldPerFarm = 25;
  

  Style style;

  /**
    * Constructor function for a tower
    * @param _x the x position of this tower
    * @param _y the y position of this tower
    * @param _d the diameter of this tower
    * @param _towerType the type of this tower
    * @param _towerLevel the level of this tower
    * @author Kamiel de Visser | 500838438
    */
  Tower(int _x, int _y, int _d, int _towerType, int _towerLevel)
  {
    x = _x;
    y = _y;
    d = _d;
    r = d / 2;
    range = r * 10;
    rangeFreezeTower = range/1.5;
    rangeDFT = rangeFreezeTower + rangeFreezeTower;
    rangeBombTower = range*2;
    rangeD = range + range;
    style = new Style();
    towerType = _towerType;
    towerLevel = _towerLevel;
    laserDamage = towerLevel;
    freezePower = 0.8;
    bombDamage = 20;
  }




  /**
    * Displays the tower.
    * @author Kamiel de Visser | 500838438
    */
  void display()
  {
    // if type is not non-existent
    if (towerType == 1)
    {
    
      imageMode(CENTER);
      lasertower.resize(100,100);
      image(lasertower, x, y);
      textSize(15);
      fill(0);
      text(towerLevel,x+ wTile/3,y+ wTile/3);
    
    }
    if (towerType == 2)
    {
      
      imageMode(CENTER);
      freezetower.resize(100,100);
      image(freezetower, x, y);
       textSize(15);
      fill(0);
      text(towerLevel,x+ wTile/3,y+ wTile/4);  
    }
    if (towerType == 3)
    {
      imageMode(CENTER);
      image(bombtower, x, y);
       textSize(15);
      fill(0);
     text(towerLevel,x+ wTile/3,y+ wTile/4);
    }

     if (towerType == 4)
    {
      
      imageMode(CENTER);
      farmtower.resize(100,100);
      image(farmtower, x, y);
       textSize(15);
      fill(0);
      text(towerLevel,x+ wTile/3,y+ wTile/4);
   }
  }

  /**
    * Looks for enemies in range of this tower
    * @return true if an enemy has been found
    * @author Kamiel de Visser | 500838438
    */
  public Boolean checkForEnemies()
  {
    for (Enemy e : enemies)
    {
      if (ifEnemyIsInRange(e))
      {
        // Here: Enemy found and assigned to enemy
        return true;
      }
    }
    return false;
  }

  /**
    * Checks whether a specific enemy is in range of the tower.
    * Returns true and assigns enemy to this tower's target enemy field 
    * if the enemy is in range.
    * @author Kamiel de Visser | 500838438
    * @return true if the enemy is in range, false otherwise.
    */
  public Boolean ifEnemyIsInRange(Enemy e)
  {
    // distance from the tower to the enemy
    float distance = dist(x, y, e.x, e.y);
    // if the enemy is in range
    if (distance < range)
    {
      // we're now shooting
      shooting = true;
      // assign the targeted enemy 'e' to enemy
      enemy = e;
      return true;
    }
    return false;
  }

  /**
    * Shoots an enemy
    * @author Kamiel de Visser | 500838438
    */
  private void shootEnemy()
  {
    switch(towerType)
    {
      case 1:
        shootLaser();
        return;
      case 2:
        freezeEnemies();
        return;
      case 3:
        throwBombs();
        return;
      default:
        return;
    }
  }

  /**
    * Shoots the enemy with a laser
    * @author Kamiel de Visser | 500838438
    */
  private void shootLaser()
  {
    // if target is still in range
    if (ifEnemyIsInRange(enemy))
    {
      // Let target take damage
      if (enemy.takeDamage(laserDamage))
      {
        // if enemy died because of this damage, stop shooting
        assetsLoader.laserSound.stop();
        shooting = false;
       
      }
      enemy.takingDamage = true;
        
      // shoot the laser
      assetsLoader.laserSoundEffect();
      stroke(style.laserColor);
      strokeWeight(style.laserStrokeWeight);
      line(x, y, enemy.x, enemy.y);
      stroke(style.black);
      strokeWeight(style.defaultStrokeWeight);
    }
    // if target is no longer in range, stop shooting
    else 
    {
      assetsLoader.laserSound.stop();
      shooting = false;
      enemy.takingDamage = false;
    }
  }

  void freezeEnemies()
  {
    Iterator<Enemy> i = enemies.iterator();
    while (i.hasNext())
    {
      float distances[] = new float[wave.enemiesLeft];
      Enemy e = i.next();
      for(int j = 0; j < wave.enemiesLeft; j++)
      {
        distances[j] = dist(x, y, e.x, e.y);
        if(distances[j] < rangeFreezeTower)
        {
          if(e.msMultiplier > freezePower)
          {
            e.msMultiplier = freezePower;
          }
          e.frozenEnemy = true;
        }
        else 
        {
          if(e.enemyType == 1)
          {
            e.msMultiplier = 1;
          }
          else if(e.enemyType == 2)
          {
            e.msMultiplier = 0.35;
          }
          else 
          {
            e.msMultiplier = 1.6;
          }
          e.frozenEnemy = false;
        }
      }
    }
  }


// void goldPopUp()
// {
  
//     textSize(30);
//     fill(250,0,0);
//     text(goldPerFarm, tower.x,  tower.y);

// }
  void farmGold()
    {   
      timer++;

        if (timer == FRAME_RATE * 10)
        {
            statistics.amount+= goldPerFarm;
            timer = 0;
            text(goldPerFarm,x,y);
            // goldPopUp();
        }
    }

   void throwBombs()
  {
      if (ifEnemyIsInRange(enemy))
      {
        //Creating the coordinates for the bomb
        PVector bomb;
        bomb = new PVector(x, y);

        //This will run for 2 frames every 30 frames(1 second).
        if (frameCount % 30 < 2)
        {
          //Placing the bomb on the enemy
          bomb.x = enemy.x;
          bomb.y = enemy.y;

          //Display the bomb
          fill(style.bombColor, 75);
          image(explosion, bomb.x, bomb.y);

          //This will play the bombsound once per explosion
          //Without this if statement the sound would run twice because the bomb runs for 2 frames
            if(frameCount % 30 < 1)
            {
              assetsLoader.bombSound.stop();
              assetsLoader.bombSound();
            }
        }

        //ArrayList for all enemies that are in range of the bombtower
        ArrayList<Enemy> target = enemiesInBombtowerRange();

        //For every target (enemy in range of bombtower)
        for (Enemy enemy : target)
        {
          //Calculates the distance between the center of the bomb and the center of the enemy
          float distance = dist(bomb.x, bomb.y, enemy.x, enemy.y); 

          //If an enemy is in the radius of the explosion
          if (distance <= style.bombSize/2 + enemy.w/2)
          {
            //Deal damage to that enemy
            enemy.takeDamage(bombDamage);
          }
        }

        //When an enemy is dead, stop shooting so that the next enemy can be targeted.
        if(enemy.hitpoints <= 0)
        {
          shooting = false;
        }
      }
      else
      {
        shooting = false;
      }
  }

  //ArrayList for enemies that are in range of the bombradius
  ArrayList<Enemy> enemiesInBombtowerRange()
  {
    ArrayList<Enemy> enemiesInBombtowerRange = new ArrayList<Enemy>();

      //Checks for every enemy if they are in range of the bomb radius
      for(Enemy enemy : enemies)
      {
        //Calculates the distance between the bombtower and the enemy
        float dist = dist(x, y, enemy.x, enemy.y);

        //If the distance between the bombtower and the enemy is smaller than the bombtower range
        if(dist <= rangeBombTower);
        {
          //Add an enemy to the ArrayList "enemiesInBombtowerRange"
          enemiesInBombtowerRange.add(enemy);
        }
      }
      return enemiesInBombtowerRange;
  }

  /**
    * holds styling options for a Tower object
    * @author Kamiel de Visser | 500838438
    */
  class Style 
  {
    color fillColor = color(100, 100, 100);
    color rangeFill = color(0, 0, 0);
    color laserColor = color(20, 235, 20, 100);
    color black = 0;
    color iceBlue = color(186, 242, 239);
    int laserStrokeWeight = SIZE_X / 250;
    int defaultStrokeWeight = 1;
    color bombColor = color(255, 255, 0);
    int bombSize = 150;
  }
}