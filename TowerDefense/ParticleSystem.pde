class ParticleSystem
{
    int size = 10;
    float x, y;
    int upgradeTimer, sellingTimer;
    boolean upgradeTimerSwitch = false;
    boolean sellingTimerSwitch = false;
    

    ArrayList<Particles> particles = new ArrayList<Particles>();
    ParticleSystem()
    {
        
    }

    void keyPressed()
    {
        //Check if key is pressed and upgrading
        if(key == 'p' && controls.upgrading)
        {
            upgradeTimerSwitch = true;
        }

        //Check if key is pressed and selling
        if(key == 'q' && controls.selling)
        {
            sellingTimerSwitch = true;
        }
    }

    void checkTimer()
    {
        //Upgrade timer
        //If the timer switch is turned on, trigger the timer to tick
        if (upgradeTimerSwitch)
        {
            upgradeTimer++;
        }
        //If the timer switch is turned off, turn the timer off
        else 
        {
            upgradeTimer = 0;
        }
        //If the timer switch is at 60 frames, turn the timer off
        if(upgradeTimer >= 60)
        {
            upgradeTimerSwitch = false;
            controls.upgrading = false;
        }

        //Selling timer
        //If the timer switch is turned on, trigger the timer to tick
        if (sellingTimerSwitch)
        {
            sellingTimer++;
        }
        //If the timer switch is turned off, turn the timer off
        else 
        {
            sellingTimer = 0;
        }
        //If the timer switch is at 60 frames, turn the timer off
        if(sellingTimer >= 60)
        {
            sellingTimerSwitch = false;
            controls.upgrading = false;
        }
    }


    void enemyTakingDamage()
    {
        for(Enemy e : enemies)
        {
            //If the enemy is taking damage, add and then display a particle
            if(e.takingDamage)
            {
                particles.add(new Particles(e.x, e.y, 1));
                
                //Checking if "i" is less than 0 and then for looping everything beneath it
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
        if(upgradeTimer > 0 && controls.upgrading)
        {
            //If you are upgrading a tower, add and then display a particle
            if(upgradeTimer <= 35)
            {
                particles.add(new Particles(controls.upgradeX, controls.upgradeY, 2));
            }
            
            //Checking if "i" is less than 0 and then for looping everything beneath it
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
            //If the enemy is freezing, add and then display a particle
            if(e.frozenEnemy)
            {
                particles.add(new Particles(e.x, e.y, 3));
                
                //Checking if "i" is less than 0 and then for looping everything beneath it
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


    void sellingTower()   
    {
        if(sellingTimer > 0)
        {
            if(sellingTimer <= 35)
            {
                //If you are selling a tower, add and then display a particle
                particles.add(new Particles(controls.sellingX, controls.sellingY, 4));
                }

                //Checking if "i" is less than 0 and then for looping everything beneath it
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