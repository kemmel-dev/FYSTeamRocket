class Statistics
{
    int amount;
    
    int lives;

    boolean gameOver;

    Statistics()
    {
        amount = 80;
        lives = 5;
        gameOver = false;
    }

    void gold()
    {
        
    }

    void handleLives()
    {
        if(lives <= 0)
        {
            gameOver = true;
            if (gameOver)
            {
                if (keypressed)
                {
                    if (key == ' ')
                    stage = 1;
                }
            }
        }
    }

    void waves()
    {

    }
}