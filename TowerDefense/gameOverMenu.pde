class GameOverMenu
{
    int x, y, sizeX, sizeY, xPos, yPos1, yPos2;


    Style style = new Style();

    GameOverMenu()
    {
        x = 0;
        y = 0;
        sizeX = SIZE_X;
        sizeY = SIZE_Y;
        xPos = width/2;
        yPos1 = height/2;
        yPos2 = (height/3)*2;
    }

    void display()
    {
        rectMode(CORNER);
        fill(style.black);
        rect(x, y, sizeX, sizeY);
        rectMode(CENTER);
        textAlign(CENTER);
        text("Game over", xPos, yPos1);
        text("You are too noob to play any further", xPos, yPos2);
    }

    class Style
    {
        color black = color(0);
    }
}