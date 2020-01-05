class ConnectDB
{

    String dbHostID = "oege.ie.hva.nl:3306";
    String dbUsername = "goossej1";
    String dbUserPass = "3EUXYZ#9tdZ7Vb0k";
    String dbSchema = "zgoossej1";

    void createDatabaseConnection()
    {
        msql = new MySQL(TowerDefense.this, dbHostID, dbSchema, dbUsername, dbUserPass);
    }
}   