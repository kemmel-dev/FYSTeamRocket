void setup()
{
    size(1600, 900);
    background(0);
}

void draw() {
    background(mouseX, mouseY, mouseY - mouseX);
}