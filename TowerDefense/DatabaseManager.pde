import de.bezier.data.sql.*;
class DatabaseManager 
{ 
    // bezier MySQL wrapper object
    private MySQL database;

    private boolean loggedIn = false;

    private String username;
    private String userID;
    private int userIdentity;

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
            userIdentity = userID;
            return String.format("%04d", userID);
        }
        return "";
    }

    public void submitScore( int scorePoints)
    {
        println(scorePoints);
        println(username + userID);
    }

    public boolean getAchievement()
    {
        if(achievements.achieved && init())
        {
            database.query("SELECT * FROM User_has_Achievements WHERE User_UserID = "+ userIdentity +" AND Achievements_AchievementID"+ achievements.achievementID +";");
            int achievementIDDB = database.getInt("Achievements_AchievementID");
            println(achievementIDDB);
            if(achievementIDDB != achievements.achievementID)
            {
                database.query("INSERT INTO User_has_Achievements(User_UserID, Achievements_AchievementID) VALUES ("+ userIdentity +", "+ achievements.achievementID +");");
                achievements.achieved = false;
                achievements.achievementID = 0;
                
                text("Achievement get", 500, 500);
                return true;
            }
        }
        return false;
    }

    // public void submitStats()
    // {
    //     database.connect();
    //     msql.query("INSERT INTO Attempt VALUES ("+ userID +","+ wave.enemiesKilledTotal +", "+ controls.totalTowersPlaced +", "+ controls.totalTowersSold +", "+ statistics.totalGoldEarned +", "+ statistics.totalGoldSpent +", "+ wave.waveNumber +", 0, 0)");
    // }

    // public boolean submitStats(int enemiesKilledTotal, int totalTowersPlaced, int totalTowersSold, int totalGoldEarned, int totalGoldSpent, int waveNumber)
    // {
    // }
} 