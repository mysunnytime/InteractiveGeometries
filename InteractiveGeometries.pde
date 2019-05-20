ArrayList<Piece> pieces = new ArrayList<Piece>();
color white = #FFFFFF;
color black = #000000;
color pink = #FFCCCC;

void setup() {
  frameRate(10);
  size(1200, 900);
  int row = 30;
  int col = 40;
  int w = width/col;
  int h = height/row;
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      Piece p = new Piece(i * w, j * h, w, h, pink, random(0.5), random(-2, 2));
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
  color targetColor = white;
  float ck = 0.001;   // multiplier for: acc = -k * pos
  float cpos = 0; // the difference level between base color and display color;
  float cvel = 1; // velocity of color change
  float cacc = 0; // acceleration of color change

  Piece(int x, int y, int w, int h, color c) {
    this.pos.x = x;
    this.pos.y = y;
    this.w = w;
    this.h = h;
    this.baseColor = c;
  }
  
  Piece(int x, int y, int w, int h, color c, float ck, float cvel) {
    this.pos.x = x;
    this.pos.y = y;
    this.w = w;
    this.h = h;
    this.baseColor = c;
    this.ck = ck;
    this.cpos = 0;
    this.cvel = cvel;
    this.cacc = 0;
  }

  void display() {
    pushStyle();
    pushMatrix();
    noStroke();
    color c;         // final color
    float cp = cpos; // final brightening level

    // apply mouse distant on cpos, into cp; apply cp on baseColor to get the final color.
    //int dist = (int)dist(pos.x, pos.y, mouseX, mouseY);
    //float maxRange =300;
    //if(dist < maxRange) cp += map(dist, maxRange, 0, 0, 50);
    
    // transit baseColor to targetColor
    baseColor = colorTransition(baseColor, targetColor, 0.2);
    
    // apply brightening
    c = brighten(baseColor, cp);
    
    //println(red(c), green(c), blue(c));
    fill(c);
    rect(pos.x, pos.y, w, h);
    popMatrix();
    popStyle();
  }

  void update() {
    cacc = -ck * cpos;
    cvel += cacc;
    cvel *= 0.9;
    cpos += cvel;
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

void mouseClicked() {
  
}
