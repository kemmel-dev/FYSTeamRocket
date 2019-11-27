// import the Iterator method to remove enemies from our
// arraylist in realtime.
import java.util.Iterator;

// Constants
final static int SIZE_X = 1920;
final static int SIZE_Y = 1080;
final int FRAME_RATE = 30;
final static float MOVE_SPEED = (SIZE_X / 500) * 2;

// Create our objects
Grid grid = new Grid();
Map map = new Map();
Controls controls = new Controls();
Waypoints waypoints = new Waypoints();
Menus menus = new Menus();
Statistics statistics =  new Statistics();
UI ui = new UI();
Base base = new Base();
Wave wave = new Wave();

PImage startmenu;

// The game stages >> stage 1 = Start Menu, stage 2 = The Game itself, stage 3 = Game Over Screen.
int stage;

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
    // Stage 1 = Start Menu
    stage =  1;
    startmenu = loadImage("startimage.png");
    frameRate(FRAME_RATE);
    // Ensure we draw rectangles in CENTER mode
    rectMode(CENTER);
    textAlign(CENTER);
    // Initialize the grid and map and controls
    grid.initGrid();
    map.init();
    controls.initControls();
    menus.setupGameOverMenu();

    // create enemy
    //enemies.add(new Enemy());
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
    switch(stage)
    {
        case 1:
            image(startmenu,0,0,width,height);
            if (keyPressed)
            {
                if (key == ' ')
                stage = 2;
            }
            return;
        case 2:
            // Set currently selected tile
            selectedTile = GetCurrentTile();

            // Draw the background
            drawBackground();
            handleEnemies();
            handleTowers();
            drawBase();

            // Draw the UI
            drawUI();

            // Keep up with all the data
            statisticsData();

            //Start the waves
            wave.spawn();
            wave.end();
            menus.display();
            return;
        case 3:
            menus.gameOverMenu();
            return;
        case 4:
            menus.displayPauseMenu();
            return;

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
        menus.keyPressed();
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
    handleDeadEnemies();

    // For each enemy that's still alive
    for (Enemy enemy : enemies)
    {
        // Follow the path
        enemy.followPath();
        // Display it's new position
        enemy.display();
    }
}

// Removes dead enemies from our list and give gold.
void handleDeadEnemies()
{
    Iterator<Enemy> i = enemies.iterator();
    while (i.hasNext())
    {
        Enemy e = i.next();
        if (e.hitpoints < 0)
        {
            i.remove();
            statistics.amount += 2;
            wave.enemiesLeft--;
            wave.enemiesRemoved++;
        }
        if(e.x - e.w > SIZE_X-SIZE_X/grid.sizeX)
        {
            i.remove();
            statistics.lives--;
            wave.enemiesLeft--;
            wave.enemiesRemoved++;
        }
    }    
}

void drawUI()
{
    uiSetup();
}

void uiSetup()
{
    ui.drawTextBox();
    ui.lives();
    ui.gold();
    ui.waves();
}

void statisticsData()
{
    statistics.handleLives();
}

void drawBase()
{
    base.baseStructure();
}