class LetterBox
{

    private PVector position;
    private int w, h, charCode;
    private color letterColor;
    private Style style;

    private int CHARCODE_A = 65;
    private int CHARCODE_Z = 90;

    public LetterBox(PVector position, int w, int h)
    {
        this.position = position;
        this.w = w;
        this.h = h;
        this.letterColor = color(255, 0, 0);
        int fillOpacity = 255;
        int strokeOpacity = 255;
        int strokeWeight = 5;
        charCode = CHARCODE_A;
        int textSize = 60;
        style = new Style(COLORS.WHITE, COLORS.BLACK, fillOpacity, strokeOpacity, strokeWeight, textSize);
    }

    private char getChar()
    {
        return char(charCode);
    }

    private void nextChar()
    {
        if (charCode != CHARCODE_Z)
        {
            charCode += 1;
        }
        else {
            charCode = CHARCODE_A;
        }
    }

    private void prevChar()
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
        fill(style.fillColor, style.fillOpacity);
        stroke(style.strokeColor, style.strokeOpacity);
        strokeWeight(style.strokeWeight);
        rect(position.x, position.y, w, h);
        fill(letterColor);
        textSize(style.textSize);
        text(getChar(), position.x, position.y);
    }
}