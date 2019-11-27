class Statistics
{
    int amount;
    
    int lives;

    Statistics()
    {
        amount = 80;
        lives = 5;
    }

    void gold()
    {
        
    }

    void handleLives()
    {
        if(lives <= 0)
        {
            stage = 3;
            lives = 0;
        }
        println(stage);
    }

    void waves()
    {

    }
}