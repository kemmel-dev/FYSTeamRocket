float x = 0;
float y = 0;
PImage grass;
PImage sand;
PImage bg;

int gridX = 0;
int gridY = 0;
int gridRadius = 100;
int gridWidth = 100;
int gridHeight = 100;
// tobias
int currY = 100;

void setup() {
  size(1600, 900);
  grass = loadImage("grass.jpg");
  sand = loadImage("sand.png");
  bg = loadImage("bg.PNG");
}

//tobias
void drawMenu() {
  // zolang bool true is 
  while (bool) {
   
    // als de onderste circle selected is dan gaat ie naar de bovenste.
    if (currY > 700) {
      currY = 100;
    }
    // zelfde maar dan omgekeerd
    if (currY < 100) {
      currY = 700;
    }
// tekent de rect 
    fill(#222222);
    rect(1202, 0, 400, height);
    fill(255);
  
  // tekent de circles
    circle(1402, 100, 150); 
    circle(1402, 300, 150);
    circle(1402, 500, 150);
    circle(1402, 700, 150);
    
    
    // tekent circle over andere circle met w en s bestuurbaar
    fill(#111111);
    stroke(#FF0000);
    circle(1402, currY, 150); 
    fill(#222222);
    stroke(0);
    
    break;

  }  
}

void draw() {
  background(255);
  // background(bg)
  fill(255, 0, 0, 80);
  rect(gridX, gridY, gridRadius, gridRadius);


  if (gridX >=width) {
    gridX = 0;
  }
  if (gridX < 0) {
    gridX = width-gridRadius;
  }
  if (gridY >=height) {
    gridY = 0;
  }
  if (gridY < 0) {
    gridY = height-gridRadius;
  }

  drawMenu();
}

void keyPressed() {
 // tobias als je op enter klikt is bool true en runt ie de drawmenu fucntion en opent ie de menu
  if (key == ENTER) {
    bool = true;
    drawMenu();
  }
 // tobias als je tab doet gaat de menu weg en is bool false.
  if (key == TAB) {
    bool = false;
  }  
  
  // tobias tijdelijk aanduideing dat ie herkent welke circle ie te pakken heeft.
  if (key == TAB) {
    println("Torentje gekocht in oud zuid met de y waarde: " + currY);
  }
  
  // tobias circle navigatie omhoog
  if (key == 'w') {
  currY -= 200;
  }
  // tobias circle navigatie omlaag
  if (key == 's') {
  currY += 200;
  }
    
  if (key == CODED) {    
    if (keyCode == UP) {
      gridY = gridY -gridHeight;
    } else if (keyCode == DOWN) {
      gridY = gridY +gridHeight;
    } 
    if (keyCode == RIGHT) {
      gridX = gridX +gridWidth;
    } else if (keyCode == LEFT) {
      gridX = gridX -gridWidth;
    }
  }
  //Path:
  //0,500
  //100,500
  //200,500
  //300,500
  //300,400
  //300,300
  //300,200
  //400,200
  //500,200
  //600,200
  //600,300
  //600,400
  //600,500
  //600,600
  //600,700
  //700,700
  //800,700
  //900,700
  //1000,700
  //1000,600
  //1000,500
  //1000,400
  //1000,300
  //1100,300
  //1200,300
  //1300,300
  //1400,300
  //1500,300
}