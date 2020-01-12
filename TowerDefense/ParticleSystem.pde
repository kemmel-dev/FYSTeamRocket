class ParticleSystem
{
    int size = 10;
    float x, y;
    

    ArrayList<Particles> particles = new ArrayList<Particles>();
    ParticleSystem()
    {
        
    }

    void enemyTakingDamage()
    {
        for(Enemy e : enemies)
        {
            if(e.takingDamage)
            {
                particles.add(new Particles(e.x, e.y, 1));
                for(int i = particles.size() - 1; i >= 0; i--)
                {
                    Particles p = particles.get(i);
                    p.display();
                    p.moveParticle();
                    
                    if(p.resetParticle())
                    {
                        text("Iam working", 900, 500);
                        particles.remove(i);
                    }
                }
            }
        }
    }

    // void enemyTakingDamage()
    // {
    //     for(Enemy e : enemies)
    //     {
    //         for(int i = 0; i < e.particleAmount; i++)
    //         {
                
    //             x = e.x;
    //             y = e.y;
    //             if(e.takingDamage)
    //             {
    //                 fill(255, 0, 0, e.transparency[i]);
    //                 noStroke();
    //                 circle(x + e.extraX[i], y + e.extraY[i], size);
    //             }
    //         }
    //     }
    // }

    // void resetParticle()
    // {
    //     for(Enemy e : enemies)
    //     {
    //         for(int i = 0; i < e.particleAmount; i++)
    //         {
    //             if(e.transparency[i] < 0)
    //             {
    //                 text(e.transparency[i], e.x, e.y);
    //                 e.extraY[i] = 0;
    //                 e.extraX[i] = 0;
    //                 e.transparency[i] = 255;
    //             }
    //         }
    //     }
    // }

    // void blood()
    // {
    //     for(Enemy e : enemies)
    //     {
    //         fill(255, 0, 0);
    //         noStroke();
    //         circle(x + e.x, y + e.y, size);
    //     }
    // }

    
}