class Menus
{
    Style style;
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
        menuFont = createFont("Impact",style.fontSize);
        textFont(menuFont);
        fill(style.textColor);
        textAlign(CENTER);
        fill(125,125,0);
        text("Game Paused", SIZE_X / 2, SIZE_Y / 2);
        textSize(style.fontSize/2);
        text("Press 'START' to resume", SIZE_X / 2, SIZE_Y / 1.5);
        if (keyPressed)
                {   
                    if (key == 'j')
                    {
                        stage = 2;
                    }
                }
    }

    void display()
    {
        
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
        fill(0);
        rectMode(CORNER);
        rect(0,0,width,height);
        rectMode(CENTER);
        fill(0,200,50);
        textAlign(CENTER);
        text("Press START to play again",width/2,height/2.1);
        text("GAME OVER",width/2, height/3);
        noFill();
        if (keyPressed)
                {   
                    if (key == 'j')
                    {
                        stage = 1;
                    }
                }
    }

    void controlsMenu()
    {
        image(controlsimage,0,0,width,height);
        if (keyPressed)
                {   
                    if (key == 'j')
                    {
                        stage = 2;
                    }
                }
    }

    void startMenu()
    {
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        fill(0);
        textAlign(CENTER);
        text("Press any key to begin",width/1.89,height/1.7);
        noFill();
        if (keyPressed)
        {   
            stage = 5;
        }

    }
}

   

