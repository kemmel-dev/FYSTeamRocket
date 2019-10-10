class LaserTower 
{ 
 int x;
 int y;
 int size;
 float radius;
 
 Style style;
 
 LaserTower() 
 {
   size = 50;
   radius = size*3;
   style = new Style();
 }
 
 void display()
 {
   fill(style.cTower);
   circle(x, y, size);
   fill(style.transparent);
   circle(x, y, radius);
 }
}

class Style 
{
  color cTower = color(100, 100, 100);
  color transparent = color(0, 0, 0, 0);
}