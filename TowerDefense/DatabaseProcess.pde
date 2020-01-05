class DatabaseProcess
{


    DatabaseProcess()
    {

    }
    void hi()
    {
        msql.query("SELECT AchievementID FROM Achievements WHERE AchievementID = 1;");
        

        String achievementName = msql.getString("AchievementName");
        println(achievementName);
    }

    // void achievementGet()
    // {
    //     //Amount of killed enemies
    //     //Uitzoeken of de hasAchievementKilled specifieker kan dan de integer
    //     if(wave.enemiesKilledTotal >= 1 && hasAchievementKilled == 0)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 1);");
    //     }
    //     else if(wave.enemiesKilledTotal >= 50 && hasAchievementKilled == 1)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 2);");
    //     }
    //     else if(wave.enemiesKilledTotal >= 100 && hasAchievementKilled == 2)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 3);");
    //     }
    //     else if(wave.enemiesKilledTotal >= 200 && hasAchievementKilled == 3)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 4);");
    //     }
    //     else if(wave.enemiesKilledTotal >= 500 && hasAchievementKilled == 4)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 5);");
    //     }
    //     else if(wave.enemiesKilledTotal >= 1000 && hasAchievementKilled == 5)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 6);");
    //     }

    //     //Highest wave reached
    //     if(wave.waveNumber == 2)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 7)");
    //     }
    //     else if(wave.waveNumber == 11)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 8)");
    //     }
    //     else if(wave.waveNumber == 21)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 9)");
    //     }
    //     else if(wave.waveNumber == 31)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 10)");
    //     }
    //     else if(wave.waveNumber == 41)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 11)");
    //     }
    //     else if(wave.waveNumber == 51)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 12)");
    //     }
    //     else if(wave.waveNumber == 101)
    //     {
    //         msql.query("INSERT INTO UserToAchievement VALUES ("+ userID +", 13)");
    //     }
    // }
}