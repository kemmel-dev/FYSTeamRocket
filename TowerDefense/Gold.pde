class Gold 
{
  int gold = 150;
  int textSize = 50;
  
  
  Enemy enemy;
  Style style;
  
  Gold() {
    style = new Style();
  }
  
  void giveGold() 
  {
    for(Enemy e : enemies) 
    {
      if(e.hitpoints < 1) 
      {
        gold += 10;
      }
    }
  }
  
  void textGold() 
  {
    fill(style.textFill);
    textSize(textSize);
    text("Gold:  " + gold, width/5, height/5);
  }
  
  class Style 
  {
    color textFill = color(255);
  }
}