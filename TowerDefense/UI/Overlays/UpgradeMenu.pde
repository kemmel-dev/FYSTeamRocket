class UpgradeMenu{

boolean bool = false;


int currTower = 100;

void setup() {
  size(1602, 902);
 
}


void drawMenu() {
  // zolang bool true is 
  while (bool) {
   
    // als de onderste circle selected is dan gaat ie naar de bovenste.
    if (currTower > 700) {
      currTower = 100;
    }
    // zelfde maar dan omgekeerd
    if (currTower < 100) {
      currTower = 700;
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
    circle(1402, currTower, 150); 
    fill(#222222);
    stroke(0);
    
    break;

  }  
}

void draw() {
  background(255);
 

  drawMenu();
}

void keyPressed() {
 // als je op enter klikt is bool true en runt ie de drawmenu fucntion en opent ie de menu
  if (key == ENTER) { 
    bool = true;
    drawMenu();
  }
 //  als je tab doet gaat de menu weg en is bool false.
  if (key == TAB) {
    bool = false;
  }  
  
  //  tijdelijk aanduideing dat ie herkent welke circle ie te pakken heeft.
  if (key == TAB) {
    println("Torentje gekocht in oud zuid met de y waarde: " + currTower);
  }
  
  // circle navigatie omhoog
  if (key == 'w') {
  currTower -= 200;
  }
  // circle navigatie omlaag
  if (key == 's') {
  currTower += 200;
  }
    
}
}