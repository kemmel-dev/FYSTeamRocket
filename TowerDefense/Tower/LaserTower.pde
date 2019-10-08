class LaserTower {
  float laserTowerX;
  float laserTowerY;
  float laserTowerSize;
  float laserTowerRadius;
  
  Tower(float x, float y) {
    laserTowerX = x;
    laserTowerY = y;
    laserTowerSize = 50;
    laserTowerRadius = laserTowerSize/2;
  }
  
  void placement() {
    fill(100);
    circle(laserTowerX, laserTowerY, laserTowerSize);
  }
}