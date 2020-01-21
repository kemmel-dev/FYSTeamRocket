class LetterBox
{

    private PVector position;
    private int w, h;

    private final static color boxFill = 255;
    private final static color boxStroke = 0;
    private final static int boxStrokeWeight = 10;


    public LetterBox(PVector position, int w, int h)
    {
        this.position = position;
        this.w = w;
        this.h = h;
    }

    public void display()
    {
        fill(boxFill);
        strokeWeight(boxStrokeWeight)
        stroke(boxStroke);
        rect(position.x, position.y, w, h);
    }
}