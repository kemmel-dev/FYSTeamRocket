class Tower 
{ 
  int x;
  int y;
  int d;
  int r;

  Enemy enemy;
  Boolean shooting;

  int towerType;

  // radius for the towers shooting range
  int range;

  Style style;
 
  Tower(int _x, int _y, int _d, int _towerType)
  {
    x = _x;
    y = _y;
    d = _d;
    r = d / 2;
    range = r * 20;
    style = new Style();
    towerType = _towerType;
  }

  void display()
  {
    if (towerType != 0)
    {
      print(d);
      fill(style.fillColor, 255);
      ellipse(x, y, d, d);
      fill(style.rangeFill, 0);
      ellipse(x, y, range, range);
    }
  }

  void checkForEnemies()
  {
    if (shooting)
    {
      return;
    }

  }

  void shootEnemy()
  {

  }

  class Style 
  {
    color fillColor = color(100, 100, 100);
    color rangeFill = color(0, 0, 0);
  }
}

