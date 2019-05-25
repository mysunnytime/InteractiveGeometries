class BreathingPieces extends InteractiveGeometry{
  ArrayList<Piece> pieces;

  BreathingPieces() {
    pieces = new ArrayList<Piece>();
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

  void mouseMoved() {
    for (Piece p : pieces) {
      float range = 150 * constrain(dist(pmouseX, pmouseY, mouseX, mouseY)/50, 0, 1);
      float dist = dist(p.pos.x, p.pos.y, mouseX, mouseY);
      if (dist < range) {
        p.brighteningLevel.vel = 20;
      }
    }
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

    fill(c);
    rect(pos.x, pos.y, w, h);
    popMatrix();
    popStyle();
  }

  void update() {
    brighteningLevel.update();
  }
}
