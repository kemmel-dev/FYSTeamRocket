class PauseMenu
{
    Style style;

    PauseMenu()
    {
        style = new Style();
    }

    void display()
    {
        background(0);
        fill(style.textColor);
        textSize(style.fontSize);
        text("paused yo", SIZE_X / 2, SIZE_Y / 2);
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