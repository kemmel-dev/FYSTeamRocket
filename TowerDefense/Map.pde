/**
 * This class holds the image file for our map.
 * Which can be displayed by calling the display() function.
 * @author Kamiel de Visser | 500838438
 */
class Map 
{
  // The image used to display the map
  private PImage bg;

  /**
   * Displays the map image
   */ 
  public void display() 
  {
    background(bg);
  }
  /**
   * Load in the map image
   */ 
  public void init()
  {
    bg = loadImage("bg.PNG");
    bg.resize(SIZE_X, SIZE_Y);
  }
}
