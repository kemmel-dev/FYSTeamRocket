class Wave
{
  int waveNumber;
  int spawns;
  int limit;
  int enemiesLeft, enemiesRemoved, enemiesKilledTotal;

  boolean allEnemiesSpawned;

  //Timer that determimes how quick enemies spawn after each other
  float time;
  float timerLimit;

  Enemy enemy;

  boolean finished;

  boolean gameStarted = false;

  Wave()
  {
    time = millis() + 1000;
    waveNumber = 1;
    limit = 10;
    enemiesLeft = limit;
    timerLimit = 1500;
  }

  void spawn()
  { 
    //First wave starts when j is pressed (start button on controller)
    if(keyPressed && key == 'j')
    {
      gameStarted = true;
    }

    if (gameStarted)
    {
      //Limit of enemies per wave can't go higher than 100
      //So late game waves won't have more than 100 enemies
      if(limit >= 100)
      {
        limit = 100;
      }
    
      //When all enemies for the wave have spawned, this boolean becomes true
      if (spawns == limit)
      {
        allEnemiesSpawned = true;
      }

      //Enemies spawn 1,5 seconds after each other, every wave this will get 0,1 seconds faster
      if(millis() > time && spawns < limit)
      {
        statistics.gereset = false;
        enemies.add(new Enemy());
        spawns++;
        time = millis() + timerLimit;
      }
    }
    else {
      textAlign(CENTER);
      fill(50);
      text("Press START when you are ready", SIZE_X/2, SIZE_Y/2);
      textAlign(CORNER);
    }
  }

  void end()
  {
    //When all enemies are gone, this text will be displayed on screen.
    if(enemiesLeft == 0)
    {
      assetsLoader.laserSound.stop();
      assetsLoader.freezeSound.stop();
      assetsLoader.bombSound.stop();
      textAlign(CENTER);
      fill(50);
      text("Press START to start next wave", SIZE_X / 2, SIZE_Y / 5);
      textAlign(CORNER);
    }
    
    //When all enemies are gone, and one of these keys is pressed, the next wave will start
    if (enemiesLeft == 0 && keyPressed && key == 'j')
    {
      waveNumber++;
      allEnemiesSpawned = false;
      limit += 5;
      enemiesLeft = limit;
      spawns = 0;
      enemiesRemoved = 0;
      statistics.scorePoints += 100;
      statistics.amount += 10*waveNumber/2;
      
      //The spawntime between enemies cannot go lower than 0,6 seconds (600 millis).
        if(timerLimit > 600)
      {
        timerLimit -= 100;
      }
    }
  }
}