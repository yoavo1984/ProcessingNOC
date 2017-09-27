class PhysicsObject {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0.000;
  
  void applyForce(PVector force){
    PVector appliedForce = force.copy();
    appliedForce.div(mass);
    acceleration.add(appliedForce);
  }
  
  PVector getLocation() {
    return location;
  }
  
  float getX () {
    return getLocation().x;
  }
  
  float getY () {
    return getLocation().y;
  }
  
  void update(){}; // To be implemented by sub classes.
  
}