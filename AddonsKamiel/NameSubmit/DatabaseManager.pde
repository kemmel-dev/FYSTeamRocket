import de.bezier.data.sql.*;
class DatabaseManager 
{ 
    // bezier MySQL wrapper object
    private MySQL database;
  
    // private constructor restricted to this class itself 
    public DatabaseManager(NameSubmit sketchInstance) 
    { 
        String serverAddress = "oege.ie.hva.nl:3306";
        String dbName = "zvisserk18";
        String username = "visserk18";
        String password = "drkmjQlAfHnDhx";
        database = new MySQL(sketchInstance, serverAddress, dbName, username, password); 
    } 

    // connects the database
    // returns true if connection was established,
    // false otherwise
    public boolean init()
    {
        if (database.connect())
        {
            return true;
        }
        return false;
    }

    public void submitUserID(String userID)
    {
        database.query(String.format("INSERT INTO Player(idPlayer, name) VALUES(0, \"%s\")", userID));
    }
} 