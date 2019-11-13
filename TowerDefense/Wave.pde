class Wave
{
  int nWave = 1;
  int kills;
  int timer;
  int spawns;
  int multiplier;

  Enemy enemy;

  boolean waveSpawned;

  int score;

  Wave()
  {
    timer = 1;
    spawns = 1;
    multiplier = 10;
    waveSpawned = false;
  }

  void display()
  {
    text("Wave: " + nWave, 125, 100);
    text("Kills: " + kills + " / " + nWave * 10, 125, 150);
    text("Score: " + score, 125, 200);
    timer++;

    //spawns enemies until the max amount of enemies for that wave is reached
    if (timer > 50 && waveSpawned == false)
    {
      spawns++;
      enemies.add(new Enemy());
      timer = 1;
    }

    //If enough enemies have spawned for a wave, the boolean waveSpawned will become true so that no more enemies will spawn
    if(spawns == nWave * multiplier)
    {
      waveSpawned = true;
    }

    //if all enemies for the wave have spawned, and if all of them are dead the next wave will start
    //when the wave ends the player will gain 200 score
    if(kills == nWave * multiplier && waveSpawned == true)
    {
      score += 200;
      nWave++;
      kills = 0;
      spawns = 0;
      text("Wave completed", width/2, height/2);
      waveSpawned = false;
    }

    //every time an enemy is killed, kills will be increased by 1, also the score will increase by 50
    for (Enemy e : enemies) 
    {
      if (e.hitpoints < 0) 
      {
        kills++;
        score += 50;
      }
    }
  }
}
