ArrayList<Piece> pieces = new ArrayList<Piece>();
color white = #FFFFFF;
color black = #000000;
color pink = #FFCCCC;
color blue = #5F36DE;

void setup() {
  frameRate(10);
  size(1200, 900);
  int row = 45;
  int col = 60;
  int w = width/col;
  int h = height/row;
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      Piece p = new Piece(i * w, j * h, w, h, blue, random(0.05, 0.5), 0);
      pieces.add(p);
    }
  }
}

void draw() {
  background(0);
  for (Piece p : pieces) {
    p.display();
    p.update();
  }
}

class Piece {
  PVector pos = new PVector(0, 0);
  int w = 0;
  int h = 0;
  color baseColor = white;
  BrighteningLevel brighteningLevel = new BrighteningLevel();

  Piece(int x, int y, int w, int h, color baseColor, float brighteningLevelK, float brighteningLevelVel) {
    this.pos.x = x;
    this.pos.y = y;
    this.w = w;
    this.h = h;
    this.baseColor = baseColor;
    brighteningLevel.k = brighteningLevelK;
    brighteningLevel.vel = brighteningLevelVel;
  }

  void display() {
    pushStyle();
    pushMatrix();
    noStroke();
    color c;         // final color
    float cp = brighteningLevel.pos; // final brightening level
    
    // apply brightening
    c = brighten(baseColor, cp);
    
    //println(red(c), green(c), blue(c));
    fill(c);
    rect(pos.x, pos.y, w, h);
    popMatrix();
    popStyle();
  }

  void update() {
    brighteningLevel.update();
    //println(cpos, cvel, cacc);
  }
}

color colorTransition(color base, color target, float ratio) {
  float rbase, gbase, bbase, rtarget, gtarget, btarget;
  rbase = red(base);
  gbase = green(base);
  bbase = blue(base);
  rtarget = red(target);
  gtarget = green(target);
  btarget = blue(target);
  float r = abs(rbase - rtarget) <= 1 ? rtarget : map(ratio, 0, 1, rbase, rtarget);
  float g = abs(gbase - gtarget) <= 1 ? gtarget : map(ratio, 0, 1, gbase, gtarget);
  float b = abs(bbase - btarget) <= 1 ? btarget : map(ratio, 0, 1, bbase, btarget);
  return color(r, g, b);
}

color brighten(color c, float d) {
  float r = red(c) + d;
  float g = green(c) + d;
  float b = blue(c) + d;
  c = color(r, g, b);
  return c;
}

void mouseMoved() {
  for(Piece p : pieces){
    float range = 150 * constrain(dist(pmouseX, pmouseY, mouseX, mouseY)/50, 0, 1);
    float dist = dist(p.pos.x, p.pos.y, mouseX, mouseY);
    if(dist < range) {
      p.brighteningLevel.vel = 20;
    }
  }
}
