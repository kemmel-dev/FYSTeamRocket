class UI
{
    int textSize;

    int textX;
    int textCount = 4;
    int sizeX, sizeY;
    int currentY = 100;

    float[] textY = new float[textCount];


    Style style = new Style();

    UI()
    {
        // for (int i = 0; i < textCount; i++)
        // {
        //     textY[i] = 400;
        // }
        // sizeX = 400;
        // sizeY = 80;
        // textX = SIZE_X/2;
    }


    void setupTextBoxes()
    {
        // for (int i = 0; i < textCount; i++)
        // {
        //     textY[i] += currentY;
        // }
    }

    void drawTextBoxes()
    {
        // for (int i = 0; i < textCount; i++)
        // {
        //     rect(textX, textY[i], sizeX, sizeY);

        // }
    }

    void gold()
    {
        // fill(style.white);
        // for (int i = 0; i < textCount; i++)
        // {
        //     text("Gold  " + statistics.amount, textX, textY[0]);
        // }
    }

    void lives()
    {

    }

    void waves()
    {

    }

    class Style
    {
        color white = color(255, 255, 255);
    }
}