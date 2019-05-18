ArrayList<Piece> pieces = new ArrayList<Piece>();

void setup() {
  size(1200, 900);
  background(0);
  int row = 1;//30;
  int col = 2;//40;
  int w = width/col;
  int h = height/row;
  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {
      Piece p = new Piece(i * w, j * h, w, h);
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

color baseColor = #FFCCCC;

class Piece {
  PVector pos = new PVector(0, 0);
  int w = 0;
  int h = 0;
  color c = color(255, 255, 255);
  float ck;   // multiplier for: acc = -k * pos
  float cpos; // the difference level between base color and display color;
  float cvel; // velocity of color change
  float cacc; // acceleration of color change

  Piece(int x, int y, int w, int h) {
    pos.x = x;
    pos.y = y;
    this.w = w;
    this.h = h;
    c = baseColor;
    ck = .001;
    cpos = 0;
    cvel = 3;
    cacc = 0;
  }

  void display() {
    pushStyle();
    pushMatrix();
    noStroke();
    color displayColor = brighten(c, cpos);
    println(red(displayColor), green(displayColor), blue(displayColor));
    fill(displayColor);
    rect(pos.x, pos.y, w, h);
    popMatrix();
    popStyle();
  }

  void update() {
    cacc = -ck * cpos;
    cvel += cacc;
    cpos += cvel;
    println(cpos, cvel, cacc);
    
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
