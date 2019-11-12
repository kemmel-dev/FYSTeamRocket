class Lives
{
    int lives;
    int xPos;
    int yPos;
    boolean gameOver;


    Style style = new Style();

    Lives()
    {
        lives = 5;
        xPos = 400;
        yPos = 50;
        gameOver = false;
    }

    void setupLives()
    {
        fill(style.text);
        textSize(style.textSizeLives);
        text("Lives  " + lives, xPos, yPos);
    }

    //if enemy passed base, you lose 1 life
    void loseLive()
    {
        Iterator<Enemy> i = enemies.iterator();
        while (i.hasNext())
        {
            Enemy e = i.next();
            if (e.x > 1600 && gameOver == false)
            {
                i.remove();
                lives--;
            }
        }
    }

    void gameOverCheck()
    {
        if(lives == 0)
        {
            gameOver = true;
            textAlign(CENTER);
            fill(style.textRed);
            textSize(style.textSizeGO);
            text("Game over you noob", width/2, height/2);
            textAlign(CORNER);
        }
    }

    class Style
    {
        color text = color(255);
        color textRed = color(255, 50, 50);
        int textSizeLives = 30;
        int textSizeGO = 100;
    }
}