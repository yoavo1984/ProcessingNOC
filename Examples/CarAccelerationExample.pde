class CarAccelerationExample extends Example{
 Mover car;
 
  CarAccelerationExample() {
    car = new Mover();
    car.setLocation(new PVector(50, height/2));
    car.setVelocity(new PVector(0,0));
    car.setAcceleration(new PVector(0.0,0));
  }
  void update() {
    background(255);
    car.update();
    car.display();
    car.checkEdges();
  }
  
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        car.setAcceleration(new PVector(0.01,0));
      } else if (keyCode == DOWN && car.getVelocity().x >= 0) {
          car.setAcceleration(new PVector(-0.01,0));
      } else {
        car.setAcceleration(new PVector(0,0));
      } 
    }
  }
 }