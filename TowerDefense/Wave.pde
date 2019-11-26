class Wave
{
  int waveNumber;
  int spawns;
  int kills;
  float spawnTimer;
  int limit;

  boolean allEnemiesSpawned;
  boolean allEnemiesKilled;

  Enemy enemy;

  Wave()
  {
    waveNumber = 1;
    limit = 10;
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
      enemies.add(new Enemy());
      spawnTimer = 0;
      spawns++;
    } 
    
    //When all enemies for the wave have spawned, this boolean becomes true
    if (spawns == limit)
    {
      allEnemiesSpawned = true;
    }
    spawnTimer++;
  }

  void kills()
  {    
    //When an enemy is killed, the kill counter will increase by one
    for (Enemy e : enemies) 
    {
      if (e.hitpoints < 0 && kills < limit) 
      {
        kills++;
      }
      //When all enemies that spawned that wave are killed, this boolean will become true
      if (kills == limit)
      {
        allEnemiesKilled = true;
      }
    }
  }

  void end()
  {
    //when all enemies have spawned, and all enemies are killed the next wave will start
    if (allEnemiesSpawned && allEnemiesKilled)
    {
      waveNumber++;
      allEnemiesSpawned = false;
      allEnemiesKilled = false;
      limit += 5;
      spawns = 0;
      kills = 0;
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

}
