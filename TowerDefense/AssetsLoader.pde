class AssetsLoader
{

    SoundFile laserSound;
    SoundFile freezeSound;
    SoundFile backGround;
    SoundFile inGameBackground;
    SoundFile bombSound;

    AssetsLoader()
    {

    }

    void createImages()
    {
    // Background pictures
    startmenu = loadImage("background3.png");
    controlsimage = loadImage("controls.png");
    controlsmenu = loadImage("controls.png");
    altsmenu = loadImage("background1.png");
    gameoverscreen = loadImage("background2.png");

    // Font
    font = createFont("Impact",36);

    // Towers
    tower = loadImage("tower.png");
    lasertower = loadImage("laser.png");
    freezetower = loadImage("freeze.png");
    bombtower = loadImage("bomb.png");
    farmtower = loadImage("farm.png");

    // Pictures for the in game hud (Towers Related)
    lasertowerhud = loadImage("laserhd.png");
    freezetowerhud = loadImage("freezehd.png");
    bombtowerhud = loadImage("bombhd.png");
    farmtowerhud = loadImage("farmhd.png");
    goldcoinhud = loadImage("goldhd.png");

    // Pictures for the in game hud (Currency/Lives)
    goldcoin = loadImage("gold.png");
    lives = loadImage("lives.png");

    // Pictures for the enemy
    enemypic1 = loadImage("enemypic1.png");
    enemypic2 = loadImage("enemypic2.png");
    enemypic3 = loadImage("enemypic3.png");

    redenemypic1 = loadImage("redenemypic1.png");
    redenemypic2 = loadImage("redenemypic2.png");
    redenemypic3 = loadImage("redenemypic3.png");

    bluenemypic1 = loadImage("bluenemypic1.png");
    bluenemypic2 = loadImage("bluenemypic2.png");
    bluenemypic3 = loadImage("bluenemypic3.png");

    // Picture resizes
    tower.resize(100,100);
    lasertower.resize(100,100);
    freezetower.resize(100,100);
    bombtower.resize(100,100);
    farmtower.resize(100,100);

    lasertowerhud.resize(80,80);
    freezetowerhud.resize(80,75);
    bombtowerhud.resize(75,70);
    farmtowerhud.resize(80,75);
    goldcoinhud.resize(20,20);

    goldcoin.resize(25,25);
    lives.resize(40,40);

    enemypic1.resize(100,100);
    enemypic2.resize(100,100);
    enemypic3.resize(100,100);

    redenemypic1.resize(100,100);
    redenemypic2.resize(100,100);
    redenemypic3.resize(100,100);

    bluenemypic1.resize(100,100);
    bluenemypic2.resize(100,100);
    bluenemypic3.resize(100,100);




    }

    public void loadSounds()
    {
        laserSound = new SoundFile(TowerDefense.this, "LaserSound.mp3");
        freezeSound = new SoundFile(TowerDefense.this, "FreezeSound.mp3");
        backGround = new SoundFile(TowerDefense.this, "BackgroundMusic.mp3");
        inGameBackground = new SoundFile(TowerDefense.this, "IngameBackgroundMusic.mp3");
        bombSound = new SoundFile(TowerDefense.this, "bombSound.mp3");
    }

    void laserSoundEffect()
    {
        if(!laserSound.isPlaying())
        {
            laserSound.amp(0.1);
            laserSound.play();
        }
    }

    void freezeSoundEffect()
    {
        if(!freezeSound.isPlaying())
        {
            freezeSound.amp(0.1);
            freezeSound.play();
        }
    }

    void startMenuMusic()
    {
        if(!backGround.isPlaying())
            {
                backGround.play();
                backGround.amp(0.01);
            }
        inGameBackground.stop();
    }

    void inGameMusic()
    {
        if(!inGameBackground.isPlaying())
            {
                inGameBackground.play();
                inGameBackground.amp(0.1);
            }
        backGround.stop();
    }

    void bombSound()
    {
        bombSound.play();
        bombSound.amp(0.1);
    }

}