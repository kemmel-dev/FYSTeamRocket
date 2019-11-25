class Wave
{
  int nWave = 1;
  int kills;
  int timer;
  int spawns;
  int multiplier;
  int enemiesLeft;

  Enemy enemy;

  boolean allEnemiesSpawned;
  boolean allEnemiesKilled;
  boolean waveEnded;

  int score;

  Wave()
  {
    timer = 1;
    spawns = 1;
    multiplier = 10;
    allEnemiesSpawned = false;
  }

  void display()
  {
    text("Wave: " + nWave, 125, 100);
    text("Enemies left: " + enemiesLeft, 125, 150);
    text("Score: " + score, 125, 200);
if(waveEnded == false)
{

    enemiesLeft = nWave*10 - kills;
    timer++;

    //spawns enemies until the max amount of enemies for that wave is reached
    if (timer > 50 && allEnemiesSpawned == false)
    {
      spawns++;
      enemies.add(new Enemy());
      timer = 1;
    }

    //If enough enemies have spawned for a wave, the boolean allEnemiesSpawned will become true so that no more enemies will spawn
    if(spawns == nWave * multiplier)
    {
     allEnemiesSpawned = true;
    }

    if(kills == nWave * multiplier)
    {
      allEnemiesKilled = true;
    }

    //if all enemies for the wave have spawned, and if all of them are dead the next wave will start
    //when the wave ends the player will gain 200 score
    if(allEnemiesSpawned && allEnemiesKilled)
    {
      score += 100;
      waveEnded = true;
    }

    //every time an enemy is killed, kills will be increased by 1, also the score will increase by 50
    for (Enemy e : enemies) 
    {
      if (e.hitpoints < 0) 
      {
        kills++;
        score += 5;
      }
    }

}

    //Ready next wave button
    if(waveEnded && allEnemiesSpawned && allEnemiesKilled)
    {
      text("Press 'R' to start next wave", width/2, height/2);
    }

    //If the 'r' key is pressed after a wave ended, the next one will start
    if(waveEnded && allEnemiesKilled && allEnemiesSpawned && keyPressed && key == 'r')
    {
      allEnemiesSpawned = false;
      allEnemiesKilled = false;
      waveEnded = false;
      kills = 0;
      spawns = 0;
      nWave++;
    }
  }

}