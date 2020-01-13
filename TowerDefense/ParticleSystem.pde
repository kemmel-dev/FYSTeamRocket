class ParticleSystem
{
    int size = 10;
    float x, y;
    int timer;
    boolean timerSwitch = false;
    

    ArrayList<Particles> particles = new ArrayList<Particles>();
    ParticleSystem()
    {
        
    }

    void keyPressed()
    {
        if(key == 'p' && controls.upgrading)
        {
            timerSwitch = true;
        }
    }

    void checkTimer()
    {
        if (timerSwitch)
        {
            timer++;
        }
        else {
            timer = 0;
        }
        if(timer >= 60)
        {
            timerSwitch = false;
            controls.upgrading = false;
        }
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
                    
                    if(p.resetParticle())
                    {
                        particles.remove(i);
                    }
                }
            }
        }
    }

    void upgradeTower()
    {
        if(timer > 0)
        {
            if(timer <= 35)
            {
            particles.add(new Particles(controls.upgradeX, controls.upgradeY, 2));
            }
            for(int i = particles.size() - 1; i >= 0; i--)
            {
                Particles p = particles.get(i);
                p.display();
                    
                if(p.resetParticle())
                {
                    particles.remove(i);
                }
            }
        }
    }

    void enemyIsFreezing()
    {
        for(Enemy e : enemies)
        {
            if(e.frozenEnemy)
            {
                particles.add(new Particles(e.x, e.y, 3));
                for(int i = particles.size() - 1; i >= 0; i--)
                {
                    Particles p = particles.get(i);
                    p.display();
                    
                    if(p.resetParticle())
                    {
                        particles.remove(i);
                    }
                }
            }
        }
    }     
}