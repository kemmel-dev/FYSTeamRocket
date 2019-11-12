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
        xPos = SIZE_X/2;
        yPos1 = SIZE_Y/3;
        yPos2 = SIZE_Y/2;
    }

    void display()
    {
        rectMode(CORNER);
        fill(style.black);
        rect(x, y, sizeX, sizeY);
        rectMode(CENTER);
        fill(style.red);
        textAlign(CENTER);
        textSize(style.textSize);
        text("Game over", xPos, yPos1);
        textSize(style.textSize2);
        text("You are too noob to play any further", xPos, yPos2);
    }

    class Style
    {
        color black = color(0, 0, 0, 150);
        color red = color(255, 50, 50);
        int textSize = 100;
        int textSize2 = 70;
    }
}