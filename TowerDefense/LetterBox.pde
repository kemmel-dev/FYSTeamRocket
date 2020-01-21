/**
 * A LetterBox inherits from Box.
 * It is used to select a character from A-Z
 * @see Box
 * @author Kamiel de Visser | 500838438
 */
class LetterBox extends Box
{
    // ASCII character codes for 'A' and 'Z'
    private static final int CHARCODE_A = 65;
    private static final int CHARCODE_Z = 90;

    // ASCII character code for the currently selected character
    private int charCode = CHARCODE_A;

    // Coordinates for the up/down indicators
    private float indicatorX1, indicatorX2, indicatorX3;
    private float indicatorUpY1, indicatorUpY2, indicatorUpY3;
    private float indicatorDownY1, indicatorDownY2, indicatorDownY3;

    /**
    * Constructor function for a LetterBox object.
    * @param position the position of this letterbox as a PVector
    * @param w the width of this box
    * @param h the height of this box
    */
    public LetterBox(PVector position, int w, int h)
    {
        // Calls Box'es constructor function
        super(position, w, h);

        // Initializes the two indicator triangles
        indicatorX1 = position.x - w / 2;
        indicatorX2 = position.x + w / 2;
        indicatorX3 = position.x;
        indicatorUpY1 = position.y - (h / 2 + h / 8);
        indicatorUpY2 = indicatorUpY1;
        indicatorUpY3 = indicatorUpY1 - h / 5;
        indicatorDownY1 = position.y + (h / 2 + h / 8);
        indicatorDownY2 = indicatorDownY1;
        indicatorDownY3 = indicatorDownY1 + h / 5;
    }

    /**
    * Gets the character that is currently selected in this letterbox
    * @return the character that is currently selected in this letterbox
    */
    private char getChar()
    {
        return char(charCode);
    }

    /**
    * Increments the currently selected character from A to Z,
    * or overflows from Z to A
    */
    public void nextChar()
    {
        if (charCode != CHARCODE_Z)
        {
            charCode += 1;
        }
        else {
            charCode = CHARCODE_A;
        }
    }

    /**
    * Decrement the currently selected character from Z to A,
    * or overflows from A to Z
    */
    public void prevChar()
    {
        if (charCode != CHARCODE_A)
        {
            charCode -= 1;
        }
        else {
            charCode = CHARCODE_Z;
        }
    }

    /**
    * Shows the letterbox
    */
    public void display()
    {
        // Calls Box'es constructor function
        super.display();
        
        drawTriangles();
        fill(style.textColor);
        textSize(style.textSize);
        text(getChar(), position.x - 20, position.y + 40);
    }

    /**
    * Draws the indicator triangles on the top and bottom of the letterbox
    */
    private void drawTriangles()
    {
        triangle(indicatorX1, indicatorUpY1, indicatorX2, indicatorUpY2, indicatorX3, indicatorUpY3);
        triangle(indicatorX1, indicatorDownY1, indicatorX2, indicatorDownY2, indicatorX3, indicatorDownY3);
    }
}