class Particles
{
    int x, y, particleType, size;
    float angle;

    Particles(int _x, int _y, float _angle, int _particleType)
    {
        x = _x;
        y = _y;
        size = 10;
        particleType = _particleType;
        angle = _angle;
    }

    void enemyBlood()
    {
        if(enemies.takeDamage())
        {
            circle(x, y, size);
        }
    }
}