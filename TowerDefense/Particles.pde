class Particles
{
    int x, y;
    //ParticleTypes:
    // 1 = bleeding effect
    // 2 = ?
    int particleType;
    int size;
    int r = 0, g, b;
    int transparency = 255;
    float msX, msY;


    Particles(int _x, int _y, int _particleType)
    {
        x = _x;
        y = _y;
        particleType = _particleType;
        if(particleType == 1)
        {
            msX = random(-4, 4);
            msY = random(-4, 4);
            size = 8;
        }
        else if(particleType == 2)
        {
            msX = random(-1, 1);
            msY = -3;
            size = 30;
            Tile currentTile = grid.grid[controls.selectionX][controls.selectionY];
            x += random(-40, 40);
        }
        else if(particleType == 3)
        {
            msX = random(-2, 2);
            msY = random(-2, 2);
            size = 8;
        }
    }

    void display()
    {
        if(particleType == 1)
        {
            bleedingEnemy();
            moveParticle();
        }
        else if(particleType == 2)
        {
            upgradeTower();
            moveParticle();
        }
        else if(particleType == 3)
        {
            freezingEnemy();
            moveParticle();
        }
    }

    void bleedingEnemy()
    {
        fill(255 - r, 0, 0, transparency);
        noStroke();
        circle(x, y, size);
        transparency -= 10;
        r += 5;
        stroke(0, 0, 0);
    }

    void upgradeTower()
    {
        fill(50 + r, 50 + r, 50 + r, transparency);
        noStroke();
        circle(x, y, size);
        transparency -= 10;
        r += 10;
        stroke(0, 0, 0);
    }

    void freezingEnemy()
    {
        fill(186 - r, 242 - r, 239 - r, transparency);
        noStroke();
        circle(x, y, size);
        transparency -= 10;
        r += 5;
        stroke(0, 0, 0);
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
