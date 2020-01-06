class Box
{
    public PVector position;
    public int w, h;
    public Style style;

    public boolean selected = false;

    static final private color FILL_DEFAULT = 255;
    static final private color FILL_SELECTED = 200;
    static final private color STROKE_DEFAULT = 0;
    static final private color TEXTCOLOR_DEFAULT = 0;
    static final private int OPACITY_DEFAULT = 255;
    static final private int STROKEWEIGHT_DEFAULT = 5;
    static final private int TEXTSIZE_DEFAULT = 100;

    public Box(PVector position, int w, int h)
    {
        this.position = position;
        this.w = w;
        this.h = h;
        this.style = new Style(FILL_DEFAULT, FILL_SELECTED, STROKE_DEFAULT, OPACITY_DEFAULT, OPACITY_DEFAULT, STROKEWEIGHT_DEFAULT, TEXTCOLOR_DEFAULT, TEXTSIZE_DEFAULT);
    }

    public void display()
    {
        fill(style.getFill(selected), style.fillOpacity);
        stroke(style.strokeColor, style.strokeOpacity);
        strokeWeight(style.strokeWeight);
        rect(position.x, position.y, w, h);
    }

    public void setSelected(boolean selected)
    {
        this.selected = selected;
    }

}