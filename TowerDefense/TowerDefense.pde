// import the Iterator method to remove enemies from our
// arraylist in realtime.
import java.util.Iterator;

// Constants
final static int SIZE_X = 1600;
final static int SIZE_Y = 900;
final int FRAME_RATE = 30;
final static int MOVE_SPEED =int(SIZE_X / 1000) * 2;

// Create our objects
Grid grid = new Grid();
Map map = new Map();
Controls controls = new Controls();
Waypoints waypoints = new Waypoints();
PauseMenu pauseMenu = new PauseMenu();
Gold gold = new Gold();
Base base = new Base();
Lives lives = new Lives();

// Create a dynamic list to hold our enemies
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

// Is the game paused?
Boolean gamePaused = false;

// Holds the currently selected tile
Tile selectedTile;

// Ran as the very first method.
// Sets up the screen size.
void settings()
{
    size(SIZE_X, SIZE_Y);
}

// Runs after settings()
// Initialize a bunch of other settings and objects.
void setup()
{
    frameRate(FRAME_RATE);
    // Ensure we draw rectangles in CENTER mode
    rectMode(CENTER);
    textAlign(CENTER);
    // Initialize the grid and map and controls
    grid.initGrid();
    map.init();
    controls.initControls();

    // create enemy
    enemies.add(new Enemy());
}

// Gets the currently selected tile
Tile GetCurrentTile()
{
    return grid.grid[controls.selectionX][controls.selectionY];
}

// Main method. Draws every frame of our game
void draw()
{
    // if paused display the pause menu
    if (gamePaused)
    {
        pauseMenu.display();
    }
    // else play the game
    else 
    {
        // Set currently selected tile
        selectedTile = GetCurrentTile();

        // Draw the background
        drawBackground();
        handleEnemies();
        handleTowers();
        drawBase();

        // Draw the UI
        drawUI();
    }

}

// Handles all actions for each tower each frame.
void handleTowers()
{
    // Loop over all tiles
    for (int y = 0; y < 9; y++)
    {
      for (int x = 0; x < 16; x++)
      {
        Tile tile = grid.grid[x][y];
        // Look at the tower on that tile
        Tower t = tile.tower;
        // if tower 'exists'
        if (t.towerType != 0)
        {
            // Show tower
            t.display();
            // Either shoot an enemy or look for an enemy to shoot
            if (t.shooting)
            {
                t.shootEnemy();
            }
            else
            {
                t.checkForEnemies();
            }
        }
      }
    }
}

// Called whenever a key is pressed
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

// Draws our scene
void drawBackground()
{
    map.display();
    grid.display();
}

// Performs all actions for each enemy each frame
void handleEnemies()
{
    removeDeadEnemies();
    outOfBoundsEnemies();

    // For each enemy that's still alive
    for (Enemy enemy : enemies)
    {
        // Follow the path
        enemy.followPath();
        // Display it's new position
        enemy.display();
    }
}

// Removes dead enemies from our list.
void removeDeadEnemies()
{
    Iterator<Enemy> i = enemies.iterator();
    while (i.hasNext())
    {
        Enemy e = i.next();
        if (e.hitpoints < 0)
        {
            i.remove();
        }
    }    
}

void outOfBoundsEnemies()
{
    Iterator<Enemy> i = enemies.iterator();
    Enemy e = i.next();
    if(e.x > SIZE_X)
    {
        textSize(100);
        text("WHY YOU DO DIS", 0, 0);
    }
}

void drawUI()
{
    drawGold();
    drawLives();
}

void drawGold() 
{
    gold.giveGold();
    gold.textGold();
}

void drawBase()
{
    base.buildBase();
}

void drawLives()
{
    lives.setupLives();
}