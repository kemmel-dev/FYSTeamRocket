
// private LoginScreen loginScreen;

// private DatabaseManager databaseManager;

// void setup()
// {
//     size(1920, 1080);

//     // NameSubmitScreen is drawn with the following settings in mind
//     rectMode(CENTER);
//     textAlign(CENTER, CENTER);

//     databaseManager = new DatabaseManager(this);
//     if (!databaseManager.init())
//     {
//         print("Can't establish a connection to the database :(\nQuitting game...\n");
//         exit();
//     }
//     loginScreen = new LoginScreen();
// }

// void draw()
// {
//     background(0);
//     loginScreen.draw();
// }

// void keyPressed()
// {
//     loginScreen.keyPressed();
// }