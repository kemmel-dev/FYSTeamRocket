class Particles
{
    int x, y, particleType, greyToWhite;
    float size, angle;


    Style style = new Style();

    Particles(int _x, int _y, float _size, int _particleType)
    {
        x = _x;
        y = _y;
        size = _size;
        particleType = _particleType;
        greyToWhite = 70;
    }

    void display()
    {
        if(particleType == 1)
        {
            fill(style.upgradeTower);
            circle(x, y, size);
        }
    }

    class Style
    {
        color upgradeTower = color(greyToWhite, greyToWhite, greyToWhite);
    }
}