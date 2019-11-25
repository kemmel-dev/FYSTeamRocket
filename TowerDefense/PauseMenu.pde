class PauseMenu
{
    Style style;

    PauseMenu()
    {
        style = new Style();
    }

    void display()
    {
        background(0,0,0,100);
        fill(style.textColor);
        textSize(style.fontSize);
        text("Game Paused", SIZE_X / 2, SIZE_Y / 2);
        textSize(style.fontSize / 2);
        text("Press 'A' to resume", SIZE_X / 2, SIZE_Y / 1.5);
    }

    class Style
    {
        color textColor = 255;
        int fontSize = SIZE_X / 10;
    }

    void keyPressed()
    {
        gamePaused = false;
    }
}