ArrayList<LaserTower> tower;
int gold;


void setup() {
  size(1600, 900);
  tower = new ArrayList<LaserTower>();
  gold = 100;
}

void draw() {
  background(50);
  if(keyPressed && key == 'b' && gold < 100) {
    gold += 100;
  }
  if(keyPressed && key == ' ' && gold >= 100) {
    tower.add(new LaserTower(mouseX, mouseY));
    gold -= 100;
  }
  for(int i = 0; i < tower.size(); i++) {
    LaserTower towerG = tower.get(i);
    towerG.placement();
  }
  textSize(50);
  text(gold, width/2, height/5);
}