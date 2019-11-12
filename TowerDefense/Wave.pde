class Wave
{
  int nWave = 1;
  int kills;
  int timer;

  Enemy enemy;

  Wave()
  {
    timer = 1;
  }

  void display()
  {
    text(nWave, 200, 150);
    text(kills, 500, 500);
    timer++;

    if (timer > 50)
    {
      enemies.add(new Enemy());
      timer = 1;
    }


    for (Enemy e : enemies) 
    {
      if (e.hitpoints < 0) 
      {
        kills++;
      }
    }

    if (kills == nWave * 10)
    {
      nWave++;
      kills = 0;
    }
  }
}
