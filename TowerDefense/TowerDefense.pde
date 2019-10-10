final static int SIZE_X = 1600;
final static int SIZE_Y = 900;
final int FRAME_RATE = 30;
final static int MOVE_SPEED =int(SIZE_X / 1000) * 2;

Grid grid = new Grid();
Map map = new Map();
Controls controls = new Controls();
Waypoints waypoints = new Waypoints();
PauseMenu pauseMenu = new PauseMenu();

ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Boolean gamePaused = false;

Tile selectedTile;

void settings()
{
    size(SIZE_X, SIZE_Y);

}

void setup()
{
    frameRate(FRAME_RATE);
    // Ensure we draw rectangles in CENTER mode
    rectMode(CENTER);
    textAlign(CENTER);
    // Initialize the grid and map and controls
    grid.initGrid();
    map.init();
    initControls();

    // create enemy
    enemies.add(new Enemy());
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
    if (gamePaused)
    {
        pauseMenu.display();
    }
    else 
    {
        selectedTile = GetCurrentTile();
        drawBackground();
        drawTowers();
        drawEnemies();
        drawUI();
    }

}

void keyPressed() 
{
    if (gamePaused)
    {
        pauseMenu.keyPressed();
    }
    else 
    {
        controls.keyPressed();
    }
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
    for (Enemy enemy : enemies)
    {
        enemy.followPath();
        enemy.display();
    }
}

void drawUI()
{

}