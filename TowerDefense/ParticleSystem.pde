class ParticleSystem
{


    ParticleSystem()
    {
        
    }

    void enemyBleeding()
    {
        ArrayList<Enemy> e = new ArrayList();
        particles.add(new Particle(e.x, e.y, 0, 1));
    }

    
}