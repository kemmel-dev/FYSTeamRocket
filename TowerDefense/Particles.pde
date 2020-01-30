class Particles
{
    int x, y;
    //ParticleTypes:
    // 1 = bleeding effect
    // 2 = smoke effect - Upgrade
    // 3 = freezing effect
    // 4 = smoke effect - Sell
    int particleType;
    int size;
    int r = 0, g = 0, b = 0;
    int transparency = 255;
    float msX, msY;
    float rotation, rotationSpeed;
    float defaultSpeed = 1;


    Particles(int _x, int _y, int _particleType)
    {
        x = _x;
        y = _y;
        particleType = _particleType;

        //Pre ajusting the movement accelerator and size
        //Some even the placement or rotation   
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
            x += random(-40, 40);
        }
        else if(particleType == 3)
        {
            msX = random(-2, 2);
            msY = random(-2, 2);
            size = 8;
            rotation = random(0, 2*PI);
            rotationSpeed = random(-5, 5);
        }
        else if(particleType == 4)
        {
            msX = random(-1, 1);
            msY = -3;
            size = 30;
            x += random(-40, 40);
            y += 50;
        }
    }

    //Display of all Particle + movement
    void display()
    {
        moveParticle();
        if(particleType == 1)
        {
            bleedingEnemy();
        }
        else if(particleType == 2)
        {
            upgradeTower();
        }
        else if(particleType == 3)
        {
            freezingEnemy();
        }
        else if(particleType == 4)
        {
            towerSold();
        }
    }


    //Enemy blood particle
    void bleedingEnemy()
    {
        fill(255 - r, 0, 0, transparency);
        noStroke();
        circle(x, y, size);
        transparency -= 10;
        r += 5;
        stroke(0, 0, 0);
    }

    //Tower upgrade smoke particle
    void upgradeTower()
    {
        fill(50 + r, 50 + r, 50 + r, transparency);
        noStroke();
        circle(x, y, size);
        transparency -= 10;
        r += 10;
        stroke(0, 0, 0);
    }

    //Enemy freeze particles
    void freezingEnemy()
    {
        rotation += rotationSpeed;
        fill(186 - r, 242 - r, 239 - r, transparency);
        noStroke();
        pushMatrix();
            translate(x, y);
            rotate(rotation);
            rect(0, 0, size, size);
        popMatrix();
        transparency -= 10;
        r += 5;
        stroke(0, 0, 0);
    }

    //Tower sold smoke particles
    void towerSold()
    {
        fill(255 - r, 140 - g, 0, transparency);
        noStroke();
        circle(x, y, size);
        transparency -= 10;
        g += 10;
        r += 18;
        stroke(0, 0, 0);
    }

    //Particle movement
    void moveParticle()
    {
        x += (MOVE_SPEED/4) * msX;
        y += (MOVE_SPEED/4) * msY;
    }

    //Checking if the particle transparency is less than 0
    boolean resetParticle()
    {
        if(transparency < 0)
        {
            return true;
        }
        return false;
    }
}
