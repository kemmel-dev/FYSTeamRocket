class Gold 
{
  int amount = 80;
  int textSize = 30;
  int xPos;
  int yPos;
  
  
  Enemy enemy;
  Style style;
  
  Gold() {
    xPos = 125;
    yPos = 50;


    style = new Style();
  }
  
  void textGold() 
  {
    fill(style.textFill);
    textSize(textSize);
    text("Gold: " + amount, xPos, yPos);
  }
  
  class Style 
  {
    color textFill = color(255);
  }
}