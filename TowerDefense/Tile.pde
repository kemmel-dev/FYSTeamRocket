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
            fill(style.selectedColor, style.selectedOpacity);
            if(tower.towerType == 1)
            {
                fill(style.hidden);
                ellipse(tower.x, tower.y, tower.rangeD, tower.rangeD);
                fill(style.selectedColor, style.selectedOpacity);
            }
            if(tower.towerType == 2)
            {
                fill(style.hidden);
                ellipse(tower.x, tower.y, tower.rangeD, tower.rangeD);
                fill(style.selectedColor, style.selectedOpacity);
            }
            if(tower.towerType == 3)
            {
                fill(style.hidden);
                ellipse(tower.x, tower.y, tower.rangeBombTower, tower.rangeBombTower);
                fill(style.selectedColor, style.selectedOpacity);
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
        color hidden = color(255, 255, 255, 0);
        color white = color(255, 255, 255);
        color black = color(0, 0, 0);
        int opacity = 20;
        int selectedOpacity = 125;
    }
}