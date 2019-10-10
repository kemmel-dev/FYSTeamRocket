class Clicked {
  LaserTower laserT;
  
  void pressSB() 
  {
    if(key == ' ') 
    {
      laserT.laserTower.add(new LaserTower(mouseX, mouseY));
    }
  }
}

class LaserTower 
{
 int posX;
 int posY;
 int size;
 int radius;
 int count;
 ArrayList laserTower = new ArrayList();
 
 Style style;
 
 LaserTower(int x, int y) 
 {
   gold = 100;
   posX = x;
   posY = y;
   size = 50;
   radius =  size/2;
 }
 
 void laserTower() 
 {
   for(int i = 0; i < laserTower.size(); i++) 
   {
     fill(style.cTower);
     circle(posX, posY, size);
    }
 }
  
 void placement() 
 {
   for(int i = 0; i < laserTower.size(); i++) 
   {
    laserTower.get(i);
    laserTower();
   }
 }
}

class Style 
{
  color cTower = color(100, 100, 100);
}