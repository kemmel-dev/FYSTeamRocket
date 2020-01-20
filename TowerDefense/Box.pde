/**
 * Class used to draw box-like objects to use as
 * selection buttons. Each Box can be set to 'selected'
 * through the use of setSelected(boolean selected)
 *
 * @author Kamiel de Visser | 500838438
 */
class Box
{
    public PVector position;
    public int w, h;
    public Style style;

    public boolean selected = false;

    // Constants that define how a box looks
    static final private color FILL_DEFAULT = 255;
    static final private color FILL_SELECTED = 200;
    static final private color STROKE_DEFAULT = 0;
    static final private color TEXTCOLOR_DEFAULT = 0;
    static final private int OPACITY_DEFAULT = 255;
    static final private int STROKEWEIGHT_DEFAULT = 5;
    static final private int TEXTSIZE_DEFAULT = 100;

    /**
     * Constructor function for a Box object
     * @param position the position of this box stored in a PVector
     * @param w the width of this box
     * @param h the height of this box
     */
    public Box(PVector position, int w, int h)
    {
        this.position = position;
        this.w = w;
        this.h = h;
        this.style = new Style(FILL_DEFAULT, FILL_SELECTED, STROKE_DEFAULT, OPACITY_DEFAULT, OPACITY_DEFAULT, STROKEWEIGHT_DEFAULT, TEXTCOLOR_DEFAULT, TEXTSIZE_DEFAULT);
    }

    /**
     * Displays the object
     */
    public void display()
    {
        // Style the colors based on whether the box is selected
        fill(style.getFill(selected), style.fillOpacity);
        stroke(style.strokeColor, style.strokeOpacity);
        strokeWeight(style.strokeWeight);
        // then draw the box
        rect(position.x, position.y, w, h);
    }

    /**
     * Sets this objects' selected state to the state of the parameter
     * @param selected whether the box is selected
     */
    public void setSelected(boolean selected)
    {
        this.selected = selected;
    }

}