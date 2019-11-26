class Statistics
{
    int amount;
    
    int lives;

    int wave;

    boolean gameOver;

    Statistics()
    {
        amount = 80;
        lives = 5;
        wave = 0;
        gameOver = false;
    }

    void gold()
    {
        
    }

    void handleLives()
    {
        if(lives <= 0)
        {
            lives = 0;
            gameOver = true;
        }
    }

    void waves()
    {

    }
}