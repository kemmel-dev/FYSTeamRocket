class Enemy
{
    int x;
    int y;
    int w;
    float hitpoints;
    int moveDir = 3;
    float msMultiplier = 1;
    boolean frozenEnemy = false;

    Style style;

    // This array stores whether we've passed
    // checkpoint
    Boolean[] waypointsPassed = new Boolean[6];

    Enemy()
    {
        Tile t = grid.grid[0][5];

        x = - t.w;
        y = t.y;
        w = int(t.w / 2);
        style = new Style();
        initWaypoints();
        hitpoints = 30 + (wave.waveNumber * 20);
    }

    Boolean takeDamage(float damage)
    {
        hitpoints -= damage;
        if (hitpoints < 0)
        {
            return true;
        }
        return false;
    }

    // Initialises the wayPointspassed by setting
    // all bools to false
    void initWaypoints()
    {
        for (int i = 0; i < waypointsPassed.length; i++)
        {
            waypointsPassed[i] = false;
        }
    }

    void display()
    {
        if(frozenEnemy)
        {
            fill(style.frozenColor);
        }
        else
        {
            fill(style.enemyColor);
        }
        rect(x, y, w, w);
    }

    // Check which waypoints have been passed,
    // then determine whether we have to change
    // move directions, then move
    // in that direction.
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

    // Moves towards moveDir
    void move()
    {
        // moveDir means:
        // 1 = up
        // 2 = down
        // 3 = right
        // 4 = left
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

    class Style
    {
        color enemyColor = color(255, 20, 20);
        color frozenColor = color(186, 242, 239);
    }
}