// This class holds the image file for our map.
// It can be displayed by calling the display() function.
class Map 
{
  PImage bg;

  void display() 
  {
    background(bg);
  }

  void init()
  {
    bg = loadImage("bg.PNG");
    bg.resize(SIZE_X, SIZE_Y);
  }
}
