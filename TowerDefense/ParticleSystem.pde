class ParticleSystem
{

    ArrayList<Particles> particle = new ArrayList<Particles>();
    ParticleSystem()
    {
        
    }

    void upgradingTower()
    {
        Tile currentTile = grid.grid[controls.selectionX][controls.selectionY];
        if(controls.towerUpgrade)
        {
            int x = currentTile.x;
            int y = currentTile.y;
            float size = random(5, 10);

            //currentTile = new Particle(x, y, size, 1);
            println(x);
            println(y);
            println(size);
        }
    }

    
}