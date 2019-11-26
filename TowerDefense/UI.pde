class UI
{
    int textSize;
    float lineXY, lineX, lineY;

    int textX;
    int textCount = 4;
    float sizeX, sizeY;
    int currentY = 100;

    float[] textY = new float[textCount];


    Style style = new Style();

    UI()
    {
        sizeX = waypoints.tileSize*4;
        sizeY = waypoints.tileSize;
        textX = SIZE_X/2;
        textSize = 30;
        lineXY = waypoints.tileSize/2;
        lineX = (waypoints.tileSize/2)*7;
        lineY = waypoints.tileSize/2;
    }

    void drawTextBox()
    {
        rectMode(CORNER);
        fill(style.black, style.highOpacity);
        stroke(style.white);
        strokeWeight(style.thickStrokeWeight);

        rect(0, 0, sizeX, sizeY);
        line(lineXY, lineXY, lineX, lineY);

        strokeWeight(style.defaultStrokeWeight);
        stroke(style.black);
        rectMode(CENTER);
    }

    void gold()
    {
        fill(style.white);
        textSize(textSize);
        textAlign(CORNER);
        text("Gold:  " + statistics.amount, waypoints.tileSize/2, 50);
    }

    void lives()
    {
        fill(style.white);
        textSize(textSize);
        textAlign(CORNER);
        text("Lives:  " + statistics.lives, (waypoints.tileSize/2)*5, 50);
    }

    void waves()
    {
        fill(style.white);
        textAlign(CORNER);
        text("Wave: " + wave.waveNumber, waypoints.tileSize/2, 100);
    }

    class Style
    {
        color white = color(255, 255, 255);
        color black = color(0, 0, 0);
        int highOpacity = 200;
        int defaultStrokeWeight = 1;
        int thickStrokeWeight = 5;
    }
}