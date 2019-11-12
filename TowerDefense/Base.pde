class Base
{
    int sizeX, sizeY, xPos, yPos;


    Style style;

    Base()
    {
       xPos = 1550;
       yPos = 350;
       sizeX = 50;
       sizeY = 200;


       style = new Style();
    }

    void buildBase()
    {
        rectMode(CORNER);
        fill(style.base);
        rect(xPos, yPos, sizeX, sizeY);
    }

    class Style
    {
        color base = color(100);
    }
}