class DatabaseSetup
{
    String userName;
    int userID;
    int hasAchievementKilled;


    DatabaseSetup()
    {

    }

    void getUserInformation()
    {
        msql.query("SELECT MAX(UserID) FROM User WHERE Username = "+ userName +" ;");
        msql.query("SELECT UserID, AchievementID FROM UserToAchievement WHERE UserID = "+ userID +";");
        
        userID = msql.getInt("UserID");
        hasAchievementKilled = msql.getInt("AchievementID") - 1;
    }
}