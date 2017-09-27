class Pendulum {
  PVector origin = new PVector(width/2, height/2);
  PVector location;
  float r = 125;
  float angle;
  float aVelocity;
  float aAcceleration;
  float damping;
  
  Pendulum () {
    location = new PVector();
    angle = PI/4;
    damping = 0.999;
  }
  
  void update() {
    float gravity = 0.4;
    aAcceleration = -1 * (gravity/r) * sin(angle);
    
    aVelocity += aAcceleration;
    angle += aVelocity;
    
    aVelocity *= damping;
  }
  
  void display() {
    location = new PVector(r*sin(angle),r*cos(angle));
    location.add(origin);
    
    stroke(0);
    fill(175);
    line(origin.x, origin.y, location.x, location.y);
    ellipse(location.x, location.y, 24, 24);
    
  }
}


class PendulumExample extends Example {
  Pendulum pen = new Pendulum();
  
  
  public void update() {
    background(255);
    pen.update();
    pen.display();
  }
}