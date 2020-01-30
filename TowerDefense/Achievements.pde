class Achievements 
{
    int achievementID = 0;
    boolean achieved = false;
    int killsAchievements = 0;
    int goldEarnedAchievements = 0;
    int wavesReachedAchievements = 0;
    int achievementY, sizeX, sizeY;
    String achievementName;
    int timer;
    boolean timerSwitch = false;

    Achievements()
    {
        achievementY = -200;
        sizeX = 500;
        sizeY = 300;
        timer = 0;
    }


    void killsAchievements()
    {
        if(achievementID == 0)
        {
            if(wave.enemiesKilledTotal >= 50 && killsAchievements == 0)
            {
                achievementID = 1;
                achieved = true;
            }

            if(wave.enemiesKilledTotal >= 250 && killsAchievements == 1)
            {
                achievementID = 2;
                achieved = true;
            }

            if(wave.enemiesKilledTotal >= 500 && killsAchievements == 2)
            {
                achievementID = 3;
                achieved = true;
            }

            if(wave.enemiesKilledTotal >= 1000 && killsAchievements == 3)
            {
                achievementID = 4;
                achieved = true;
            }
        }
    }

    void goldEarnedAchievements()
    {
        if(achievementID == 0)
        {
            if(statistics.totalGoldEarned >= 500 && goldEarnedAchievements == 0)
            {
                achievementID = 5;
                achieved = true;
            }

            if(statistics.totalGoldEarned >= 2500 && goldEarnedAchievements == 1)
            {
                achievementID = 6;
                achieved = true;
            }

            if(statistics.totalGoldEarned >= 5000 && goldEarnedAchievements == 2)
            {
                achievementID = 7;
                achieved = true;
            }

            if(statistics.totalGoldEarned >= 10000 && goldEarnedAchievements == 3)
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
            if(wave.waveNumber >= 2 && wavesReachedAchievements == 0)
            {
                achievementID = 9;
                achieved = true;
            }

            if(wave.waveNumber >= 11 && wavesReachedAchievements == 1)
            {
                achievementID = 10;
                achieved = true;
            }

            if(wave.waveNumber >= 26 && wavesReachedAchievements == 2)
            {
                achievementID = 11;
                achieved = true;
            }

            if(wave.waveNumber >= 51 && wavesReachedAchievements == 3)
            {
                achievementID = 12;
                achieved = true;
            }
        }
    }

    void notifyPlayer()
    {
        fill(255);
        text("Achievement unlocked: " + achievementName,SIZE_X/2, achievementY);
        fill(0, 0, 0, 50);
        rect(SIZE_X/2, achievementY, sizeX, sizeY);
        if(databaseManager.getAchievement() && achieved && !timerSwitch)
        {
            timerSwitch = true;
        }

        if(timer >= 300)
        {
            timerSwitch = false;
        }

        if(timerSwitch)
        {
            timer++;
        }
        else 
        {
            timer = 0;
        }

        if(timer > 0)
        {
            achievementY += 15;
        }
        else 
        {
            achievementY = -200;
        }

        if(achievementY >= 150)
        {
            achievementY = 150;
        }
    }
}