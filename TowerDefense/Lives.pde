class Lives
{
    int lives;
    int xPos;
    int yPos;


    Style style = new Style();

    Lives()
    {
        lives = 5;
        xPos = 400;
        yPos = 50;
    }

    void setupLives()
    {
        fill(style.text);
        textSize(style.textSize);
        text("Lives  " + lives, xPos, yPos);
    }

    class Style
    {
        color text = color(255);
        int textSize = 30;
    }
}