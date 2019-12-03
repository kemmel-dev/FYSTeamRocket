class Statistics
{
    int amount;
    
    int lives;

    int scorePoints;

    boolean gereset;

    Statistics()
    {
        amount = 20000;
        lives = 5;
    }

    void reset()
    { 
            lives = 5;
            amount = 80;
            wave.waveNumber = 1;
            wave.limit = 10;
            wave.spawns = 0;
            wave.enemiesRemoved = 0;
            scorePoints = 0;
            gereset = true;
            wave.enemiesLeft = wave.limit;
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