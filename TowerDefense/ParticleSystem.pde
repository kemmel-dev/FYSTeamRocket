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
        if(key == 'p' && !timerSwitch)
        {
            timer++;
            timerSwitch = true;
        }
    }

    void checkTimer()
    {
        if(timer >= 180)
        {
            timerSwitch = false;
            fill(0, 0, 0, 255);
            text("timer checked", 900, 500);
        }
        if(timerSwitch = false)
        {
            timer = 0;
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
            particles.add(new Particles(controls.upgradeX, controls.upgradeY, 2));
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