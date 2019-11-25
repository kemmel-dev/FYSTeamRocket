class GameOverMenu
{
    int x, y, sizeX, sizeY, xPos, yPos1, yPos2;
    boolean gameOver;
    int buttonCount = 3;
    int statisticsY, statisticsX, statisticsSizeX, statisticsSizeY;
    int leaderboardsY, leaderboardsX, leaderboardsSizeX, leaderboardsSizeY;
    int exitY, exitX, exitSizeX, exitSizeY;
    int bold, defaultStrokeWeight, buttonGap, textExtraY;
    boolean[] buttonSelected = new boolean[buttonCount];



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
        gameOver = false;
        defaultStrokeWeight = 1;
        bold = 5;
        buttonGap = 100;
        
        statisticsSizeY = 80;
        statisticsX = SIZE_X/2;
        statisticsY = 675;
        statisticsSizeX = 400;

        leaderboardsSizeY = 80;
        leaderboardsX = SIZE_X/2;
        leaderboardsY = 550;
        leaderboardsSizeX = 400;

        exitSizeY = 80;
        exitX = SIZE_X/2;
        exitY = 800;
        exitSizeX = 250;

        textExtraY = 20;
    }

    void gameOverCheck()
    {
        if(lives.lives == 0)
        {
            gameOver = true;
            lives.lives = 0;
        }
    }

    void display()
    {
        rectMode(CORNER);
        fill(style.blackTransparent);
        rect(x, y, sizeX, sizeY);
        rectMode(CENTER);
        fill(style.red);
        textAlign(CENTER);
        textSize(style.textSize);
        text("Game over", xPos, yPos1);
        textSize(style.textSize2);
        text("You are too noob to play any further", xPos, yPos2);
    }

    void buttons()
    {
        fill(style.transparent);
        stroke(style.white);
        strokeWeight(bold);
        rect(statisticsX, statisticsY, statisticsSizeX, statisticsSizeY);
        rect(leaderboardsX, leaderboardsY, leaderboardsSizeX, leaderboardsSizeY);
        rect(exitX, exitY, exitSizeX, exitSizeY);
        strokeWeight(defaultStrokeWeight);
        stroke(style.black);
    }

    void buttonText()
    {
        fill(style.white);
        textSize(style.buttonTextSize);
        textAlign(CENTER);
        text("Statistics", statisticsX, statisticsY + textExtraY);
        text("Leaderboards", leaderboardsX, leaderboardsY + textExtraY);
        text("Exit", exitX, exitY + textExtraY);
        fill(style.black);
    }

    class Style
    {
        color black = color(0, 0, 0, 150);
        color blackTransparent = color(0, 0, 0, 200);
        color white = color(255);
        color transparent = color(255, 255, 255, 0);
        color red = color(255, 50, 50);
        int textSize = 100;
        int textSize2 = 70;
        int buttonTextSize = 50;
    }
}