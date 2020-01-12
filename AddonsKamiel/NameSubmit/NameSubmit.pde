
// This object manages the database connection
private DatabaseManager databaseManager;


private NameSubmitScreen nameSubmitScreen;

void setup()
{
    size(1920, 1080);


    // NameSubmitScreen is drawn with the following settings in mind
    rectMode(CENTER);
    textAlign(CENTER, CENTER);

    databaseManager = new DatabaseManager(this);

    // Makes a reference to the namesubmitscreen object
    nameSubmitScreen = new NameSubmitScreen(databaseManager);
    // Initializes the nameusbmitscreen object
    nameSubmitScreen.init();

    if (!databaseManager.init())
    {
        print("Could not get a connection to the database :(\nQuitting game...");
        exit();
    }
}

void draw()
{
    // Call this in draw() when you want to display the namesubmitscreen
    nameSubmitScreen.draw();
}

void keyPressed()
{
    // Call this in keyPressed() to make namesubmitscreen listen for and handle inputs.
    nameSubmitScreen.keyPressed();
}

