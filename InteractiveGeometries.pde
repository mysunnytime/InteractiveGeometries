ArrayList<Piece> pieces = new ArrayList<Piece>();
color pink = #FFCCCC;

void setup() {
  size(1200, 900);
  background(0);
  int row = 15;
  int col = 20;
  int w = width/col;
  int h = height/row;
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      Piece p = new Piece(i * w, j * h, w, h, pink, random(0.0001, 0.001), random(-0.8, 0.8));
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
  color baseColor = color(255, 255, 255);
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
    color c = brighten(baseColor, cpos);
    //println(red(c), green(c), blue(c));
    fill(c);
    rect(pos.x, pos.y, w, h);
    popMatrix();
    popStyle();
  }

  void update() {
    cacc = -ck * cpos;
    cvel += cacc;
    cpos += cvel;
    //println(cpos, cvel, cacc);
    
    //int dist = (int)dist(pos.x, pos.y, mouseX, mouseY);
    //println(dist);
  }
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
