class Wave
{
  int waveNumber;
  int spawns;
  float spawnTimer;
  int limit;
  float enemiesLeft, enemiesRemoved;

  boolean allEnemiesSpawned;

  Enemy enemy;

  Wave()
  {
    waveNumber = 1;
    limit = 10;
    enemiesLeft = limit;
  }

  void spawn()
  {
    //Timer that determimes how quick enemies spawn after each other

    //if (spawning)
    //amount spawns bijhouden
    //checken of spawning door moet gaan


    //As long as the amount of spawns is less than the spawn limit for that wave, spawn a new enemy
    if (spawnTimer > 50 && spawns < limit)
    {
      statistics.gereset = false;
      enemies.add(new Enemy());
      spawnTimer = 0;;
      spawns++;
    } 
    
    //When all enemies for the wave have spawned, this boolean becomes true
    if (spawns == limit)
    {
      allEnemiesSpawned = true;
    }
    spawnTimer++;
  }

  void end()
  {
    //when all enemies have spawned, and all enemies are killed, the next wave will start
    if (enemiesLeft == 0)
    {
      waveNumber++;
      allEnemiesSpawned = false;
      limit += 5;
      enemiesLeft = limit;
      spawns = 0;
      enemiesRemoved = 0;
    }
  }
}
       // Boolean isEvenGetal(int getal)
    // {
    //   if (getal % 2 == 0)
    //   {
    //     return true;
    //   }
    //   return false;
    // }