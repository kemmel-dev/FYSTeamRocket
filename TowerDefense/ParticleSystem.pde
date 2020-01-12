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
            text("timer ree", 500, 500);
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
        if(timerSwitch)
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