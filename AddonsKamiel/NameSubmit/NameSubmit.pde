

private static int LETTERS_IN_ALPHABET = 26;
private static char[] alphabet = new char[LETTERS_IN_ALPHABET];

private static int NUM_LETTERBOXES = 3;
private LetterBox[] letterBoxes = new LetterBox[NUM_LETTERBOXES];

public Colors COLORS = new Colors();

void initAlphabet()
{
    int valueForCapitalA = 65;
    int charCodeDecimal = valueForCapitalA;
    for (int i = 0; i < LETTERS_IN_ALPHABET; i++)
    {
        alphabet[i] = char(charCodeDecimal + i);
    }
}

void initLetterBoxes()
{
    int xPos = width / 2 - width / 4;
    int dx = width / 4;
    int yPos = height / 2;
    int letterBoxWidth = height / 4;
    int letterBoxHeight = width / 6;
    for (int i = 0; i < letterBoxes.length; i++)
    {
        PVector positionOfBox = new PVector(xPos, yPos);
        letterBoxes[i] = new LetterBox(positionOfBox, letterBoxWidth, letterBoxHeight);
        xPos += dx;
    }
}

void drawLetterBoxes()
{
    for (LetterBox box : letterBoxes)
    {
        box.display();
    }
}

void setup()
{
    size(1920, 1080);
    initAlphabet();
    initLetterBoxes();
    rectMode(CENTER);
    textMode(CENTER);
}

void draw()
{
    background(color(#FF69B4));
    drawLetterBoxes();
}

void keyPressed()
{
    letterBoxes[0].nextChar();
}