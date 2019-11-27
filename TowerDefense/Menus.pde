class Menus
{
    Style style;
    UpgradeMenu upgradeMenu = new UpgradeMenu(new PVector(1860, 60));

    Menus()
    {
        style = new Style();
    }

    void displayPauseMenu()
    {
        background(0);
        fill(style.textColor);
        textSize(style.fontSize);
        text("Paused yo", SIZE_X / 2, SIZE_Y / 2);
    }

    void display()
    {
        upgradeMenu.display();
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

    class UpgradeMenu
    {

        PVector pos;

        float buttonWidth = SIZE_X / grid.sizeX;
        float buttonHeight = buttonWidth;
        int numberOfButtons = 1;

        UpgradeMenu(PVector _pos)
        {
            pos = _pos;
        }

        void display()
        {
            fill(255); 
        }
    
    }
}

   

