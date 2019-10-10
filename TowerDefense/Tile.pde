class Tile
{
    int x;
    int y;
    int w;

    Style style;

    Tile(int _x, int _y, int _w)
    {
        x = _x;
        y = _y;
        w = _w;
        style = new Style();
    }

    void display()
    {
        fill(style.fillColor, style.opacity);
        rect(x, y, w, w);
    }

    class Style
    {
        color fillColor = color(255,255,255);
        int opacity = 125;
    }
}