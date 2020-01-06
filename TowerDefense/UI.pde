class UI
{
    int textSize;
    float lineXY, lineX, lineY;

    int textX;
    int textCount = 4;
    float sizeX, sizeY;
    int currentY = 100;
    float percentageLine, wavePercentageBar;


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

        rect(sizeX*3, 0, sizeX, sizeY);
        imageMode(CORNER);
        image(lasertowerhud,sizeX*3+20,0);
        image(freezetowerhud,sizeX*3+137,0);
        image(bombtowerhud,sizeX*3+260,0);
        image(farmtowerhud,sizeX*3+380,0);

        image(goldcoin,sizeX*3+20,80);
        image(goldcoin,sizeX*3+137,80);
        image(goldcoin,sizeX*3+260,80);
        image(goldcoin,sizeX*3+380,80);
        
        
        if(wave.enemiesRemoved == 0)
        {
            wavePercentageBar = (waypoints.tileSize*3)/wave.enemiesLeft;
        }
        percentageLine = (waypoints.tileSize/2) + (wavePercentageBar*wave.enemiesRemoved);
        
        //Right top statistics
        rect(0, 0, sizeX, sizeY);
        line(lineXY, lineXY, lineX, lineY);
        stroke(style.green);
        line(lineXY, lineXY, percentageLine, lineY);

        strokeWeight(style.defaultStrokeWeight);
        stroke(style.black);
        rectMode(CENTER);
        fill(style.white);
        textSize(30);
        text("50",sizeX*3+50,105);
        text("100",sizeX*3+167,105);
        text("150",sizeX*3+290,105);
        text("150",sizeX*3+410,105);
        noFill();
    }

    void gold()
    {
        fill(style.white);
        textSize(textSize);
        textAlign(CORNER);
        text("      " + statistics.amount, waypoints.tileSize/2, 50);
        image(goldcoin,waypoints.tileSize/2, 25);
    }

    void lives()
    {
        fill(style.white);
        textSize(textSize);
        textAlign(CORNER);
        text("      " + statistics.lives, (waypoints.tileSize/2)*5, 50);
        image(lives,(waypoints.tileSize/2)*5-7, 18);
    }

    void waves()
    {
        fill(style.white);
        textAlign(CORNER);
        text("Wave:  " + wave.waveNumber, waypoints.tileSize/2, 100);
    }

    void score()
    {
        text("Score:  " + statistics.scorePoints, waypoints.tileSize/2 * 5, 100);
    }

    class Style
    {
        color white = color(255, 255, 255);
        color black = color(0, 0, 0);
        color green = color(0, 255, 0);
        int highOpacity = 200;
        int defaultStrokeWeight = 1;
        int thickStrokeWeight = 5;
    }
}