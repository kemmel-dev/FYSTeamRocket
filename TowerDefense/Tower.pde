// Defines what a Tower is and can do.
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
  int goldPerFarm = 500;
  

  Style style;

  // Constructor function for a tower
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
    bombDamage = 30;
  }




  // Show this tower
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
  // Look for enemies in range of this tower
  Boolean checkForEnemies()
  {
    for (Enemy e : enemies)
    {
      if (ifEnemyIsInRange(e))
      {
        // Enemy found and assigned to enemy
        return true;
      }
    }
    return false;
  }

  // Checks whether a specific enemy is in range of the tower.
  // Returns true and assigns enemy to the enemy if the enemy is in range.
  Boolean ifEnemyIsInRange(Enemy e)
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

  // Shoot an enemy
  void shootEnemy()
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

  void shootLaser()
  {
    // if target is still in range
    if (ifEnemyIsInRange(enemy))
    {
      // Let target take damage
      if (enemy.takeDamage(laserDamage))
      {
        assetsLoader.laserSound.stop();
        // if enemy died because of this damage, stop shooting
        shooting = false;
       
      }

      
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
    }
  }

  void freezeEnemies()
  {
    ArrayList<Enemy> targets = enemiesInRange();
      
    for (Enemy e : targets)
    {
      if(e.msMultiplier >= freezePower)
      {
        e.msMultiplier = freezePower;
        e.frozenEnemy = true;
        if (towerLevel >= 4)
        {
          e.takeDamage(freezeDamage);
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
      //Creating the vectors for the tower, projectile and enemy
      PVector tower, projectile, tegenstander;
      tower = new PVector(x, y);
      projectile = new PVector(tower.x, tower.y);
      tegenstander = new PVector(enemy.x, enemy.y);

      //This will run every 30 frames (1 second).
      if (frameCount % 30 == 0)
      {
        //Placing the bomb on the enemy
        projectile.x = tegenstander.x;
        projectile.y = tegenstander.y;

        //Display the bomb
        fill(style.bombColor, 75);
        image(explosion, projectile.x, projectile.y);
        //ellipse(projectile.x, projectile.y, style.bombSize, style.bombSize);
      }

      //Calculates the distance between the center of the bomb and the center of the enemy
      float distance = dist(projectile.x, projectile.y, tegenstander.x, tegenstander.y);
      
      //If a bomb and an enemy overlap, the enemy takes damage
      //---------------- only 1 enemy within the bomb radius gets damage, still need to fix that all enemies in radius take damage! -----------------
      if(distance <= style.bombSize/2 + enemy.w/2)
      {
        //Deal damage
        enemy.takeDamage(bombDamage);
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

  ArrayList<Enemy> enemiesInRange()
  {
    ArrayList<Enemy> enemiesInRange = new ArrayList<Enemy>();
    for (Enemy e : enemies)
    {
      // distance from the tower to the enemy
      float distance = dist(x, y, e.x, e.y);
      // if the enemy is in range
      if (distance < rangeFreezeTower)
      {
        assetsLoader.laserSound.stop();
        assetsLoader.freezeSoundEffect();
        enemiesInRange.add(e);
      }
      else 
      {
        if(e.enemyType == 1)
        {
          e.msMultiplier = 1;
        }
        else if(e.enemyType == 2)
        {
          e.msMultiplier = 0.4;
        }
        else
        {
          e.msMultiplier = 1.3;
        }
        enemiesInRange.remove(e);
        e.frozenEnemy = false;
      }
    }
    return enemiesInRange;
  }

  // holds styling options for tower-related options
  class Style 
  {
    color fillColor = color(100, 100, 100);
    color rangeFill = color(0, 0, 0);
    color laserColor = color(235, 20, 20, 210);
    color black = 0;
    color iceBlue = color(186, 242, 239);
    int laserStrokeWeight = SIZE_X / 100;
    int defaultStrokeWeight = 1;
    color bombColor = color(255, 255, 0);
    int bombSize = 150;
  }
}