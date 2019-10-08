class LaserTower {
 float laserTX;
 float laserTY;
 float laserTSize;
 float laserTRadius;
 float laserTCount;
 
 LaserTower(float x, float y) {
   laserTX = x;
   laserTY = y;
   laserTSize = 50;
   laserTRadius =  laserTSize/2;
   laserTCount = 30;
 }
  
  void placement() {
   for(int i = 0; i < laserTCount; i++) {
     fill(100);
     circle(laserTX, laserTY, laserTSize);
   }
 }
}