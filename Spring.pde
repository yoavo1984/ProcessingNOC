public class Spring {
  PVector anchor;
  
  float restLength;
  
  float k = 0.1;
  
  Spring (float x, float y, float len) {
    anchor = new PVector(x,y);
    restLength = len;
  }
  public void connect (Mover m) {
    PVector force = PVector.sub(m.getLocation(), anchor);
    float currentLength = force.mag();
    float x = currentLength - restLength;
    
    force.normalize();
    
    force.mult(-1 * k * x);
    
    m.applyForce(force);
  }
  
  void display(Mover m) {
    fill(100);
    rectMode(CENTER);
    rect(anchor.x, anchor.y, 16, 16);
    displayLine(m);
  }
  
  void displayLine (Mover m) {
    stroke(0);
    line(m.getX(), m.getY(), anchor.x, anchor.y);
  }
}

public class SpringExample extends Example{
  World world;
  Spring spring;
  Mover m;
  SpringExample () {
    world = new World();
    m = new Mover(width/2, height/2 - 20);
    spring = new Spring(width/2, height/2 - 50, 80);
    
    world.addForce(new Gravity());
    world.addForce(new Friction());
    world.addObject(m);
    
  }
  public void update() {
    spring.connect(m);
    
    world.update();
    spring.display(m);
  }
}