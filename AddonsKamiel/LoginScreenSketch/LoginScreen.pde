class LoginScreen
{

    private final static int NUM_LETTERBOXES = 3;
    private final static int NUM_DIGITBOXES = 4;
    private final static int NUM_CHARACTERBOXES = NUM_LETTERBOXES + NUM_DIGITBOXES;
    
    // Amount of boxes is equal to the number of letterboxes + digitboxes + a login box + a new user box + a back box
    private final static int NUM_BOXES = NUM_CHARACTERBOXES + 3;
    private Box[] boxes = new Box[NUM_BOXES];
    private CharacterBox[] characterBoxes = new CharacterBox[NUM_CHARACTERBOXES];
    // The index of the box currently selected
    private int boxSelected = 0;

    private RegisterScreen registerScreen;
    private boolean showRegisterScreen;

    private LoginBox loginBox;
    private RegisterBox registerBox;
    private BackBox backBox;

    public LoginScreen()
    {
        initBoxes();
        showRegisterScreen = false;
        registerScreen = new RegisterScreen(this);
    }

    public String[] getUserID()
    {
        String[] result = new String[2];

        StringBuilder buffer = new StringBuilder();
        for (int i = 0; i < NUM_LETTERBOXES; i++)
        {
            buffer.append(characterBoxes[i].getChar());
        }
        result[0] = buffer.toString();

        buffer = new StringBuilder();
        for (int i = NUM_LETTERBOXES; i < NUM_CHARACTERBOXES; i++)
        {
            buffer.append(characterBoxes[i].getChar());
        }
        result[1] = buffer.toString();
        return result;
    }

    // Draws the login screen
    public void draw()
    {
        if (showRegisterScreen)
        {
            displayRegisterScreen();
            return;
        }
        displayLoginScreen();
        
        // TODO hier mooier laten zien dat je ingelogd bent
        if (databaseManager.isLoggedIn())
        {
            fill(color(255,0,0));
            text("LOGGED IN", width / 2, height / 2);
        }
    }

    // Shows the login screen objects
    public void displayLoginScreen()
    {
        for (Box box : boxes)
        {
            box.display();
        }
    }

    public void displayRegisterScreen()
    {
        registerScreen.display();
    }

    private void initBoxes()
    {
        int xPos = width / 16;
        int yPos = height / 4;
        int dX = width / 8;
        int boxWidth = height / 6;
        int boxHeight = boxWidth;
        for (int i = 0; i < NUM_CHARACTERBOXES + 1; i++)
        {
            if (i < NUM_LETTERBOXES)
            {
                CharacterBox newLetterBox = new CharacterBox(new PVector(xPos, yPos), boxWidth, boxHeight, true);
                boxes[i] = newLetterBox;
                characterBoxes[i] = newLetterBox;
            }
            else if (i == NUM_LETTERBOXES) {
                xPos += dX;
                continue;
            }
            else {
                CharacterBox newDigitBox = new CharacterBox(new PVector(xPos, yPos), boxWidth, boxHeight, false);
                boxes[i - 1] = newDigitBox;
                characterBoxes[i - 1] = newDigitBox;
            }
            xPos += dX;
        }
        // Now create login and back box
        xPos = width / 2;
        yPos = height / 2;
        boxHeight = height / 6;
        boxWidth = 2 * boxHeight;

        loginBox = new LoginBox(new PVector(xPos, yPos), boxWidth, boxHeight);
        boxes[NUM_BOXES - 3] = loginBox;

        yPos += height / 5;

        registerBox = new RegisterBox(new PVector(xPos, yPos), boxWidth, boxHeight);
        boxes[NUM_BOXES - 2] = registerBox;

        yPos += height / 5;

        backBox = new BackBox(new PVector(xPos, yPos), boxWidth, boxHeight);
        boxes[NUM_BOXES - 1] = backBox;

        boxes[boxSelected].setSelected(true);
    }

    // Listens for and handles input
    public void keyPressed()
    {
        if (showRegisterScreen)
        {
            registerScreen.keyPressed();
        }
        else {
            loginScreenKeyPressed();
        }
    }

    public void swapScreens()
    {
        showRegisterScreen = !showRegisterScreen;
    }

    // Handles the input on the login screen
    public void loginScreenKeyPressed()
    {
        Box box = boxes[boxSelected];
        //TODO fill in proper keycodes
        if (key == 'a')
        {
            moveSelectionLeft();
        }
        if (key == 'd')
        {
            moveSelectionRight();
        }
        if (key == 'w')
        {
            if (box instanceof CharacterBox)
            {
                CharacterBox charBox = (CharacterBox) box;
                charBox.nextChar();
            }
        }
        if (key == 's')
        {
            if (box instanceof CharacterBox)
            {
                CharacterBox charBox = (CharacterBox) box;
                charBox.prevChar();
            }
        }
        if (key == ' ')
        {
            if (box instanceof LoginBox)
            {
                databaseManager.login(getUserID()); 
            }
            else if (box instanceof RegisterBox)
            {
                swapScreens();
            }
            else if (box instanceof BackBox)
            {
                // TODO go back to main menu
                print("GO BACK TO MAIN MENU HERE\n");
            }
            else if (box instanceof CharacterBox)
            {
                moveSelectionRight();
            }
        }
    }
    
    // Moves the selection left
    private void moveSelectionLeft()
    {
        boxes[boxSelected].setSelected(false);
        if (boxSelected != 0)
        {
            boxSelected -= 1;
        }
        else {
            boxSelected = NUM_BOXES - 1;
        }
        boxes[boxSelected].setSelected(true);
    }

    // Moves the selection right
    private void moveSelectionRight()
    {
        boxes[boxSelected].setSelected(false);
        if (boxSelected != NUM_BOXES - 1)
        {
            boxSelected += 1;
        }
        else {
            boxSelected = 0;
        }
        boxes[boxSelected].setSelected(true);
    }    

}