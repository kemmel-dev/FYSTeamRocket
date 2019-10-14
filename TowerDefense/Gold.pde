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
      if(e.hitpoints <= 0) 
      {
        gold += 5;
      }
    }
    
  }
  
  void textGold() 
  {
    fill(style.textFill);
    textSize(textSize);
    text("Gold:  " + gold, width/6, height/8);
  }
  
  class Style 
  {
    color textFill = color(255, 255, 255, 175);
  }
}