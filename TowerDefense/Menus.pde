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
    // New Game HIGHLIGHTED
    void startMenu1()
    {
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/2,385,300,50);
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);
        rect(width/2,785,300,50);
        rect(width/2,885,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,385,300,50);

        noStroke();
        fill(220);
        text("New Game",width/2,400);
        text("Controls",width/2,500);
        text("Leaderboards",width/2,600);
        text("Settings",width/2,700);
        text("Credits",width/2,800);
        text("Exit Game",width/2,900);

        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);
        
        textAlign(CENTER);
        fill(0);
        text("My Dear Smooth Sphere",width/2,100);
        noFill();
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == DOWN)
                {
                    stage = 2;
                }
            }
            if (key == 'p')
                {
                    stage = 7;
                }
        }

    }
    // Controls HIGHLIGHTED
    void startMenu2()
    {
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/2,385,300,50);
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);
        rect(width/2,785,300,50);
        rect(width/2,885,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,485,300,50);
        
        noStroke();
        fill(220);
        text("New Game",width/2,400);
        text("Controls",width/2,500);
        text("Leaderboards",width/2,600);
        text("Settings",width/2,700);
        text("Credits",width/2,800);
        text("Exit Game",width/2,900);

        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        textAlign(CENTER);
        fill(0);
        text("My Dear Smooth Sphere",width/2,100);
        noFill();
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    stage = 1;
                }
                if (keyCode == DOWN)
                {
                    stage = 3;
                }
            }
            if (key == 'p')
                {
                    stage = 10;
                }
        }

    }
    // Leaderboards HIGHLIGHTED
    void startMenu3()
    {
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/2,385,300,50);
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);
        rect(width/2,785,300,50);
        rect(width/2,885,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,585,300,50);
        
        noStroke();
        fill(220);
        text("New Game",width/2,400);
        text("Controls",width/2,500);
        text("Leaderboards",width/2,600);
        text("Settings",width/2,700);
        text("Credits",width/2,800);
        text("Exit Game",width/2,900);

        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        textAlign(CENTER);
        fill(0);
        text("My Dear Smooth Sphere",width/2,100);
        noFill();
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    stage = 2;
                }
                if (keyCode == DOWN)
                {
                    stage = 4;
                }
            }
            if (key == 'p')
                {
                    stage = 11;
                }
        }

    }
    // Settings HIGHLIGHTED
    void startMenu4()
    {
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/2,385,300,50);
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);
        rect(width/2,785,300,50);
        rect(width/2,885,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,685,300,50);
        
        noStroke();
        fill(220);
        text("New Game",width/2,400);
        text("Controls",width/2,500);
        text("Leaderboards",width/2,600);
        text("Settings",width/2,700);
        text("Credits",width/2,800);
        text("Exit Game",width/2,900);

        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        textAlign(CENTER);
        fill(0);
        text("My Dear Smooth Sphere",width/2,100);
        noFill();
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    stage = 3;
                }
                if (keyCode == DOWN)
                {
                    stage = 5;
                }
            }
            if (key == 'p')
                {
                    stage = 12;
                }
        }

    }
    // Credits HIGHLIGHTED
    void startMenu5()
    {
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/2,385,300,50);
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);
        rect(width/2,785,300,50);
        rect(width/2,885,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,785,300,50);
        
        noStroke();
        fill(220);
        text("New Game",width/2,400);
        text("Controls",width/2,500);
        text("Leaderboards",width/2,600);
        text("Settings",width/2,700);
        text("Credits",width/2,800);
        text("Exit Game",width/2,900);

        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        textAlign(CENTER);
        fill(0);
        text("My Dear Smooth Sphere",width/2,100);
        noFill();
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    stage = 4;
                }
                if (keyCode == DOWN)
                {
                    stage = 6;
                }
            }
            if (key == 'p')
                {
                    stage = 13;
                }
        }
    }
    // Exit Game HIGHLIGHTED
    void startMenu6()
    {
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/2,385,300,50);
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);
        rect(width/2,785,300,50);
        rect(width/2,885,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,885,300,50);
        
        noStroke();
        fill(220);
        text("New Game",width/2,400);
        text("Controls",width/2,500);
        text("Leaderboards",width/2,600);
        text("Settings",width/2,700);
        text("Credits",width/2,800);
        text("Exit Game",width/2,900);

        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        textAlign(CENTER);
        fill(0);
        text("My Dear Smooth Sphere",width/2,100);
        noFill();
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    stage = 5;
                }
            }
            if (key == 'p')
                {
                    exit();
                }
        }

    }

    void displayPauseMenu()
    {
        fill(0,2);
        rect(0,0,width*2,height*2);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/2,135,300,50);

        rect(width/1.15,950,430,120);

        noStroke();
        fill(220);
        text("Game Paused",width/2,150);

        textAlign(CORNER);
        text("L Bump  =  Exit Game",width/1.3,940);
        text("R Bump  =  Resume Game",width/1.3,990);
        if (keyPressed)
                {   
                    if (key == 'p')
                    {
                        stage = 7;
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
        fill(0,8);
        rectMode(CORNER);
        rect(0,0,width,height);
        rectMode(CENTER);
        fill(255,10,10);
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
                    if (key == 'q')
                    {
                        stage = 2;
                    }
                }
    }

    void leaderBoardsMenu()
    {
        background(0);
        text("Leaderboards",width/2,height/2);
        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        stage = 3;
                    }
                }
    } 

    void settingsMenu()
    {
        background(0);
        text("settings",width/2,height/2);
        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        stage = 4;
                    }
                }
    } 

    void creditsMenu()
    {
        background(0);
        text("credits",width/2,height/2);
        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        stage = 5;
                    }
                }
    }
}

   

