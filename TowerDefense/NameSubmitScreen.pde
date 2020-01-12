

class NameSubmitScreen
{
    private final static int NUM_LETTERBOXES = 3;
    private LetterBox[] letterBoxes = new LetterBox[NUM_LETTERBOXES];
    private SubmitBox submitBox;

    public final int LETTERS_IN_ALPHABET = 26;
    public char[] alphabet = new char[LETTERS_IN_ALPHABET];

    private final static int NUM_BOXES = 4;
    private Box[] boxes = new Box[NUM_BOXES];

    public Colors COLORS = new Colors();

    private int boxSelected = 0;

    // Load the alphabet in an array
    private void initAlphabet()
    {
        int valueForCapitalA = 65;
        int charCodeDecimal = valueForCapitalA;
        for (int i = 0; i < LETTERS_IN_ALPHABET; i++)
        {
            alphabet[i] = char(charCodeDecimal + i);
        }
    }

    // Initialize the boxes that allow player to choose it's name
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

    // Initializes the screen
    public void init()
    {
        initAlphabet();
        initBoxes();
    }

    private void initBoxes()
    {
        initLetterBoxes();
        submitBox = new SubmitBox(new PVector(width / 2, height - height / 3), width / 4, height / 8);
        boxes[0] = letterBoxes[0];
        boxes[1] = letterBoxes[1];
        boxes[2] = letterBoxes[2];
        boxes[3] = submitBox;
    }

    public void draw()
    {
        boxes[boxSelected].setSelected(true);
        display();
        boxes[boxSelected].setSelected(false);
    }

    // Draws the sketch
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
                if (boxes[boxSelected] instanceof LetterBox)
                {
                    LetterBox box = (LetterBox) boxes[boxSelected];
                    box.nextChar();
                    keyPressed = false;
                }
            }
            if (keyCode == DOWN)
            {
                if (boxes[boxSelected] instanceof LetterBox)
                {
                    LetterBox box = (LetterBox) boxes[boxSelected];
                    box.prevChar();
                    keyPressed = false;
                }
            }
        }
        
        if (key == ' ')
        {
            if (boxes[boxSelected] instanceof SubmitBox)
            {
                SubmitBox box = (SubmitBox) boxes[boxSelected];

                StringBuilder buffer = new StringBuilder();
                for (LetterBox letterBox : letterBoxes)
                {
                    buffer.append(letterBox.getChar());
                }
                box.submitName(buffer.toString());
                stage = 14;
                keyPressed = false;
            }
            else if (boxes[boxSelected] instanceof LetterBox)
            {
                moveSelectionRight();
                keyPressed = false;
            }
        }
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

