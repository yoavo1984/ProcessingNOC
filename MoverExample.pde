class MoverExample extends Example {
  Mover mover = new Mover();
  
  void update() {
    background(255);
    mover.update();
    mover.checkEdges();
    mover.display();
  }
}

class MulitpleMovers extends Example {
  Force wind, hellium, gravity, friction;
  World world;
  
  final int MOVERS = 2;
  Mover[] movers = new Mover[MOVERS];
  MulitpleMovers () {
    world = new World();
    
    // Add Forces To World.
    //world.addForce(new Wind());
    world.addForce(new Liquid());
    world.addForce(new Gravity());
    //world.addForce(new Friction());
    
    // Add Movers to world.
    for (int i = 0; i < MOVERS; i++){
      world.addObject(new Mover(random(5, 5), random(10, width -10), random(1, height/2)));
      //movers[i] = new Mover(random(0.1, 5), 50, 50);
    }
  }
  void update() {
    background(255);
    world.update();
   
  }
}

class AirplaneExample extends Example {
  World world;
  
  AirplaneExample() {
     world = new World();
     world.addForce(new Liquid());
     world.addForce(new Gravity());
     world.addObject(new Airplane(10, height/2 + 300));
     
  }
  void update(){
    world.update();
  }
}

class AttractorExample extends Example {
  World world;
  AttractorExample() {
    world = new World();
    
    world.addForce(new Attractor());
    
    world.addObject(new Mover(1, width/2 - 100, height/2 - 100));
    world.addObject(new Mover(2, width/2 + 100, height/2 - 100));
    world.addObject(new Mover(3, width/2 + 100, height/2 + 100));
    
  }
  void update() {
    world.update();
  }
}

class MoverBoxExample extends Example {
  Mover mover = new Mover();
  void update() {
    background(255);
    mover.update();
  }
}