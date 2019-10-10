class Grid 
{

  int sizeX = 16;
  int sizeY = 9;

  Tile[][] grid = new Tile[sizeX][sizeY];

  // Initialises the grid with Tile objects
  void initGrid()
  {
    int xPos = 0;
    int yPos = 0;
    int w = int(SIZE_X / 16);

    for (int y = 0; y < sizeY; y++)
    {
      for (int x = 0; x < sizeX; x++)
      {
        grid[x][y] = new Tile(xPos, yPos, w);
        xPos += w;
      }
      xPos = 0;
      yPos += w;
    }
  }

  // Displays the grid's tile objects.
  void display()
  {
    for (int y = 0; y < sizeY; y++)
    {
      for (int x = 0; x < sizeX; x++)
      {
        Tile tile = grid[x][y];
        tile.display();
      }
    }
  }
}