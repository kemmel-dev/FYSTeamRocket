final static int SIZE_X = 1600;
final static int SIZE_Y = 900;

Grid grid = new Grid();
Map map = new Map();

void settings()
{
    size(SIZE_X, SIZE_Y);
}

void setup()
{
    grid.initGrid();
    map.
}


void draw()
{
    drawBackground();
    drawTowers();
    drawEnemies();
    drawUI();
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