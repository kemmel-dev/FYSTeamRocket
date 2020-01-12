

class NameSubmitScreen
{
    private final static int NUM_CHARACTERBOXES = 7;
    private final static int NUM_LETTERBOXES = 3;

    private CharacterBox[] characterBoxes = new CharacterBox[NUM_CHARACTERBOXES];
    private SubmitBox submitBox;

    // Number of boxes is equal to the amount of character boxes plus a submit box
    private final static int NUM_BOXES = NUM_CHARACTERBOXES + 1;
    private Box[] boxes = new Box[NUM_BOXES];

    public Colors COLORS = new Colors();
    private int boxSelected = 0;
    private DatabaseManager databaseManager;

    public NameSubmitScreen(DatabaseManager databaseManager)
    {
        this.databaseManager = databaseManager;
    }

    // Initialize the boxes that allow player to choose it's name
    private void initLetterBoxes()
    {
        int xPos = width / 10;
        int dx = width / 8;
        int yPos = height / 3;
        int boxWidth = height / 6;
        int boxHeight = boxWidth;
        for (int i = 0; i < NUM_CHARACTERBOXES + 1; i++)
        {
            PVector positionOfBox = new PVector(xPos, yPos);
            if (i < NUM_LETTERBOXES)
            {
                characterBoxes[i] = new CharacterBox(positionOfBox, boxWidth, boxHeight, true);
                boxes[i] = characterBoxes[i];
                
            }
            else if ( i == NUM_LETTERBOXES)
            {
                xPos += width / 16;
                continue;
            }
            else if (i > NUM_LETTERBOXES) 
            {
                characterBoxes[i - 1] = new CharacterBox(positionOfBox, boxWidth, boxHeight, false);
                boxes[i - 1] = characterBoxes[i - 1];
            }
            xPos += dx;
        }
    }

    // Initializes the screen
    public void init()
    {
        initBoxes();
    }

    private void initBoxes()
    {
        initLetterBoxes();
        submitBox = new SubmitBox(new PVector(width / 2, height - height / 3), width / 4, height / 8, databaseManager);
        boxes[NUM_BOXES - 1] = submitBox;
    }

    // Call this to draw the namesubmitscreen object.
    public void draw()
    {
        boxes[boxSelected].setSelected(true);
        display();
        boxes[boxSelected].setSelected(false);
    }

    // Draws the namesubmitscreen's contents
    private void display()
    {
        background(color(#FF69B4));
        drawBoxes();
    }

    // Draws the boxes that allow a player to choose it's name.
    private void drawBoxes()
    {
        for (int index = 0; index < boxes.length; index++)
        {
            Box box = boxes[index];
            box.display();
        }
    }
    
    // Listens for and handles input
    public void keyPressed()
    {
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
            if (boxes[boxSelected] instanceof SubmitBox)
            {
                submitInformation();
            }
            else if (boxes[boxSelected] instanceof CharacterBox)
            {
                moveSelectionRight();
            }
        }
    }

    // Submits the inputted information.
    private void submitInformation()
    {
        SubmitBox box = (SubmitBox) boxes[boxSelected];

        // Generate a user ID from the inputted info
        StringBuilder buffer = new StringBuilder();
        int index = 0;
        for (CharacterBox characterBox : characterBoxes)
        {
            if (index == NUM_LETTERBOXES)
            {
                buffer.append("#");
            }
            buffer.append(characterBox.getChar());
            index += 1;
        }
        
        // Submit that info to the database manager
        box.submitUserID(buffer.toString());
    }

    private void moveSelectionLeft()
    {
        if (boxSelected != 0)
        {
            boxSelected -= 1;
        }
        else {
            boxSelected = NUM_BOXES - 1;
        }
    }

    private void moveSelectionRight()
    {
        if (boxSelected != NUM_BOXES - 1)
        {
            boxSelected += 1;
        }
        else {
            boxSelected = 0;
        }
    }
}

