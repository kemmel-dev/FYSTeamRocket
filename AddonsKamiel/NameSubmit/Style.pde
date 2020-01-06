class Style
{
    public color fillColor, fillColorSelected, strokeColor, textColor;
    public int fillOpacity, strokeOpacity, strokeWeight, textSize;

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