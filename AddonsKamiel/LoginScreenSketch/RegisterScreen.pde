class RegisterScreen
{
    private final static int NUM_LETTERBOXES = 3;
    // Amount of boxes is equal to the number of letter boxes + a register box
    // + a back box
    private final static int NUM_BOXES = NUM_LETTERBOXES + 2;

    private Box[] boxes = new Box[NUM_BOXES];
    private CharacterBox[] characterBoxes = new CharacterBox[NUM_LETTERBOXES];
    
    private RegisterBox registerBox;
    private BackBox backBox;

    private int boxSelected = 0;

    private LoginScreen loginScreen;

    private boolean registeredName = false;
    private String userID;

    public String getName()
    {
        StringBuilder buffer = new StringBuilder();
        for (CharacterBox characterBox : characterBoxes)
        {
            buffer.append(characterBox.getChar());
        }
        return buffer.toString();
    }
    
    public RegisterScreen(LoginScreen loginScreen)
    {
        initBoxes();
        this.loginScreen = loginScreen;
    }

    public void display()
    {
        for (Box box : boxes)
        {
            box.display();
        }
        if (registeredName)
        {
            // TODO hier mooier laten zien dat je bent ingelogd
            fill(color(255,0,0));
            text(String.format("Registered with userID:\n%s#%s", getName(), userID), width / 2, height / 2);
        }
    }

    private void initBoxes()
    {
        int xPos = width / 2 - width / 8;
        int yPos = height / 4;
        int dX = width / 8;
        int boxWidth = height / 6;
        int boxHeight = boxWidth;
        for (int i = 0; i < NUM_LETTERBOXES; i++)
        {
            CharacterBox newLetterBox = new CharacterBox(new PVector(xPos, yPos), boxWidth, boxHeight, true);
            boxes[i] = newLetterBox;
            characterBoxes[i] = newLetterBox;
            xPos += dX;
        }
        // Now create register and back box
        xPos = width / 2;
        yPos = height / 2;
        boxHeight = height / 6;
        boxWidth = 2 * boxHeight;

        registerBox = new RegisterBox(new PVector(xPos, yPos), boxWidth, boxHeight);
        boxes[(NUM_BOXES - 1) - 1] = registerBox;

        yPos += height / 4;

        backBox = new BackBox(new PVector(xPos, yPos), boxWidth, boxHeight);
        boxes[NUM_BOXES - 1] = backBox;

        boxes[boxSelected].setSelected(true);
    }

    // Handles the input on the register screen
    public void keyPressed()
    {
        //TODO goede keycodes invullen

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
            if (boxes[boxSelected] instanceof CharacterBox)
            {
                CharacterBox box = (CharacterBox) boxes[boxSelected];
                box.nextChar();
            }
        }
        if (key == 's')
        {
            if (boxes[boxSelected] instanceof CharacterBox)
            {
                CharacterBox box = (CharacterBox) boxes[boxSelected];
                box.prevChar();
            }
        }
        if (key == ' ')
        {
            if (boxes[boxSelected] instanceof RegisterBox)
            {
                userID = databaseManager.registerName(getName());
                if (userID != "")
                {
                    registeredName = true;
                }
            }
            else if (boxes[boxSelected] instanceof BackBox)
            {
                loginScreen.swapScreens();
            }
            else if (boxes[boxSelected] instanceof CharacterBox)
            {
                moveSelectionRight();
            }
        }
    }
        
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