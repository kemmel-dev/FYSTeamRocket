class Clicked {
  LaserTower laserT;
  
  void pressSB() {
    if(key == ' ') {
      laserT.laserTower.add(new LaserTower(mouseX, mouseY));
      laserT.gold -= 100;
    }
     if(key == 'e') {
       laserT.gold += 100;
    }
  }
}

class LaserTower {
 int gold;
 float posX;
 float posY;
 float size;
 float radius;
 float count;
 ArrayList laserTower = new ArrayList();
 
 LaserTower(float x, float y) {
   gold = 100;
   posX = x;
   posY = y;
   size = 50;
   radius =  size/2;
 }
 
 void laserTower() {
   for(int i = 0; i < laserTower.size(); i++) {
     fill(100);
     circle(posX, posY, size);
    }
 }
  
 void placement() {
   for(int i = 0; i < laserTower.size(); i++) {
    laserTower.get(i);
    laserTower();
   }
 }
}