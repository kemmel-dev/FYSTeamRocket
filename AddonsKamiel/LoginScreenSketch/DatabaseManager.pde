import de.bezier.data.sql.*;
class DatabaseManager 
{ 
    // bezier MySQL wrapper object
    private MySQL database;
  
    // private constructor restricted to this class itself 
    public DatabaseManager(LoginScreenSketch sketchInstance) 
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

    public void registerName(String name)
    {
        database.query(String.format("INSERT INTO User(UserID, Username) VALUES(null, \"%s\")", name));
        //TODO iets anders dan een print statement
        print(database.getInt("SELECT * FROM User ORDER BY ID DESC LIMIT 1"));
    }

    public void submitUserID(String userID)
    {
        
    }
} 