private NameSubmitScreen nameSubmitScreen = new NameSubmitScreen();

void setup()
{
    size(1920, 1080);
    nameSubmitScreen.init();
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
}

void draw()
{
    nameSubmitScreen.draw();
}

void keyPressed()
{
    nameSubmitScreen.keyPressed();
}

