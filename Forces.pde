abstract class Force {
  Area _area;
  Force() {
    _area = new Area();
  }
  
  PVector getForce(PhysicsObject object){
    if (_area.includes(object)){
      return getForceMagnitude(object);
    } else {
      return new PVector(0,0);
    }
  }
  
  void update(){
    
  }
  
  abstract PVector getForceMagnitude(PhysicsObject object);
}

public class Gravity extends Force {
  Area _area;
  Gravity() {
    
  }
  PVector getForceMagnitude(PhysicsObject object) {
   return new PVector (0, 1 * object.mass); 
  }
}

public class Friction extends Force {
  float normal = 1;
  float coeffecient = 0.01;
  
  Friction() {
    //_area = new Area(width/2, height/2, 75, 75);
  }
  
  PVector getForceMagnitude(PhysicsObject object) {
    PVector friction = object.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    
    friction.mult(normal * coeffecient);
    
     return friction; 
  }
}

public class Wind extends Force {
  float xOff = 0;
  float yOff = 10000;
  float increment = 0.01;
  
  PVector getForceMagnitude(PhysicsObject object) {
    //float x = map(noise(xOff), 0, 1, -0.1, 0.1);
    //float y = map(noise(yOff), 0, 1, 0, 0.2);
    //xOff += increment;
    //yOff += increment;
    //return new PVector(x, y);
    return new PVector(0.01 / object.mass, 0);
  }
}

public class Liquid extends Force {
  float c = 0.05;
  Liquid () {
    _area = new Area(0, 0, width, height);
  }
  
  PVector getForceMagnitude(PhysicsObject object) {
    float speed = object.velocity.mag();
    
    float dragMagnitude = c * speed * speed;
    PVector drag = object.velocity.copy();
    
    drag.mult(-1);
    drag.normalize();
    
    drag.mult(dragMagnitude);
    
    PVector perpendicular = new PVector(drag.y, drag.x);
    return drag.add(perpendicular);
  }
  
  void update() {
    noStroke();
    fill(125, 125);
    rect(_area._x, _area._y, _area._width, _area._height);
  }
}

public class Attractor extends Force {
  float G = 1;
  float mass;
  PVector location;
  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 20;
  }
  
  PVector getForceMagnitude(PhysicsObject object) {
    PVector force = PVector.sub(location, object.getLocation());
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    
    force.normalize();
    float strength = (G * mass * object.mass) / (distance * distance);
    
    force.mult(strength);
    
    return force;
  }
  
  void update() {
    stroke(0);
    fill(175, 200);
    ellipse(location.x, location.y, mass*2, mass*2);
  }
  
}

public class Hellium extends Force {
  PVector getForceMagnitude(PhysicsObject object) {
    return new PVector(0, -0.1);
  }
}