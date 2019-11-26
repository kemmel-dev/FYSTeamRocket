class Grid 
{

  int sizeX = 16;
  int sizeY = 9;

  Tile[][] grid = new Tile[sizeX][sizeY];

  // Initialises the grid with Tile objects
  void initGrid()
  {
    int w = int(SIZE_X / 16);
    int xPos = int(w / 2);
    int yPos = int(w / 2);

    for (int y = 0; y < sizeY; y++)
    {
      for (int x = 0; x < sizeX; x++)
      {
        grid[x][y] = new Tile(xPos, yPos, w);
        xPos += w;
      }
      xPos = int(w / 2);
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

        // Draws tower images in upgrade menu tiles @Twab
        if (x == this.sizeX - 1) {
          fill(100,100,100);
          ellipse(SIZE_X - tile.w/2, 0 + tile.w/2, tile.w / 2, tile.w / 2);
          fill(186, 242, 239);
          ellipse(SIZE_X - tile.w/2, tile.w + tile.w/2, tile.w / 2, tile.w / 2);
        }
      }
    }
  }
}