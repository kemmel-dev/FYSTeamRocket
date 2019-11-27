// Defines what a Tower is and can do.
class Tower 
{ 
  // Has an x and y position
  int x;
  int y;
  // diameter and radius for the tower itself
  int d;
  int r;

  // The enemy the tower is targetting
  Enemy enemy;

  // Is the tower shooting?
  Boolean shooting = false;

  // What type of tower is this tower?
  // 0 = Tower "doesn't exist"
  // 1 = Default tower (Laser)
  int towerType;

  // radius for the towers shooting range
  int range;
  int rangeFreezeTower;
  // and it's shooting range diameter
  int rangeD;

  Style style;

  // Constructor function for a tower
  Tower(int _x, int _y, int _d, int _towerType)
  {
    x = _x;
    y = _y;
    d = _d;
    r = d / 2;
    range = r * 10;
    rangeFreezeTower = range/2;
    rangeD = range + range;
    style = new Style();
    towerType = _towerType;
  }

  // Show this tower
  void display()
  {
    // if type is not non-existent
    if (towerType == 1)
    {
      fill(style.fillColor, 255);
      ellipse(x, y, d, d);
    }
    if (towerType == 2)
    {
      fill(style.iceBlue, 255);
      ellipse(x, y, d, d);
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
      if (enemy.takeDamage(2))
      {
        // if enemy died because of this damage, stop shooting
        shooting = false;
      }
      stroke(style.laserColor);
      strokeWeight(style.laserStrokeWeight);
      line(x, y, enemy.x, enemy.y);
      stroke(style.black);
      strokeWeight(style.defaultStrokeWeight);
    }
    // if target is no longer in range, stop shooting
    else 
    {
      shooting = false;
    }
  }

  void freezeEnemies()
  {
    ArrayList<Enemy> targets = enemiesInRange();  
    for (Enemy e : targets)
    {
      e.msMultiplier = .5f;
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
        enemiesInRange.add(e);
      }
      else 
      {
        e.msMultiplier = 1;
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