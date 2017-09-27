class MouseAccel extends Example {
  
  Mover mover;
  MouseAccel () {
    mover = new Mover();
  }
  
  void update() {
    background(255);
    PVector mouse = new PVector(mouseX, mouseY);
    PVector location = mover.getLocation();
    
    mover.angle = mover.velocity.heading();
    
    PVector accel = PVector.sub(mouse, location);
    accel.setMag(0.2);
    
    mover.setAcceleration(accel);
    mover.update();
  }
}

class CarExample extends Example {
  Mover car;
  World world;
  
  CarExample () {
    world = new World();
    world.addForce(new Friction());
    
    car = new Mover();
    world.addObject(car);
  }
  public void keyPressed() {
    if (keyCode == UP) {
      car.setAcceleration(new PVector(0,0.25));
    }
    if (keyCode == RIGHT){
      car.setAcceleration(new PVector(0.175, 0.25));
    }
    if (keyCode == LEFT){
      car.setAcceleration(new PVector(-0.175, 0.25));
    }
  }
  void update() {
    world.update();
  }
}