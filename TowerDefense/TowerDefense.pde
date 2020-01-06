// import the Iterator method to remove enemies from our
// import the sounds method
// arraylist in realtime.
import java.util.Iterator;
import processing.sound.*;
import de.bezier.data.sql.*;

MySQL msql;


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
AssetsLoader assetsLoader = new AssetsLoader();
ConnectDB connectDB = new ConnectDB();
ParticleSystem particleSystem = new ParticleSystem();
DatabaseProcess databaseProcess = new DatabaseProcess();
DatabaseSetup databaseSetup = new DatabaseSetup();

PImage startmenu;
PImage controlsimage;
PImage controlsmenu;
PImage altsmenu;
PImage gameoverscreen;

PImage lasertower;
PImage freezetower;
PImage bombtower;
PImage farmtower;

PImage lasertowerhud;
PImage freezetowerhud;
PImage bombtowerhud;
PImage farmtowerhud;

PImage goldcoin;
PImage lives;

PImage goldcoinhud;

PImage enemypic1;


PFont font;


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
    // Connect Database to the game
    connectDB.createDatabaseConnection();

    databaseProcess.hi();
    // Stage 1 = Start Menu
    stage = 1;
    // Load all Pictures
    assetsLoader.createImages();
    // Load all sounds
    assetsLoader.loadSounds();
    // FrameRate
    frameRate(FRAME_RATE);
    // Ensure we draw rectangles in CENTER mode
    rectMode(CENTER);
    textAlign(CENTER);
    // Initialize the grid and map and controls
    grid.initGrid();
    map.init();
    controls.initControls();
    menus.setupGameOverMenu();

    // Towers
    lasertower = loadImage("laser.png");
    freezetower = loadImage("freeze.png");
    bombtower = loadImage("bomb.png");
    farmtower = loadImage("farm.png");

    lasertowerhud = loadImage("laserhd.png");
    freezetowerhud = loadImage("freezehd.png");
    bombtowerhud = loadImage("bombhd.png");
    farmtowerhud = loadImage("farmhd.png");

    goldcoin = loadImage("gold.png");
    lives = loadImage("lives.png");

    goldcoinhud = loadImage("goldhd.png");

    lasertower.resize(100,100);
    freezetower.resize(100,100);
    bombtower.resize(100,100);
    farmtower.resize(100,100);

    lasertowerhud.resize(80,80);
    freezetowerhud.resize(80,75);
    bombtowerhud.resize(75,70);
    farmtowerhud.resize(80,75);

    goldcoin.resize(25,25);
    lives.resize(40,40);

    goldcoinhud.resize(20,20);
}

// Gets the currently selected tile
Tile GetCurrentTile()
{
    return grid.grid[controls.selectionX][controls.selectionY];
}

// Main method. Draws every frame of our game
void draw()
{
    textFont(font);

    // if paused display the pause menu
    switch(stage)
    {
        // Start Menu + New Game HIGHLIGHTED
        case 1:
            statistics.reset();
            menus.startMenu1();
            assetsLoader.startMenuMusic();
            return;
        // Start Menu + Controls HIGHLIGHTED
        case 2:
            menus.startMenu2();
            return;
        // Start Menu + Leaderboards HIGHLIGHTED
        case 3:
            menus.startMenu3();
            return;
        // Start Menu + Settings HIGHLIGHTED
        case 4:
            menus.startMenu4();
            return;
        // Start Menu + Credits HIGHLIGHTED
        case 5:
            menus.startMenu5();
            return;
        // Start Menu + Exit Game HIGHLIGHTED
        case 6:
            menus.startMenu6();
            return;

        // In Game Screen from Start Menu
        case 7:
            // Set currently selected tile
            selectedTile = GetCurrentTile();

            // Draw the background
            drawBackground();
            handleEnemies();
            handleTowers();

            // Draw the UI
            drawUI();

            // Draw Particles
            drawParticles();

            // Keep up with all the data
            statisticsData();

            //Start the waves
            wave.spawn();
            wave.end();
            menus.display();

        
            //Ingame music starts playing and loops
            assetsLoader.inGameMusic();
            
            return;
        
        // Game Over Menu from InGame Screen
        case 8:
            menus.gameOverMenu();
            statistics.reset();
            return;
        // Pause Menu from InGame Screen
        case 9:
            menus.displayPauseMenu();
            return;
        // Controls from Menu Screen
        case 10:
            menus.controlsMenu();
            return;
        // LeaderBoards Menu from Start Menu
        case 11:
            menus.leaderBoardsMenu();
            return;
        // Settings Menu from Start Menu
        case 12:
            menus.settingsMenu();
            return;
        // Credits Menu from Start Menu
        case 13:
            menus.creditsMenu();
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
            if (t.towerType == 4 && wave.enemiesLeft != 0)
            {
                t.farmGold();
                
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
    drawBase();
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
            statistics.scorePoints += 10;
            wave.enemiesKilledTotal++;
        }
        if(e.x - e.w > SIZE_X)
        {
            i.remove();
            statistics.lives--;
            wave.enemiesLeft--;
            wave.enemiesRemoved++;
        }
        if(statistics.gereset)
        {
            i.remove();
        }
    }    
}


void drawUI()
{
    ui.drawTextBox();
    ui.lives();
    ui.gold();
    ui.waves();
    ui.score();
}

void statisticsData()
{
    statistics.handleLives();
}

void drawBase()
{
    base.baseStructure();
}

void drawParticles()
{
    
}

void databaseProcesses()
{
    databaseProcess.hi();
    databaseProcess.enemiesKilled();
    databaseProcess.towersPlaced();
    databaseProcess.towersSold();
}