class Statistics
{

    int amount;
    int laserTowerCost, freezeTowerCost, bombTowerCost, farmTowerCost;
    
    int lives;

    int scorePoints;

    boolean gereset;

   
   

    Statistics()
    {
        amount = 8000;
        laserTowerCost = 50;
        freezeTowerCost = 100;
        bombTowerCost = 150;
        farmTowerCost = 250;

        lives = 5;

    }


    

    

    void reset()
    { 
            lives = 5;
            amount = 800;
            wave.waveNumber = 1;
            wave.limit = 10;
            wave.spawns = 0;
            wave.enemiesRemoved = 0;
            scorePoints = 0;
            gereset = true;
            wave.enemiesLeft = wave.limit;

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
            stage = 8;
            lives = 0;
        }
    }
}