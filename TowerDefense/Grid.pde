/**
 * Holds the grid that stores tiles on our map
 * @author Kamiel de Visser | 500838438
 */
class Grid 
{

  private final static int NUM_TILES_X = 16;
  private final static int NUM_TILES_Y = 9;

  public Tile[][] grid = new Tile[NUM_TILES_X][NUM_TILES_Y];

  /**
  * Initialises the grid with Tile objects
  * @author Kamiel de Visser | 500838438
  */
  void initGrid()
  {
    int w = int(SIZE_X / 16);
    int xPos = int(w / 2);
    int yPos = int(w / 2);

    for (int y = 0; y < NUM_TILES_Y; y++)
    {
      for (int x = 0; x < NUM_TILES_X; x++)
      {
        grid[x][y] = new Tile(xPos, yPos, w);
        xPos += w;
      }
      xPos = int(w / 2);
      yPos += w;
    }
  }

  /**
  * Displays the tile objects in the grid
  * @author Kamiel de Visser | 500838438
  */
  void display()
  {
    for (int y = 0; y < NUM_TILES_Y; y++)
    {
      for (int x = 0; x < NUM_TILES_X; x++)
      {
        Tile tile = grid[x][y];       
        tile.display();
      }
    }
  }
}