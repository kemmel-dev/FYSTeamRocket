final static int SIZE_X = 1600;
final static int SIZE_Y = 900;

Grid grid = new Grid();
Map map = new Map();
Controls controls = new Controls();

Tile selectedTile;

void settings()
{
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    // Ensure we draw rectangles in CENTER mode
    rectMode(CENTER);
    // Initialize the grid and map and controls
    grid.initGrid();
    map.init();
    initControls();
}

void initControls()
{
    // Set selected tile to the approximate middle of the grid
    controls.selectionX = 7;
    controls.selectionY = 4;
    grid.grid[controls.selectionX][controls.selectionY].selected = true;
}

// Gets the currently selected tile
Tile GetCurrentTile()
{
    return grid.grid[controls.selectionX][controls.selectionY];
}

void draw()
{
    selectedTile = GetCurrentTile();

    drawBackground();
    drawTowers();
    drawEnemies();
    drawUI();
}

void keyPressed() 
{
    controls.keyPressed();
}

void drawBackground()
{

    map.display();
    grid.display();
}

void drawTowers()
{

}

void drawEnemies()
{

}

void drawUI()
{

}