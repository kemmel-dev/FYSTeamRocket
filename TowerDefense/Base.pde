class Base
{
    float x, y;
    int dX, dY;


    Style style = new Style();


    Base()
    {
        x = SIZE_X;
        y = waypoints.wayPoint6;
        dX = 100;
        dY = 200;
    }

    void baseStructure()
    {
        fill(style.black, style.highOpacity);
        stroke(style.white);
        strokeWeight(10);
        ellipse(x, y, dX, dY);
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