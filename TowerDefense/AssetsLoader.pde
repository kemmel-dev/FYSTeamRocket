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
            laserSound.amp(0.2);
            laserSound.play();
        }
    }

    void freezeSoundEffect()
    {
        if(!freezeSound.isPlaying())
        {
            freezeSound.amp(0.2);
            freezeSound.play();
        }
    }

    void backgroundMusic()
    {
        switch(stage)
        {
            case 1:
                if(!backGround.isPlaying())
                {
                    backGround.play();
                    backGround.amp(1);
                }
                else
                {
                    backGround.stop();
                }
                return;
            case 2:
                if(!inGameBackground.isPlaying())
                {
                    inGameBackground.play();
                    inGameBackground.amp(1);
                }
                else
                {
                    backGround.stop();
                }
                return;
        }
    }
}