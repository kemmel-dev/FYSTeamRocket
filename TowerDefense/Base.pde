class Base
{
    float x, y;
    float dX, dY;


    Style style = new Style();


    Base()
    {
        x = SIZE_X ;
        y = waypoints.wayPoint6;
        dX = waypoints.tileSize*2;
        dY = waypoints.tileSize*4;
    }

    void baseStructure()
    {
        imageMode(CENTER);
        image(tower,x, y, 175, 175);
        imageMode(CORNER);
        strokeWeight(1);
        stroke(style.black);
    }

    class Style
    {
        int hidden = 255;
        int highOpacity = 180;
        color white = color(255, 255, 255);
        color black = color(0, 0, 0);
    }
}