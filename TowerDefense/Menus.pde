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
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,335,300,50);

        imageMode(CENTER);
        image(tower, width/2.5, 335, 100, 100);
        imageMode(CORNER);

        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

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
                    keyPressed = false;
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
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);
        
        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,435,300,50);

        imageMode(CENTER);
        image(tower, width/2.5, 435, 100, 100);
        imageMode(CORNER);
        
        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

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
                    keyPressed = false;
                }
                if (keyCode == DOWN)
                {
                    stage = 3;
                    keyPressed = false;
                }
            }
            if (key == 'p')
                {
                    stage = 10;
                    keyPressed = false;
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
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,535,300,50);

        imageMode(CENTER);
        image(tower, width/2.5, 535, 100, 100);
        imageMode(CORNER);
        
        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

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
                    keyPressed = false;
                }
                if (keyCode == DOWN)
                {
                    stage = 4;
                    keyPressed = false;
                }
            }
            if (key == 'p')
                {
                    stage = 11;
                    keyPressed = false;
                }
        }

    }
    
    // Credits HIGHLIGHTED
    void startMenu4()
    {
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,635,300,50);

        imageMode(CENTER);
        image(tower, width/2.5, 635, 100, 100);
        imageMode(CORNER);
        
        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

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
                    keyPressed = false;
                }
                if (keyCode == DOWN)
                {
                    stage = 5;
                    keyPressed = false;
                }
            }
            if (key == 'p')
                {
                    stage = 13;
                    keyPressed = false;
                }
        }
    }
    // Exit Game HIGHLIGHTED
    void startMenu5()
    {
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,735,300,50);

        imageMode(CENTER);
        image(tower, width/2.5, 735, 100, 100);
        imageMode(CORNER);
        
        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

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
                    keyPressed = false;
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
        fill(0,100);
        rect(0,0,width*2,height*2);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(50);
        stroke(180);
        strokeWeight(10);
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);

        rect(width/2,135,300,50);
        rect(width/2,205,400,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(8);
        rect(width/2,485,300,50);

        imageMode(CENTER);
        image(tower, width/2.5, 485, 100, 100);
        imageMode(CORNER);

        noStroke();
        fill(220);
        text("Resume",width/2,500);
        text("Controls",width/2,600);
        text("Leave",width/2,700);

        text("Game Paused",width/2,150);
        text("Current Score: " + statistics.scorePoints,width/2,220);

        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);
        noFill();
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == DOWN)
                {
                    stage = 14;
                    keyPressed = false;
                }
            }
            if (key == 'p')
            {
                stage = 7;
                keyPressed = false;
            }
        }
    }

    void displayPauseMenu2()
    {
        fill(0,100);
        rect(0,0,width*2,height*2);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(50);
        stroke(180);
        strokeWeight(10);
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);

        rect(width/2,135,300,50);
        rect(width/2,205,400,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,585,300,50);

        imageMode(CENTER);
        image(tower, width/2.5, 585, 100, 100);
        imageMode(CORNER);

        noStroke();
        fill(220);
        text("Resume",width/2,500);
        text("Controls",width/2,600);
        text("Leave",width/2,700);

        text("Game Paused",width/2,150);
        text("Current Score: " + statistics.scorePoints,width/2,220);

        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);
        noFill();
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == DOWN)
                {
                    stage = 15;
                    keyPressed = false;
                }
                if (keyCode == UP)
                {
                    stage = 9;
                    keyPressed = false;
                }
            }
            if (key == 'p')
            {
                stage = 16;
            }
        }
    }

    void displayPauseMenu3()
    {
        fill(0,100);
        rect(0,0,width*2,height*2);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(50);
        stroke(180);
        strokeWeight(10);
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);

        rect(width/2,135,300,50);
        rect(width/2,205,400,50);

        rect(width/1.2,950,360,120);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,685,300,50);

        imageMode(CENTER);
        image(tower, width/2.5, 685, 100, 100);
        imageMode(CORNER);

        noStroke();
        fill(220);
        text("Resume",width/2,500);
        text("Controls",width/2,600);
        text("Leave",width/2,700);

        text("Game Paused",width/2,150);
        text("Current Score: " + statistics.scorePoints,width/2,220);

        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);
        noFill();
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    stage = 14;
                    keyPressed = false;
                }
            }
            if (key == 'p')
            {
                stage = 1;
                keyPressed = false;
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

    void gameOverMenu(ArrayList<Pair<Integer,String>> scoreList)
    {   
        String name = " ";
        if(!scoreList.isEmpty())
        {
            name = scoreList.get(0).getSecond();
        }
        image(gameoverscreen,0,0);
        rectMode(CENTER);
        fill(50);
        stroke(0);
        strokeWeight(10);
        rect(width/2,100,200,50);
        fill(220);
        textAlign(CENTER);
        text("GAME OVER",width/2, 115);
        text("Press Start For Main Menu",width/2,400);
        text("score:   " + statistics.scorePoints +"     " + name, width/2,600);
        noFill();
        if (keyPressed)
                {   
                    if (key == 'j')
                    {
                        stage = 1;
                        statistics.reset();
                        sortScores(scoreList);
                        keyPressed = false;
                    }
                }
    }

    void controlsMenu()
    {
        image(controlsimage,0,0,width,height);
        rectMode(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/1.2,950,360,120);

        noStroke();
        fill(220);
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        stage = 2;
                        keyPressed = false;
                    }
                }
    }

    void controlsMenuPause()
    {
        image(controlsimage,0,0,width,height);
        rectMode(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/1.2,950,360,120);

        noStroke();
        fill(220);
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        stage = 14;
                        keyPressed = false;
                    }
                }
    }

    
    void leaderBoardsMenu(ArrayList<Pair<Integer,String>> scoreList)
    {
        image(altsmenu,0,0,width,height);
        rectMode(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/1.2,950,360,120);

        noStroke();
        fill(220);
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        int len = min(10, scoreList.size());
        for (int i = 0; i < len; ++i) {
            text((i + 1) + ": " + scoreList.get(i).getSecond() + "   " + scoreList.get(i).getFirst(), width/2, height/10 + i * 100);
        }


        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        stage = 3;
                        keyPressed = false;
                    }
                }
    } 


    void creditsMenu()
    {
        image(altsmenu,0,0,width,height);
        rectMode(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/1.2,950,360,120);

        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        
        fill(50);
        text("Credits",width/2,150);
        text("Made by Team Rocket",width/2,190);

        text("Teamleader:",width/2,300);
        text("Kamiel de Visser",width/2,340);
        text("The Team:",width/2,420);
        text("Tobias van der Hoek",width/2,460);
        text("Jorrit Goossens",width/2,500);
        text("Alexandrosz Tarnoki",width/2,540);
        text("Chris van Schagen",width/2,580);

        noStroke();
        fill(220);
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        stage = 4;
                        keyPressed = false;
                    }
                }
    }
}

   

