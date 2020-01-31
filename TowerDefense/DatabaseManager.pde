import de.bezier.data.sql.*;
class DatabaseManager 
{ 
    // bezier MySQL wrapper object
    private MySQL database;

    private boolean loggedIn = false;

    private String username;
    private String userID;
    int achievementIDDB;

    boolean statsSubmitted = false;
    boolean statsUpdated = false;
    boolean statsSelected = false;
    int totalKills;
    int totalTowersPlaced;
    int totalTowersSold;
    int totalGoldEarned;
    int totalGoldSpent;
    int waveReached;

    public boolean isLoggedIn()
    {
        return loggedIn;
    }
  
    // private constructor restricted to this class itself 
    public DatabaseManager(TowerDefense sketchInstance) 
    { 
        String serverAddress = "oege.ie.hva.nl:3306";
        String dbName = "zgoossej1";
        String username = "goossej1";
        String password = "3EUXYZ#9tdZ7Vb0k";
        database = new MySQL(sketchInstance, serverAddress, dbName, username, password); 
    }

    // connects the database
    // returns true if connection was established,
    // false otherwise
    public boolean init()
    {
        if (database.connect())
        {
            print(database.getTableNames());
            return true;
        }
        return false;
    }

    public boolean login(String[] userID)
    {
        // SQL code to login
        String name = userID[0];
        String id = userID[1];

        database.query(String.format("SELECT Username FROM User WHERE UserID = %s", id));
        if (database.next())
        {
            String linkedName = database.getString("Username");
            if (name.equals(linkedName))
            {
                // HIER WORDT DE USER GESET BIJ INLOGGEN
                loggedIn = true;
                this.username = name;
                this.userID = id;
                return true;
            }
        }
        return false;
    }

    public String registerName(String name)
    {
        database.query(String.format("INSERT INTO User(UserID, Username) VALUES(null, \"%s\");", name));
        database.query("SELECT * FROM User ORDER BY UserID DESC LIMIT 1");
        if (database.next())
        {
            int userID = database.getInt("UserID");
            return String.format("%04d", userID);
        }
        return "";
    }

    public void submitScore( int scorePoints)
    {
        println(scorePoints);
        println(username + userID);
    }

    public void achievementSend()
    {
        if(getAchievement() && achievements.achieved)
        {
            database.query("INSERT INTO User_has_Achievements(User_UserID, Achievements_AchievementID) VALUES ("+ userID +", "+ achievements.achievementID +");");
            achievements.achieved = false;
            if(achievements.achievementID < 5)
            {
                achievements.killsAchievements++;
            }
            else if(achievements.achievementID < 9 && achievements.achievementID > 4)
            {
                achievements.goldEarnedAchievements++;
            }
            else 
            {
                achievements.wavesReachedAchievements++;
            }
            achievements.achievementID = 0;
        }
    }

    public boolean getAchievement()
    {
        if(achievements.achieved && achievements.achievementID != 0)
        {
            database.query("SELECT * FROM Achievements WHERE AchievementID = "+ achievements.achievementID +";");
            if(database.next())
            {
              achievements.achievementName = database.getString("AchievementName");  
            }
            database.query("SELECT * FROM User_has_Achievements WHERE User_UserID = "+ userID +" AND Achievements_AchievementID = "+ achievements.achievementID +";");
            if(database.next())
            {
                achievementIDDB = database.getInt("Achievements_AchievementID"); 
            }
            if(achievementIDDB != achievements.achievementID)
            {
                return true;
            }
            else 
            {
                if(achievements.achievementID < 5)
                {
                    achievements.killsAchievements = 0 + achievements.achievementID;
                }
                else if(achievements.achievementID < 9 && achievements.achievementID > 4)
                {
                    achievements.goldEarnedAchievements = -4 + achievements.achievementID;
                }
                else if(achievements.achievementID > 8)
                {
                    achievements.wavesReachedAchievements = -8 + achievements.achievementID;
                }
            }
        }
        return false;
    }

    public void submitStats()
    {
        if(statsSubmitted == false)
        {
        database.query("INSERT INTO Statistics VALUES ("+ userID +","+ wave.enemiesKilledTotal +", "+ controls.totalTowersPlaced +", "+ controls.totalTowersSold +", "+ statistics.totalGoldEarned +", "+ statistics.totalGoldSpent +", "+ wave.waveNumber +")");
        statsSubmitted = true;
        }
    }

    public void updateStats()
    {
        if(statsUpdated == false)
        {
            database.query("UPDATE Statistics SET EnemiesKilled = "+ wave.enemiesKilledTotal +" WHERE UserID = "+ databaseManager.userID +"");
            database.query("UPDATE Statistics SET TowersBought = "+ controls.totalTowersPlaced +" WHERE UserID = "+ databaseManager.userID +"");
            database.query("UPDATE Statistics SET TowersSold = "+ controls.totalTowersSold +" WHERE UserID = "+ databaseManager.userID +"");
            database.query("UPDATE Statistics SET GoldEarned = "+ statistics.totalGoldEarned +" WHERE UserID = "+ databaseManager.userID +"");
            database.query("UPDATE Statistics SET GoldSpent = "+ statistics.totalGoldSpent +" WHERE UserID = "+ databaseManager.userID +"");
            database.query("UPDATE Statistics SET WaveReached = "+ wave.waveNumber +" WHERE UserID = "+ databaseManager.userID +"");
            statsUpdated = true;
        }
    }

    public void selectStats()
    {
            database.query("SELECT * FROM Statistics Where UserID = "+ userID +";");
            if(database.next())
            {
            totalKills = database.getInt("EnemiesKilled");
            totalTowersPlaced = database.getInt("TowersBought");
            totalTowersSold = database.getInt("TowersSold");
            totalGoldEarned = database.getInt("GoldEarned");
            totalGoldSpent = database.getInt("GoldSpent");
            waveReached = database.getInt("WaveReached");
            }
            
            textAlign(CENTER);
            fill(0);
            text("Your statistics are:", width/2, 150);
            text(totalKills + " Enemies killed", width/2, 300);
            text(totalTowersPlaced + " Towers placed", width/2, 400);
            text(totalTowersSold + " Towers sold", width/2, 500);
            text(totalGoldEarned + " Gold earned", width/2, 600);
            text(totalGoldSpent + " Gold spent", width/2, 700);
            text(waveReached + " Wave reached", width/2, 800);

            fill(220);
            textAlign(CORNER);
    }

    // public boolean submitStats(int enemiesKilledTotal, int totalTowersPlaced, int totalTowersSold, int totalGoldEarned, int totalGoldSpent, int waveNumber)
    // {
    // }
} 