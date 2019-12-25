class Statistics
{
    int amount;
    float laserTowerCost, freezeTowerCost;
    
    int lives;

    int scorePoints;

    boolean gereset;

    Statistics()
    {
        amount = 400;
        laserTowerCost = 50;
        freezeTowerCost = 100;

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
    }
}