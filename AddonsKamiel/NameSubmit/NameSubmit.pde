
private DatabaseManager databaseManager;

private NameSubmitScreen nameSubmitScreen;

void setup()
{
    size(1920, 1080);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    databaseManager = new DatabaseManager(this);
    nameSubmitScreen = new NameSubmitScreen(databaseManager);
    nameSubmitScreen.init();
    if (!databaseManager.init())
    {
        print("Could not get a connection to the database :(\nQuitting game...");
        exit();
    }
}

void draw()
{
    nameSubmitScreen.draw();
}

void keyPressed()
{
    nameSubmitScreen.keyPressed();
}

