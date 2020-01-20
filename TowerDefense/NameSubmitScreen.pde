

/**
 * A screen that has a few boxes to select and submit a new name.
 * This object can be handled as it's own sketch.
 * @author Kamiel de Visser | 500838438
 */
class NameSubmitScreen
{
    private final static int NUM_LETTERBOXES = 3;
    private LetterBox[] letterBoxes = new LetterBox[NUM_LETTERBOXES];
    private SubmitBox submitBox;

    private final static int NUM_BOXES = 4;
    private Box[] boxes = new Box[NUM_BOXES];

    public Colors COLORS = new Colors();

    private int boxSelected = 0;
    
    /**
     * Initialize the boxes that allow player to choose it's name
     */
    private void initLetterBoxes()
    {
        int xPos = width / 2 - width / 4;
        int dx = width / 4;
        int yPos = height / 3;
        int letterBoxWidth = height / 4;
        int letterBoxHeight = width / 6;
        for (int i = 0; i < letterBoxes.length; i++)
        {
            PVector positionOfBox = new PVector(xPos, yPos);
            letterBoxes[i] = new LetterBox(positionOfBox, letterBoxWidth, letterBoxHeight);
            xPos += dx;
        }
    }

    /**
     * Initializes this screen
     */
    public void init()
    {
        initBoxes();
    }

    /**
     * Initializes all boxes used on this screen
     */
    private void initBoxes()
    {
        initLetterBoxes();
        submitBox = new SubmitBox(new PVector(width / 2, height - height / 3), width / 4, height / 8);
        boxes[0] = letterBoxes[0];
        boxes[1] = letterBoxes[1];
        boxes[2] = letterBoxes[2];
        boxes[3] = submitBox;
    }

    /**
     * Call this function in the draw function of another sketch
     * to handle and show this screen.
     */
    public void draw()
    {
        boxes[boxSelected].setSelected(true);
        display();
        boxes[boxSelected].setSelected(false);
    }

    /**
     * Shows this screen.
     */
    private void display()
    {
        image(gameoverscreen,0,0);
        drawBoxes();
    }

    /**
     * Draws the boxes on this screen.
     */
    private void drawBoxes()
    {
        for (int index = 0; index < boxes.length; index++)
        {
            Box box = boxes[index];
            box.display();
        }
    }

    /**
     * Handles the keyPressed events for this screen.
     */
    public void keyPressed()
    {
        if (key == CODED) {
            if (keyCode == LEFT)
            {
                moveSelectionLeft();
                keyPressed = false;
            }
            if (keyCode == RIGHT)
            {
                moveSelectionRight();
                keyPressed = false;
            }
            if (keyCode == UP)
            {
                // if selected box is a letterbox, move character selection up
                if (boxes[boxSelected] instanceof LetterBox)
                {
                    LetterBox box = (LetterBox) boxes[boxSelected];
                    box.nextChar();
                    keyPressed = false;
                }
            }
            if (keyCode == DOWN)
            {
                // if selected box is a letterbox, move character selection down
                if (boxes[boxSelected] instanceof LetterBox)
                {
                    LetterBox box = (LetterBox) boxes[boxSelected];
                    box.prevChar();
                    keyPressed = false;
                }
            }
        }
        
        if (key == 'j')
        {
            // if selected box is a submitbox, submit the name selected
            if (boxes[boxSelected] instanceof SubmitBox)
            {
                SubmitBox box = (SubmitBox) boxes[boxSelected];
                box.submitName(getNameFromLetterBoxes());
                stage = 17;
                keyPressed = false;
            }
            // else if selectedbox is a letterbox, move the selection right
            else if (boxes[boxSelected] instanceof LetterBox)
            {
                moveSelectionRight();
                keyPressed = false;
            }
        }
    }

    /**
     * Gets the name from the letterboxes on this screen.
     * @return the name from the letterboxes on this screen.
     */
    private String getNameFromLetterBoxes()
    {
        StringBuilder buffer = new StringBuilder();
        for (LetterBox letterBox : letterBoxes)
        {
            buffer.append(letterBox.getChar());
        }
        return buffer.toString();
    }

    /**
     * Moves the selection left or overflows to the right
     */
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

    /**
     * Moves the selection right or overflows to the left
     */
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

