class RandomMover extends Example {
  Mover mover;
  float x_offset = 0.;
  float y_offset = 10000;
  RandomMover () {
    mover = new Mover();
  }
  void update(){
    background(255);
    float xAccel = map(noise(x_offset), 0, 1, -0.01, 0.012);
    float yAccel = map(noise(y_offset), 0, 1, -0.01, 0.012);
    
    updateNoise();
    
    mover.setAcceleration(new PVector(xAccel, yAccel));
    mover.update();
  }
  
  void updateNoise() {
    x_offset += 0.01;
    y_offset += 0.01;
    
    if(x_offset > 100000){
      x_offset = 0;
    }
    if(y_offset > 100000){
      y_offset = 0;
    }
  }
}