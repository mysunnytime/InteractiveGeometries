// Moving Model and Extended Classes
class MovingModel{
  float pos;
  float vel;
  float acc;
  void update(){
    vel += acc;
    pos += vel;
  }
}

class BrighteningLevel extends MovingModel{
  float k; // frequency, bigger k = shortter loop.
  void update() {
    acc = -k * pos;
    vel += acc;
    vel *= 0.9;
    pos += vel;
  }
}
