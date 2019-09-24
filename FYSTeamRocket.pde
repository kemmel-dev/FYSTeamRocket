void setup()
{
    size(200, 200);
    background(0);
}

void draw() {
    background(mouseX, mouseY, mouseY - mouseX);
}