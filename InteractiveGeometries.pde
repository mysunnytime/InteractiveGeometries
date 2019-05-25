InteractiveGeometry interactiveGeometry;

void setup() {
  frameRate(30);
  size(1200, 900);
  interactiveGeometry = new BreathingPieces();
}

void draw() {
  interactiveGeometry.draw();
}

void mouseMoved() {
  interactiveGeometry.mouseMoved();
}

class InteractiveGeometry {
  void draw(){}
  void mouseMoved(){}
}
