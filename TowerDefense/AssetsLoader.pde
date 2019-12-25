class AssetsLoader
{

    SoundFile laserSound;
    SoundFile freezeSound;
    SoundFile backGround;
    SoundFile inGameBackground;

    AssetsLoader()
    {

    }

    void createImages()
    {
    // Background pictures
    startmenu = loadImage("startimage.jpg");
    controlsimage = loadImage("controls.png");

    // Font
    font = createFont("Impact",36);

    // Towers
    lasertower = loadImage("laser.png");
    freezetower = loadImage("freeze.png");
    bombtower = loadImage("bomb.png");
    bufftower = loadImage("buff.png");

    // Pictures for the in game hud (Towers Related)
    lasertowerhud = loadImage("laserhd.png");
    freezetowerhud = loadImage("freezehd.png");
    bombtowerhud = loadImage("bombhd.png");
    bufftowerhud = loadImage("buffhd.png");
    goldcoinhud = loadImage("goldhd.png");

    // Pictures for the in game hud (Currency/Lives)
    goldcoin = loadImage("gold.png");
    lives = loadImage("lives.png");

    // Picture resizes
    lasertower.resize(100,100);
    freezetower.resize(100,100);
    bombtower.resize(100,100);
    bufftower.resize(100,100);

    lasertowerhud.resize(80,80);
    freezetowerhud.resize(80,75);
    bombtowerhud.resize(75,70);
    bufftowerhud.resize(80,75);
    goldcoinhud.resize(20,20);

    goldcoin.resize(25,25);
    lives.resize(40,40);



    }

    public void loadSounds()
    {
        laserSound = new SoundFile(TowerDefense.this, "LaserSound.mp3");
        freezeSound = new SoundFile(TowerDefense.this, "FreezeSound.mp3");
        backGround = new SoundFile(TowerDefense.this, "BackgroundMusic.mp3");
        inGameBackground = new SoundFile(TowerDefense.this, "IngameBackgroundMusic.mp3");
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
                backGround.amp(0.03);
            }
        inGameBackground.stop();
    }

    void inGameMusic()
    {
        if(!inGameBackground.isPlaying())
            {
                inGameBackground.play();
                inGameBackground.amp(0.3);
            }
        backGround.stop();
    }

}