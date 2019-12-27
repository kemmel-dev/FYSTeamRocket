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
  float laserDamage = 1, freezePower;

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
  int rangeFreezeTower;
  int rangeBombTower;
  // and it's shooting range diameter
  int rangeD;

  Style style;

  // Constructor function for a tower
  Tower(int _x, int _y, int _d, int _towerType, int _towerLevel)
  {
    x = _x;
    y = _y;
    d = _d;
    r = d / 2;
    range = r * 10;
    rangeFreezeTower = range/2;
    rangeBombTower = range*2;
    rangeD = range + range;
    style = new Style();
    towerType = _towerType;
    towerLevel = _towerLevel;
    laserDamage = towerLevel;
    freezePower = 0.9;
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
      farmTower.resize(100,100);
      image(farmTower, x, y);
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
      println(laserDamage);
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
      println(laserDamage);
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
    }
  }

  void throwBombs()
  {
    float bombX = x;
    float bombY = y;
    float bombSize = 50;
    float targetX, targetY;
    if (ifEnemyIsInRange(enemy))
    {
      targetX = enemy.x;
      targetY = enemy.y;
      bombX = lerp (bombX, targetX, 0.5);
      bombY = lerp (bombY, targetY, 0.5);
      ellipse(bombX, bombY, bombSize, bombSize);
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
      if (distance < range)
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
  }
}