class DatabaseProcess
{
    boolean submitted = false;
    boolean updated = false;

    DatabaseProcess()
    {

    }

    // void databaseStats()
    // {
    //     if(submitted == false)
    //     {
    //     //msql.connect();
    //     //msql.query("INSERT INTO Statistics VALUES ("+ databaseManager.userID +", "+ wave.enemiesKilledTotal +", "+ controls.totalTowersPlaced +", "+ controls.totalTowersSold +", "+ statistics.totalGoldEarned +", "+ statistics.totalGoldSpent +", "+ wave.waveNumber +")");
    //     msql.query("INSERT INTO Statistics VALUES 1, 2, 3, 4, 5, 6, 7");
    //     submitted = true;
    //     }
    // }
    
    // void updateStats()
    // {
    //     if(updated == false)
    //     {
    //         msql.connect();
    //         msql.query("UPDATE Statistics SET EnemiesKilled = "+ wave.enemiesKilledTotal +" WHERE UserID = "+ databaseManager.userID +"");
    //         msql.query("UPDATE Statistics SET TowersBought = "+ controls.totalTowersPlaced +" WHERE UserID = "+ databaseManager.userID +"");
    //         msql.query("UPDATE Statistics SET TowersSold = "+ controls.totalTowersSold +" WHERE UserID = "+ databaseManager.userID +"");
    //         msql.query("UPDATE Statistics SET GoldEarned = "+ statistics.totalGoldEarned +" WHERE UserID = "+ databaseManager.userID +"");
    //         msql.query("UPDATE Statistics SET GoldSpent = "+ statistics.totalGoldSpent +" WHERE UserID = "+ databaseManager.userID +"");
    //         msql.query("UPDATE Statistics SET WaveReached = "+ wave.waveNumber +" WHERE UserID = "+ databaseManager.userID +"");
    //         updated = true;
    //     }
    // }

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