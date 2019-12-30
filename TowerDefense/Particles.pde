class Particles
{
    int particleCount = 50;
    int size = 5;
    float[] freezeParticleX = new float[particleCount];
    float[] freezeParticleY = new float[particleCount];
    float[] movementX = new float[particleCount];
    float[] movementY = new float[particleCount];

    Particles()
    {
        for (int i = 0; i < particleCount; i++)
        {
            movementX[i] = random(-3, 3);
            movementY[i] = random(-3, 3);
        }
    }

    // void freezeParticle()
    // {
    //     for (int p = 0; p < particleCount; p++)
    //     {
    //         println(freezeParticleX[p]);
    //         Iterator<Enemy> i = enemies.iterator();
    //         while (i.hasNext())
    //         {
    //             Enemy e = i.next();
    //             if (e.frozenEnemy)
    //             {
    //                 fill(180, 100, 233, 255);
    //                 freezeParticleX[p] += movementX[p];
    //                 freezeParticleY[p] += movementY[p];
    //                 circle(freezeParticleX[p], freezeParticleY[p], size);
    //             }
    //             else
    //             {
    //                 fill(255, 255, 255, 0);
    //                 freezeParticleX[p] = e.x;
    //                 freezeParticleY[p] = e.y;
    //             }
    //         }
    //     }
    // }
}