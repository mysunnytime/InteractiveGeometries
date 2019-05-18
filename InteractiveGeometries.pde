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
      p.c = color(random(255));
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
  float cvelMax;
  float cvel; // velocity of color change
  float cacc; // acceleration of color change

  Piece(int x, int y, int w, int h) {
    pos.x = x;
    pos.y = y;
    this.w = w;
    this.h = h;
    c = baseColor;
    cvelMax = 10;
    cvel = cvelMax;
    cacc = -0.2;
  }

  void display() {
    pushStyle();
    pushMatrix();
    noStroke();
    fill(c);
    rect(pos.x, pos.y, w, h);
    popMatrix();
    popStyle();
  }

  void update() {
    if(cvel < -cvelMax || cvel > cvelMax){
      cacc *= -1;
    }
    cvel += cacc;
    
    c = brighten(c, cvel);
    println(red(c), green(c), blue(c));
    
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
