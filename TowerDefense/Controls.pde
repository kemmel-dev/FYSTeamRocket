class Controls {

  // 1 = up
  // 2 = down
  // 3 = left
  // 4 = right

  int selectionX, selectionY;

  void Move(int moveType) {
    if (moveType == 1) {
      selectionY = restrain(selectionY - 1, 0, 9);
    }
    if (moveType == 2) {
      selectionY = restrain(selectionY + 1, 0, 9);
    }
    if (moveType == 3) {
      selectionX = restrain(selectionY - 1, 0, 16);
    }
    if (moveType == 4) {
      selectionX = restrain(selectionY + 1, 0, 16);
    }
  }

  void keyPressed()
  {
    if (key == CODED) 
    {
      if (keyCode == UP) 
      {
        Move(1);
      } 
      else if (keyCode == DOWN) 
      {
        Move(2);
      }
      if (keyCode == LEFT) 
      {
        Move(3);
      } 
      else if (keyCode == RIGHT) 
      {
        Move(4);
      }
    }
  }
}