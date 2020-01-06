// Defines what a Tower is and can do.
class Tower 
{ 
  // Has an x and y position
  int x;
  int y;
  // diameter and radius for the tower itself
  int d;
  int r;

  // Damage dealt to the enemy
  float laserDamage, freezePower, freezeDamage;

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
  int goldPerFarm = 100;
  Style style;

  boolean aimed = false;
  boolean right = false;
  boolean up = false;

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
  }

  // Show this tower
  void display()
  {
    // if type is not non-existent
    if (towerType == 1)
    {
      //fill(style.fillColor, 255)
      imageMode(CENTER);
      lasertower.resize(100,100);
      image(lasertower, x, y);
    }
    if (towerType == 2)
    {
      //fill(style.iceBlue, 255);
      imageMode(CENTER);
      freezetower.resize(100,100);
      image(freezetower, x, y);
    }
    if (towerType == 3)
    {
      imageMode(CENTER);
      image(bombtower, x, y);
    }

     if (towerType == 4)
    {
      //fill(style.iceBlue, 255);
      imageMode(CENTER);
      farmtower.resize(100,100);
      image(farmtower, x, y);
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
        // case 4:
        // farmGold();
        // return;
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
        e.msMultiplier = freezePower;
        e.frozenEnemy = true;
        if (towerLevel >= 4)
        {
          e.takeDamage(freezeDamage);
        }
    }
  }

  void farmGold()
    {   
      timer++;

        if (timer == FRAME_RATE * 10)
        {
            statistics.amount+= goldPerFarm;
            timer = 0;
        }
    }

   void throwBombs()
  {
    if (ifEnemyIsInRange(enemy))
    {
      PVector tower, projectile, target;
      PVector tegenstander;
      tower = new PVector(x, y);
      projectile = new PVector(tower.x, tower.y);
      tegenstander = new PVector(enemy.x, enemy.y);
      target = new PVector(tegenstander.x, tegenstander.y);

        if (aimed == false)
        {
          // Make the starting position of the projectile be where the tower is
          projectile.x = tower.x;
          projectile.y = tower.y;
          
          // Aim at wherever the enemy currently is
          target.x = tegenstander.x - tower.x;
          target.y = tegenstander.y - tower.y;

          // Determines if bomb should go right or not
          if(target.x > 0) 
          {
            right = true;
          }
          else
          {
            right = false;
          }

          // Determines if bomb should go up or not
          if(target.y < 0)
          {
            up = true;
          }
          else
          {
            up = false;
          }

          aimed = true;
        }

if(aimed = true)
{
 if (projectile.x != tegenstander.x)
 {
   if(right == true)
   {
     projectile.x += 1;
   }
   else
   {
     projectile.x -= 1;
   }
 }

 if (projectile.y != tegenstander.y)
 {
   if (up == true)
   {
     projectile.y -= 1;
   }
   else
   {
     projectile.y +=1;
   }
 }
}

if(projectile.x == tegenstander.x && projectile.y == tegenstander.y)
{
  //explode and deal damage
  aimed = false;
}

  //Display the bomb
  fill(255, 255, 0);
  ellipse(projectile.x, projectile.y, 30, 30);
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
        e.msMultiplier = 1;
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
    color bombColor = color(200, 255, 0);
  }
}