class LetterBox extends Box
{
    private static final int CHARCODE_A = 65;
    private static final int CHARCODE_Z = 90;

    private static final color ARROW_DEFAULT = 0;
    private static final color ARROW_SELECTED = #FF0000;

    private int charCode = CHARCODE_A;

    private float indicatorX1, indicatorX2, indicatorX3;
    private float indicatorUpY1, indicatorUpY2, indicatorUpY3;
    private float indicatorDownY1, indicatorDownY2, indicatorDownY3;

    public LetterBox(PVector position, int w, int h)
    {
        super(position, w, h);
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

    private char getChar()
    {
        return char(charCode);
    }

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

    public void display()
    {
        super.display();
        drawTriangles();
        fill(style.textColor);
        textSize(style.textSize);
        text(getChar(), position.x, position.y - h / 16);
    }

    private void drawTriangles()
    {
        triangle(indicatorX1, indicatorUpY1, indicatorX2, indicatorUpY2, indicatorX3, indicatorUpY3);
        triangle(indicatorX1, indicatorDownY1, indicatorX2, indicatorDownY2, indicatorX3, indicatorDownY3);
    }
}