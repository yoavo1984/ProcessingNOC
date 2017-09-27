class Mover extends PhysicsObject{
  
  Mover() {
    this(random(width), random(height));
  }
  
  Mover(float x, float y) {
    this(1, x, y);
  }
  
  Mover(float _mass, float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    mass = _mass;
    velocity.limit(10);
    acceleration = new PVector(0, 0);
  }
  
  void setLocation (PVector new_location){
    location = new_location;
  }
  
  void setVelocity (PVector new_velocity) {
    velocity = new_velocity;
  }
  
  PVector getVelocity () {
    return velocity;
    
  }
  
  void applyForce (Force force) {
    acceleration.add(force.getForce(this));
  }
  
  void setAcceleration (PVector new_acceleration) {
    acceleration = PVector.div(new_acceleration, mass);
  }
  
  void update() {
     
    velocity.add(acceleration);
    velocity.limit(5);
    aVelocity += aAcceleration;
    
    //velocity.limit(8);
    location.add(velocity);
    //angle = velocity.heading();
    
    setAcceleration(new PVector(0,0));
    
    display();
    checkEdges();
  }
  
  void display() {
    stroke(0);
    fill(175, 200);
    rectMode(CENTER);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0,0, mass*16, mass*8);
    popMatrix();
  }
  
  void checkEdges() {
    if (location.x > width) {
      //location.x = width;
      //velocity.x *= -1;
      location.x = 0;
    } else if (location.x < 0) {
      //location.x = 0;
      //velocity.x *= -1;
      location.x = width;
    }
    
    if (location.y > height) {
      //location.y = height;
      //velocity.y *= -1;
      location.y = 0;
    } else if (location.y < 0) {
      //location.y = 0;
      //velocity.y *= -1;
      location.y = height;
    }
  }
}

class Airplane extends Mover{
  Airplane(float x, float y){
    super(x, y);
  }
  
  void update() {
    applyForce(new PVector(0.115, 0));
    super.update();
  }
}

class Spaceship extends Mover {
  float r = 10;
  Spaceship () {
    super(width/2, height/2);
  }
  
  void display () {
    stroke(125);
    fill(175, 200);
    pushMatrix();
    
    // Transformations.
    translate(location.x, location.y);
    rotate(angle);
    
    // Drawing.
    triangle(0, -r, r, r, -r, r);
    
    popMatrix();
  }
  
}