class Particles
{
    int x, y;
    //ParticleTypes:
    // 1 = bleeding effect
    // 2 = ?
    int particleType;
    int size = 8;
    int r = 255;
    int transparency = 255;
    float msX, msY;


    Particles(int _x, int _y, int _particleType)
    {
        x = _x;
        y = _y;
        particleType = _particleType;
        msX = random(-5, 5);
        msY = random(-5, 5);
    }

    void display()
    {
        text(particleType, 500, 500);
        if(particleType == 1)
        {
            bleedingEnemy();
        }
    }

    void bleedingEnemy()
    {
        fill(255, 0, 0, transparency);
        noStroke();
        circle(x, y, size);
        transparency -= 10;
    }

    void moveParticle()
    {
        x += msX;
        y += msY;
    }

    boolean resetParticle()
    {
        if(transparency < 0)
        {
            return true;
        }
        return false;
    }
}
