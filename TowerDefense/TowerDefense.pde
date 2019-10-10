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
    grid.initGrid();
    map.init();
    rectMode(CENTER);

    // Set selected tile
    controls.selectionX = 7;
    controls.selectionY = 4;
    selectedTile = grid.grid[controls.selectionX][controls.selectionY];
}


void draw()
{
    checkForInputs();
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
    // grid.grid[1][1].style.fillColor = color(255,0,0);
    // grid.grid[1][1].style.opacity = 125;
    seletedTile.fillColor(color(255, 0, 0));

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