/**
 * Describes the enemies in the game.
 * @author Kamiel de Visser | 500838438
 */
class Enemy
{
    int x;
    int y;
    int w;
    float hitpoints, hitpointsPercentage;
    float hitpointsBeginWave;
    int moveDir = 3;
    float msMultiplier = 1;
    boolean frozenEnemy = false;
    int hitpointsGap;
    int frozen = 0;
    boolean takingDamage = false;

    Style style;

    //This int determines what enemy type is going to spawn
    //type 1 = regular enemy
    //type 2 = enemy with more hp, but is also slower
    //type 3 = enemy with less hp, but is faster
    int enemyType = 1;

    // This array stores whether an enemy has passed each checkpoint.
    Boolean[] waypointsPassed = new Boolean[6];

    /**
    * Constructor function for an Enemy
    */
    Enemy()
    {
        //Every 4th enemy is a type 2 (slow with more hp)
        if(wave.spawns % 3 == 0 && wave.spawns != 0)
        {
            enemyType = 2;
        }
        
        //Every 6th enemy is a type 3 (fast with less hp)
        if(wave.spawns % 5 == 0 && wave.spawns != 0)
        {
            enemyType = 3;
        }

        //If it is not a 4th enemy or a 6th enemy it will be a type 1 (regular enemy)
        if(wave.spawns % 3 != 0 && wave.spawns % 5 != 0)
        {
            enemyType = 1;
        }

        Tile t = grid.grid[0][5];
        style = new Style();
        x = - t.w;
        y = t.y;
        initWaypoints();

        //REGULAR
        //Regular enemy size, speed and hp
        if(enemyType == 1)
        {
            w = int(t.w / 2);
            hitpoints = 15 + (wave.waveNumber * 20);
            hitpointsGap = 40;
            if(!wave.allEnemiesSpawned)
            {
                hitpointsBeginWave = hitpoints;
            }
        }

        //SLOW / STRONG
        //Type 2 enemy size, speed and hp
        if(enemyType == 2)
        {
            msMultiplier = 0.75;
            w = int(t.w - 40);
            hitpoints = 70 + (wave.waveNumber * 30);
            hitpointsGap = 50;
            if(!wave.allEnemiesSpawned)
            {
                hitpointsBeginWave = hitpoints;
            }
        }

        //FAST / WEAK
        //Type 3 enemy size, speed and hp
        if(enemyType == 3)
        {
            msMultiplier = 1.6;
            w = int(t.w / 3);
            hitpoints = 10 + (wave.waveNumber * 10);
            hitpointsGap = 30;
            if(!wave.allEnemiesSpawned)
            {
                hitpointsBeginWave = hitpoints;
            }
        }
    }

    /**
    * Lets the enemy take damage to their hitpoints
    * @param damage the damage taken
    * @return whether this enemy has died as a result of taking damage
    * @author Kamiel de Visser | 500838438
    */
    Boolean takeDamage(float damage)
    {
        hitpoints -= damage;
        if (hitpoints < 0)
        {
            return true;
        }
        return false;
    }

    /**
    * Initialises the wayPointspassed by setting
    * them all to false
    * @author Kamiel de Visser | 500838438
    */
    void initWaypoints()
    {
        for (int i = 0; i < waypointsPassed.length; i++)
        {
            waypointsPassed[i] = false;
        }
    }

    /**
    * Displays the enemy at it's position
    * @author Kamiel de Visser | 500838438
    */
    void display()
    {
        //If the enemy is FROZEN, it will turn a bit blue
        if(frozenEnemy)
        {
            tint(style.frozenColor);
        }
        else
        {
            tint(style.defaultColor);
        }

        imageMode(CENTER);

        //If the DIRECTION of MOVEMENT changes, the enemy will turn
        if(moveDir == 3)
        {   
            if (enemyType == 1)
            {
                image(enemypic1, x, y, w, w);
            }
            else if (enemyType == 2)
            {
                image(redenemypic1, x, y, w, w);
            }
            else if (enemyType == 3)
            {
                image(bluenemypic1, x, y, w, w);
            }
        }
        else if(moveDir == 1)
        {
            if (enemyType == 1)
            {
                image(enemypic3, x, y, w, w);
            }
            else if (enemyType == 2)
            {
                image(redenemypic3, x, y, w, w);
            }
            else if (enemyType == 3)
            {
                image(bluenemypic3, x, y, w, w);
            }
        }
        else if(moveDir == 2)
        {
            if (enemyType == 1)
            {
                image(enemypic2, x, y, w, w);
            }
            else if (enemyType == 2)
            {
                image(redenemypic2, x, y, w, w);
            }
            else if (enemyType == 3)
            {
                image(bluenemypic2, x, y, w, w);
            }
        }
        tint(style.defaultColor);
        imageMode(CORNER);

        //The healthbar from different kind of enemies
        if(enemyType == 1)
        {
            hitpointsPercentage = (75 / hitpointsBeginWave) * hitpoints;
        }
        if(enemyType == 2)
        {
            hitpointsPercentage = (100 / hitpointsBeginWave) * hitpoints;
        }
        if(enemyType == 3)
        {
            hitpointsPercentage = (50 / hitpointsBeginWave) * hitpoints;
        }
        fill(20, 220, 20);
        rect(x, y - hitpointsGap, hitpointsPercentage, 5);
    }

    /**
    * Check which waypoints have been passed, then set the moveDir
    * to the direction the enemy should go, and move in that direction.
    * @see Enemy.move()
    * @author Kamiel de Visser | 500838438
    */
    void followPath()
    {
        if (! waypointsPassed[0])
        {
            if (x > waypoints.wayPoint1)
            {
                waypointsPassed[0] = true;
                moveDir = 1;
            }
        }
        else if (! waypointsPassed[1])
        {
            if (y < waypoints.wayPoint2)
            {
                waypointsPassed[1] = true;
                moveDir = 3;
            }
        }
        else if (! waypointsPassed[2])
        {
            if (x > waypoints.wayPoint3)
            {
                waypointsPassed[2] = true;
                moveDir = 2;
            }
        }
        else if (! waypointsPassed[3])
        {
            if (y > waypoints.wayPoint4)
            {
                waypointsPassed[3] = true;
                moveDir = 3;
            }
        }
        else if (! waypointsPassed[4])
        {
            if (x > waypoints.wayPoint5)
            {
                waypointsPassed[4] = true;
                moveDir = 1;
            }
        }        
        else if (! waypointsPassed[5])
        {
            if (y < waypoints.wayPoint6)
            {
                waypointsPassed[5] = true;
                moveDir = 3;
            }
        }
        move();
    }

    /**
    * Moves the enemy in moveDir with a certain velocity
    * 1 = up
    * 2 = down
    * 3 = right
    * 4 = left
    * @author Kamiel de Visser | 500838438
    */
    void move()
    {

        switch(moveDir)
        {
            case 1:
                y -= MOVE_SPEED * msMultiplier;
                return;
            case 2:
                y += MOVE_SPEED * msMultiplier;
                return;
            case 3:
                x += MOVE_SPEED * msMultiplier;
                return;
            case 4:
                x -= MOVE_SPEED * msMultiplier;
                return;
            default:
                return;
        }
    }

    /**
    * Holds styling options for Enemy type objects
    * @author Kamiel de Visser | 500838438
    */
    class Style
    {
        color defaultColor = color(255, 255, 255, 255);
        color frozenColor = color(162, 210, 223, 255);
    }
}