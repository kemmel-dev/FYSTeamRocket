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
            lives = 0;
        }
    }

    void waves()
    {

    }
}