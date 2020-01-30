class DatabaseProcess
{
boolean submitted = false;
boolean updated = false;

    DatabaseProcess()
    {

    }
    void hi()
    {
        if(msql.connect())
        {
            msql.query("SELECT AchievementName FROM Achievements WHERE AchievementID = 1;");
                

            String achievementName = msql.getString("AchievementName");
            println(achievementName);
        }
    }
    void achievementGet()
    {
        //Amount of killed enemies
        //Uitzoeken of de hasAchievementKilled specifieker kan dan de integer
        if(wave.enemiesKilledTotal >= 1 && databaseSetup.hasAchievementKilled == 0)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 1);");
        }
        else if(wave.enemiesKilledTotal >= 50 && databaseSetup.hasAchievementKilled == 1)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 2);");
        }
        else if(wave.enemiesKilledTotal >= 100 && databaseSetup.hasAchievementKilled == 2)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 3);");
        }
        else if(wave.enemiesKilledTotal >= 200 && databaseSetup.hasAchievementKilled == 3)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 4);");
        }
        else if(wave.enemiesKilledTotal >= 500 && databaseSetup.hasAchievementKilled == 4)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 5);");
        }
        else if(wave.enemiesKilledTotal >= 1000 && databaseSetup.hasAchievementKilled == 5)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 6);");
        }

        //Highest wave reached
        if(wave.waveNumber == 2)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 7)");
        }
        else if(wave.waveNumber == 11)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 8)");
        }
        else if(wave.waveNumber == 21)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 9)");
        }
        else if(wave.waveNumber == 31)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 10)");
        }
        else if(wave.waveNumber == 41)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 11)");
        }
        else if(wave.waveNumber == 51)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 12)");
        }
        else if(wave.waveNumber == 101)
        {
            msql.query("INSERT INTO UserToAchievement VALUES ("+ databaseSetup.userID +", 13)");
        }
    }

    void databaseStats()
    {
        if(submitted == false)
        {
        msql.connect();
        msql.query("INSERT INTO Attempt VALUES ("+ databaseManager.userID +", "+ wave.enemiesKilledTotal +", "+ controls.totalTowersPlaced +", "+ controls.totalTowersSold +", "+ statistics.totalGoldEarned +", "+ statistics.totalGoldSpent +", "+ wave.waveNumber +", 1, 1)");
        submitted = true;
        }
    }
    
    void updateStats()
    {
        if(updated == false)
        {
            msql.connect();
            msql.query("UPDATE Attempt SET EnemiesKilled = "+ wave.enemiesKilledTotal +" WHERE UserID = "+ databaseManager.userID +"");
            msql.query("UPDATE Attempt SET TowersBought = "+ controls.totalTowersPlaced +" WHERE UserID = "+ databaseManager.userID +"");
            msql.query("UPDATE Attempt SET TowersSold = "+ controls.totalTowersSold +" WHERE UserID = "+ databaseManager.userID +"");
            msql.query("UPDATE Attempt SET GoldEarned = "+ statistics.totalGoldEarned +" WHERE UserID = "+ databaseManager.userID +"");
            msql.query("UPDATE Attempt SET GoldSpent = "+ statistics.totalGoldSpent +" WHERE UserID = "+ databaseManager.userID +"");
            msql.query("UPDATE Attempt SET WaveReached = "+ wave.waveNumber +" WHERE UserID = "+ databaseManager.userID +"");
            updated = true;
        }
    }

// void makeAttempt()
// {
//     attempt = msql.getInt("SELECT MAX AttemptID FROM Attempt");
//     attempt++;
// }

//     void setHighscores()
//     {
//                     msql.query("INSERT INTO Attempt.Score VALUES ("+ statistics.scorePoints +")");

//     }

//     void getHighscores()
//     {
//             msql.getInt("SELECT TOP 1 * FROM Attempt.Score") ;
//     }





}