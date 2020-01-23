class Statistics
{

    int amount;
    int totalGoldEarned;
    int totalGoldSpent;
    int laserTowerCost, freezeTowerCost, bombTowerCost, farmTowerCost;
    
    int lives;

    int scorePoints;

    boolean gereset;
   
   public int getScorePoints()
   {
       return scorePoints;
   }

    Statistics()
    {
        amount = 70;
        laserTowerCost = 50;
        freezeTowerCost = 100;
        bombTowerCost = 150;
        farmTowerCost = 200;

        lives = 5;

    }

    void reset()
    { 
            lives = 1;
            amount = 70;
            wave.waveNumber = 1;
            wave.limit = 10;
            wave.spawns = 0;
            wave.enemiesRemoved = 0;
            wave.timerLimit = 1500;
            scorePoints = 0;
            gereset = true;
            wave.enemiesLeft = wave.limit;

            //database statistics reset:
            wave.enemiesKilledTotal = 0;
            controls.totalTowersPlaced = 0;
            controls.totalTowersSold = 0;
            totalGoldEarned = 0;
            totalGoldSpent = 0;

            // Every tower will be reset on all tiles of the grid
            for (int x = 0; x < 16; x++)
            {
                for (int y = 0; y < 9; y++)
                {
                    Tile currentTile = grid.grid[x][y];
                    currentTile.tower = new Tower(x, y, 0, 0, 1);
                }
            }
    }

    void handleLives()
    {
        if(lives <= 0)
        {
            stage = 17;
            lives = 0;
        }
    }
}