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
        //Background Image
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        //The Boxes
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);
        
        //Box for the controls in the Menu screen
        rect(width/1.2,950,360,120);

        //The HIGHLIGHTED Box
        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,335,300,50);

        //The Image of a Tower next to the HIGHLIGHTED Box
        imageMode(CENTER);
        image(tower, width/2.5, 335, 100, 100);
        imageMode(CORNER);
        
        //The Text in the Boxes
        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

        //Text in the box for the controls in the Menu screen
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);
        
        textAlign(CENTER);
        fill(0);
        text("Tower Rushers",width/2,100);
        noFill(); 
                    
        //Available Inputs
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == DOWN)
                {
                    //Goes to StartMenu2
                    stage = 2;
                    keyPressed = false;
                }
            }
            if (key == 'p')
                {
                    //Starts the Game
                    stage = 7;
                }
        }

    }
    // Controls HIGHLIGHTED
    void startMenu2()
    {
        //Background Image
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        //The Boxes
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);
                
        //Box for the controls in the Menu screen
        rect(width/1.2,950,360,120);

        //The HIGHLIGHTED Box
        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,435,300,50);

        //The Image of a Tower next to the HIGHLIGHTED Box
        imageMode(CENTER);
        image(tower, width/2.5, 435, 100, 100);
        imageMode(CORNER);
                
        //The Text in the Boxes
        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

        //Text in the box for the controls in the Menu screen
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        textAlign(CENTER);
        fill(0);
        text("Tower Rushers",width/2,100);
        noFill(); 
                    
        //Available Inputs
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    //Goes to StartMenu1
                    stage = 1;
                    keyPressed = false;
                }
                if (keyCode == DOWN)
                {
                    //Goes to StartMene3
                    stage = 3;
                    keyPressed = false;
                }
            }
            if (key == 'p')
                {
                    //Goes to the Controls Menu
                    stage = 10;
                    keyPressed = false;
                }
        }

    }
    // Leaderboards HIGHLIGHTED
    void startMenu3()
    {
        //Background Image
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        //The Boxes
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);
        
        //Box for the controls in the Menu screen
        rect(width/1.2,950,360,120);

        //The HIGHLIGHTED Box
        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,535,300,50);

        //The Image of a Tower next to the HIGHLIGHTED Box
        imageMode(CENTER);
        image(tower, width/2.5, 535, 100, 100);
        imageMode(CORNER);
                
        //The Text in the Boxes
        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

        //Text in the box for the controls in the Menu screen
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        textAlign(CENTER);
        fill(0);
        text("Tower Rushers",width/2,100);
        noFill(); 

        //Available Inputs
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    //Goes to StartMene2
                    stage = 2;
                    keyPressed = false;
                }
                if (keyCode == DOWN)
                {
                    //Goes to StartMenu4
                    stage = 4;
                    keyPressed = false;
                }
            }
            if (key == 'p')
                {
                    //Goes to The Leaderboards Menu
                    stage = 11;
                    keyPressed = false;
                }
        }

    }
    
    // Credits HIGHLIGHTED
    void startMenu4()
    {
        //Background Image
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        //The Boxes
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);
        
        //Box for the controls in the Menu screen
        rect(width/1.2,950,360,120);

        //The HIGHLIGHTED Box
        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,635,300,50);

        //The Image of a Tower next to the HIGHLIGHTED Box
        imageMode(CENTER);
        image(tower, width/2.5, 635, 100, 100);
        imageMode(CORNER);
        
        //The Text in the Boxes
        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

        //Text in the box for the controls in the Menu screen
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        textAlign(CENTER);
        fill(0);
        text("Tower Rushers",width/2,100);
        noFill();    

        //Available Inputs
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    //Goes to StartMenu3
                    stage = 3;
                    keyPressed = false;
                }
                if (keyCode == DOWN)
                {
                    //Goes to StartMenu5
                    stage = 5;
                    keyPressed = false;
                }
            }
            if (key == 'p')
                {
                    //Goes to the Credits Menu
                    stage = 13;
                    keyPressed = false;
                }
        }
    }
    // Exit Game HIGHLIGHTED
    void startMenu5()
    {
        //Background Image
        image(startmenu,0,0,width,height);
        rectMode(CENTER);
        textAlign(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        //The Boxes
        rect(width/2,335,300,50);
        rect(width/2,435,300,50);
        rect(width/2,535,300,50);
        rect(width/2,635,300,50);
        rect(width/2,735,300,50);
        
        //Box for the controls in the Menu screen
        rect(width/1.2,950,360,120);

        //The HIGHLIGHTED Box
        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,735,300,50);

        //The Image of a Tower next to the HIGHLIGHTED Box
        imageMode(CENTER);
        image(tower, width/2.5, 735, 100, 100);
        imageMode(CORNER);
        
        //The Text in the Boxes
        noStroke();
        fill(220);
        text("New Game",width/2,350);
        text("Controls",width/2,450);
        text("Leaderboards",width/2,550);
        text("Credits",width/2,650);
        text("Exit",width/2,750);

        //Text in the box for the controls in the Menu screen
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        //The title on the top of the Menu Screen
        textAlign(CENTER);
        fill(0);
        text("Tower Rushers",width/2,100);
        noFill();

        //Available Inputs
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    //Goes to StartMenu4
                    stage = 4;
                    keyPressed = false;
                }
            }
            if (key == 'p')
                {
                    //Exits the game
                    exit();
                }
        }

    }

    void displayPauseMenu()
    {
        //Fading away effect as a Background in the Pause Screen.
        fill(0,100);
        rect(0,0,width*2,height*2);

        rectMode(CENTER);
        textAlign(CENTER);
        fill(50);
        stroke(180);
        strokeWeight(10);

        //Boxes for the Selecting options
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);

        //Boxes for displaying Current Score & Game Paused
        rect(width/2,135,300,50);
        rect(width/2,205,400,50);

       //Text in the box for the controls in the current screen
        rect(width/1.2,950,360,120);

        //Current HIGHLIGHTED Box
        stroke(255,255,0);
        strokeWeight(8);
        rect(width/2,485,300,50);

        //The Image of a Tower next to the HIGHLIGHTED Box
        imageMode(CENTER);
        image(tower, width/2.5, 485, 100, 100);
        imageMode(CORNER);

        //The Text in the Boxes
        noStroke();
        fill(220);
        text("Resume",width/2,500);
        text("Controls",width/2,600);
        text("Leave",width/2,700);

        //The Text at the top of the pause screen
        text("Game Paused",width/2,150);
        text("Current Score: " + statistics.scorePoints,width/2,220);

       //Text in the box for the controls in the current screen
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);
        noFill();

        //Available Inputs
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == DOWN)
                {
                    //Goes to displayPauseMenu2
                    stage = 14;
                    keyPressed = false;
                }
            }
            if (key == 'p')
            {   
                //resumes the game
                stage = 7;
                keyPressed = false;
            }
        }
    }

    void displayPauseMenu2()
    {
        //Fading away effect as a Background in the Pause Screen.
        fill(0,100);
        rect(0,0,width*2,height*2);

        rectMode(CENTER);
        textAlign(CENTER);
        fill(50);
        stroke(180);
        strokeWeight(10);
        
        //Boxes for the Selecting options
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);

        //Boxes for displaying Current Score & Game Paused
        rect(width/2,135,300,50);
        rect(width/2,205,400,50);

       //Text in the box for the controls in the current screen
        rect(width/1.2,950,360,120);

        //Current HIGHLIGHTED Box
        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,585,300,50);

        //The Image of a Tower next to the HIGHLIGHTED Box
        imageMode(CENTER);
        image(tower, width/2.5, 585, 100, 100);
        imageMode(CORNER);

        //The Text in the Boxes
        noStroke();
        fill(220);
        text("Resume",width/2,500);
        text("Controls",width/2,600);
        text("Leave",width/2,700);

        //The Text at the top of the pause screen
        text("Game Paused",width/2,150);
        text("Current Score: " + statistics.scorePoints,width/2,220);

       //Text in the box for the controls in the current screen
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);
        noFill();
        
        //Available Inputs
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == DOWN)
                {
                    //Goes to displayPauseMenu3
                    stage = 15;
                    keyPressed = false;
                }
                if (keyCode == UP)
                {
                    //Goes to displayPauseMenu
                    stage = 9;
                    keyPressed = false;
                }
            }
            if (key == 'p')
            {
                //Displays Controls from the Pause menu screen
                stage = 16;
            }
        }
    }

    void displayPauseMenu3()
    {
        //Fading away effect as a Background in the Pause Screen.
        fill(0,100);
        rect(0,0,width*2,height*2);

        rectMode(CENTER);
        textAlign(CENTER);
        fill(50);
        stroke(180);
        strokeWeight(10);
        
        //Boxes for the Selecting options
        rect(width/2,485,300,50);
        rect(width/2,585,300,50);
        rect(width/2,685,300,50);

        //Boxes for displaying Current Score & Game Paused
        rect(width/2,135,300,50);
        rect(width/2,205,400,50);

       //Text in the box for the controls in the current screen
        rect(width/1.2,950,360,120);

        //Current HIGHLIGHTED Box
        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,685,300,50);

        //The Image of a Tower next to the HIGHLIGHTED Box
        imageMode(CENTER);
        image(tower, width/2.5, 685, 100, 100);
        imageMode(CORNER);

        //The Text in the Boxes
        noStroke();
        fill(220);
        text("Resume",width/2,500);
        text("Controls",width/2,600);
        text("Leave",width/2,700);

        //The Text at the top of the pause screen
        text("Game Paused",width/2,150);
        text("Current Score: " + statistics.scorePoints,width/2,220);

       //Text in the box for the controls in the current screen
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);
        noFill();
        
        //Available Inputs
        if (keyPressed)
        {
            if (key == CODED)
            {
                if (keyCode == UP)
                {
                    //Goes to displayPauseMenu2
                    stage = 14;
                    keyPressed = false;
                }
            }
            if (key == 'p')
            {
                //Goes all the way back to the Start Menu
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
        rect(width/2,485,300,50);
        rect(width/2,385,550,50);

        stroke(255,255,0);
        strokeWeight(5);
        rect(width/2,485,300,50);

        imageMode(CENTER);
        image(tower, width/2.5, 485, 100, 100);
        imageMode(CORNER);

        fill(220);
        textAlign(CENTER);
        text("Play Again!",width/2,500);
        text("Your Score:   " + statistics.scorePoints +"     " + scoreList.get(0).getSecond(), width/2,400);
        noFill();
        if (keyPressed)
                {   
                    //Goes back all the way to the Start Menu and puts the score in the Leaderboards Menu
                    if (key == 'p')
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
        //Fade away effect
        fill(200,10);
        rect(0,0,width*2,height*2);

        //Images
        imageMode(CENTER);
        image(controlsimage,width/2,height/3,1200,600);
        imageMode(CORNER);
        image(helpimage,100,height/1.7,1200,600);

        //Box for the controls in the current screen
        rectMode(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/1.2,950,360,120);

        //The text for the controls in the current screen
        noStroke();
        fill(220);
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        //Goes back to the Start Menu where the Controls Box is HIGHLIGHTED
                        stage = 2;
                        keyPressed = false;
                    }
                }
    }

    void controlsMenuPause()
    {
        //Fade away effect
        fill(200,20);
        rect(0,0,width*2,height*2);

        //Images
        imageMode(CENTER);
        image(controlsimage,width/2,height/3,1200,600);
        imageMode(CORNER);
        image(helpimage,100,height/1.7,1200,600);

        //Box for the controls in the current screen
        rectMode(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/1.2,950,360,120);

        //The text for the controls in the current screen
        noStroke();
        fill(220);
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);

        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        //Goes back to the Pause Screen Menu where Controls is HIGHLIGHTED
                        stage = 14;
                        keyPressed = false;
                    }
                }
    }

    void leaderBoardsMenu()
    {

    }
    void leaderBoardsMenu(ArrayList<Pair<Integer,String>> scoreList)
    {
        //Background Image
        image(altsmenu,0,0,width,height);
        rectMode(CENTER);
        fill(30);
        stroke(0);
        strokeWeight(10);
        rect(width/1.2,950,360,120);

        //Text for the controls in the current screen
        noStroke();
        fill(220);
        textAlign(CORNER);
        text("L Bump  =  Go Back",width/1.3,940);
        text("R Bump  =  Select",width/1.3,990);
        textAlign(CENTER);
        fill(50);

        //Lists the Scores and the Names that are linked to the Scores + created by the player
        //Lists every 100 pixels
        int len = min(10, scoreList.size());
        for (int i = 0; i < len; ++i) {
            fill(50);
            textAlign(CENTER);
            text((i + 1) + ": " + scoreList.get(i).getSecond() + "   " + scoreList.get(i).getFirst(), width/2, height/10 + i * 100);
            textAlign(CORNER);
        }


        if (keyPressed)
                {   
                    if (key == 'q')
                    {
                        //Goes back to Start Menu where Leaderboards is HIGHLIGHTED
                        stage = 3;
                        keyPressed = false;
                    }
                }
    } 


    void creditsMenu()
    {
        //Background Image
        image(altsmenu,0,0,width,height);

        //The Box for the controls in the current screen
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
        
        //Texts
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
                        //Goes back to the Start Menu Screen where Credits is HIGHLIGHTED
                        stage = 4;
                        keyPressed = false;
                    }
                }
    }
}

   

