class Clicked 
{
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
 float radius;
 int count;
 ArrayList laserTower = new ArrayList();
 
 Style style;
 
 LaserTower(int x, int y) 
 {
   posX = x;
   posY = y;
   size = 50;
   radius = size*2.5;
 }
 
 void laserTower() 
 {
   for(int i = 0; i < laserTower.size(); i++) 
   {
     fill(style.cTower);
     circle(posX, posY, size);
     fill(style.transparent);
     circle(posX, posY, radius);
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
  color transparent = color(0, 0, 0, 0);
}