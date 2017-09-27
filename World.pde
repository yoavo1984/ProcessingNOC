import java.util.*;

class World {
  ArrayList <PhysicsObject> objects;
  ArrayList<Force> forces;
  int numObjects = 0;
  
  
  World() {
    objects = new ArrayList<PhysicsObject>();
    forces = new ArrayList<Force>();
  }
  
  void addObject (PhysicsObject object) {
    objects.add(object);
  }
  
  void addForce (Force force){
    forces.add(force);
  }
  
  void update() {
    background(255);
    for (PhysicsObject object : objects) {
      for (Force force : forces){
        PVector forceVector = force.getForce(object);
        object.applyForce(forceVector);
      }
      
      object.update();
    }
    
    for (Force force : forces){
        force.update();
      }
  }
}