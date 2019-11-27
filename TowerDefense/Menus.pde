class Menus
{
    Style style;
    UpgradeMenu upgradeMenu = new UpgradeMenu(new PVector(1860, 60));
    int sizeX, sizeY;
    int xPos;
    float buttonGap = 100;
    int buttonCount = 4;
    float[] yPos = new float[buttonCount];
    PFont menuFont;

    Menus()
    {   
        xPos = SIZE_X/2;
        sizeX = 400;
        sizeY = 80;

        for(int i = 0; i < buttonCount; i++)
        {
            yPos[i] = 400;
        }

        style = new Style();
    }

    void displayPauseMenu()
    {

        background(0);
        menuFont = createFont("Onyx",style.fontSize);
        textFont(menuFont);
        fill(style.textColor);
        textAlign(CENTER);
        fill(125,125,0);
        text("Game Paused", SIZE_X / 2, SIZE_Y / 2);
        textSize(style.fontSize/2);
        text("Press 'START' to resume", SIZE_X / 2, SIZE_Y / 1.5);
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


    void setupGameOverMenu()
    {
        for(int i = 0; i < buttonCount; i++)
        {
            yPos[i] += buttonGap;
        }
    }

    void gameOverMenu()
    {
        fill(50);
        rect(SIZE_X/2, SIZE_Y/2, SIZE_X, SIZE_Y);
        fill(100);
        for(int i = 0; i < buttonCount; i++)
        {
            rect(xPos, yPos[i], sizeX, sizeY);
        }
    }

    void controlsMenu()
    {
        image(controlsimage,0,0,width,height);
    }

    void startMenu()
    {
        
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

   

