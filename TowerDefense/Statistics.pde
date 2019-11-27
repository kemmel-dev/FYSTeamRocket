class Statistics
{
    int amount;
    
    int lives;

    Statistics()
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
}