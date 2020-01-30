class Achievements 
{
    int achievementID = 0;
    boolean achieved = false;

    Achievements()
    {

    }


    // boolean achievementUpdate()
    // {
    //     return false;
    // }


    void killsAchievements()
    {
        println("hello");
        textSize(50);
        fill(255, 0, 0);
        text("TEST TEST TEST", SIZE_X/2, 150);
        if(achievementID == 0)
        {
            if(wave.enemiesKilledTotal >= 50 && wave.enemiesKilledTotal < 250)
            {
                achievementID = 1;
                achieved = true;
            }

            if(wave.enemiesKilledTotal >= 250 && wave.enemiesKilledTotal < 500)
            {
                achievementID = 2;
                achieved = true;
            }

            if(wave.enemiesKilledTotal >= 500 && wave.enemiesKilledTotal < 1000)
            {
                achievementID = 3;
                achieved = true;
            }

            if(wave.enemiesKilledTotal >= 1000)
            {
                achievementID = 4;
                achieved = true;
            }
        }
    }

    void goldEarnedAchievements()
    {
        println("world");
        if(achievementID == 0)
        {
            if(statistics.totalGoldEarned >= 500 && statistics.totalGoldEarned < 2500)
            {
                achievementID = 5;
                achieved = true;
            }

            if(statistics.totalGoldEarned >= 2500 && statistics.totalGoldEarned < 5000)
            {
                achievementID = 6;
                achieved = true;
            }

            if(statistics.totalGoldEarned >= 5000 && statistics.totalGoldEarned < 10000)
            {
                achievementID = 7;
                achieved = true;
            }

            if(statistics.totalGoldEarned >= 10000)
            {
                achievementID = 8;
                achieved = true;
            }
        }
    }

    void wavesReachedAchievements()
    {
        if(achievementID == 0)
        {
            if(wave.waveNumber >= 2 && wave.waveNumber < 11)
            {
                achievementID = 9;
                achieved = true;
            }

            if(wave.waveNumber >= 11 && wave.waveNumber < 26)
            {
                achievementID = 10;
                achieved = true;
            }

            if(wave.waveNumber >= 26 && wave.waveNumber < 51)
            {
                achievementID = 11;
                achieved = true;
            }

            if(wave.waveNumber >= 51)
            {
                achievementID = 12;
                achieved = true;
            }
        }
    }
}