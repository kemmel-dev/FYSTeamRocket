class Tile
{
    int x;
    int y;
    int w;

    Style style;
    Tower tower;

    Boolean selected = false;

    Tile(int _x, int _y, int _w)
    {
        x = _x;
        y = _y;
        w = _w;
        style = new Style();
        tower = new Tower(0, 0, 0, 0);
    }

    void display()
    {
        if (selected)
        {
            fill(tower.style.rangeFill, 0);
            ellipse(x, y, tower.rangeD, tower.rangeD);
            fill(style.selectedColor, style.selectedOpacity);
            if (keyPressed)
            {
                
            }
        }
        else 
        {
            fill(style.fillColor, style.opacity);
        }
        rect(x, y, w, w);
    }

    class Style
    {
        color fillColor = 255;
        color selectedColor = color(255,0,0);
        int opacity = 20;
        int selectedOpacity = 125;
    }
}