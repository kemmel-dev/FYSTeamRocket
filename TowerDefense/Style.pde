/**
 * Holds styling options for drawable objects
 * @author Kamiel de Visser | 500838438
 */
class Style
{
    public color fillColor, fillColorSelected, strokeColor, textColor;
    public int fillOpacity, strokeOpacity, strokeWeight, textSize;

    /**
     * Constructor function for a Style object.
     * @param fillColor the fill color for this object
     * @param fillColorSelected the fill color for this object when it's selected
     * @param strokeColor the color of the stroke of this object
     * @param fillOpacity the opacity for this object
     * @param strokeOpacity the opacity for the stroke of this object
     * @param strokeWeight the weight of the stroke of this object
     * @param textColor the color of the text of this object
     * @param textSize the size of the text of this object
     */
    public Style(color fillColor, color fillColorSelected, color strokeColor, int fillOpacity, int strokeOpacity, int strokeWeight, color textColor, int textSize)
    {
        this.fillColor = fillColor;
        this.strokeColor = strokeColor;
        this.fillOpacity = fillOpacity;
        this.strokeOpacity = strokeOpacity;
        this.strokeWeight = strokeWeight;
        this.textColor = textColor;
        this.textSize = textSize;
        this.fillColorSelected = fillColorSelected;
    }

    /**
     * Gets the color this object is currently filled with, based on
     * whether the object is selected.
     * @param whether the object is selected
     * @color the color this object is currently filled with
     */
    public color getFill(boolean selected)
    {
        if (selected)
        {
            return fillColorSelected;
        }
        else 
        {
            return fillColor;
        }
    }
}