class AssetsLoader
{

    SoundFile laserSound;
    SoundFile freezeSound;
    SoundFile backGround;
    SoundFile inGameBackground;

    AssetsLoader()
    {

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