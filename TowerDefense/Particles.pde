class Particles
{
    int x, y;
    //ParticleTypes:
    // 1 = bleeding effect
    // 2 = ?
    int particleType;
    int size = 5;
    int r = 255;


    Particles(int _x, int _y, int _particleType)
    {
        x = _x;
        y = _y;
        particleType = _particleType;
    }

    void display()
    {
        if(particleType == 1)
        {
            text("I work!", x, y);
            bleedingEnemy();
        }
    }

    void bleedingEnemy()
    {
        fill(r, 0, 0);
        circle(x, y, size);
        r -= 5;
    }
}
