public abstract class Example {
  abstract void update();
  
  // Enable classes to handle key pressed events.
  public void keyPressed(){};
    
 
}

// Some examples we place here to control the amount of tabs in the IDE.
public class OscilattionExample extends Example {
  public void update() {
     background(255);
     
     float period = 60;
     float amplitude = 200;
     float x = amplitude * cos(TWO_PI * frameCount / period);
     
     stroke(0);
     fill(175);
     translate(width/2, height/2);
     line(0,0,x,0);
     ellipse(x, 0, 20, 20);
  }
}

public class Baton extends Example {
  float angle;
  float aVelocity;
  float aAcceleration;
  Baton () {
    angle = 0;
    aVelocity = 0;
    aAcceleration = 0.001;
  }
  void update() {
    background(255);
    
    pushMatrix();
    translate(400, 425);
    rotate(radians(angle));
    stroke(0);
    fill(175);
    ellipse(0, 0, 8, 8);
    ellipse(0, -25, 16, 16);
    ellipse(0, 25, 16, 16);
    popMatrix();
    
    aVelocity += aAcceleration;
    angle += aVelocity;
  }
}

public class ClockExample extends Example {
  float r = 0;
  float theta = 0;
  
  ClockExample () {
    
  }
  
  void update() {
    float x = r * cos(theta);
    float y = r * sin(theta);
    
    noStroke();
    fill(0);
    ellipse(x+width/2, y+height/2, 16, 16);
    
    theta += 0.01;
    r+= 0.1;
  }
}

public class SpaceShipExample extends Example {
  World world;
  Spaceship spaceship;
  
  SpaceShipExample () {
      spaceship = new Spaceship();
      
      world = new World();
      world.addForce(new Friction());
      world.addObject(spaceship);
  }
  
  public void keyPressed() {
    if (keyCode == UP) {
      float x = sin(spaceship.angle);
      float y = -cos(spaceship.angle);
      spaceship.setAcceleration(new PVector(x, y));
    }
    if (keyCode == RIGHT){
      spaceship.angle += 0.1;
    }
    if (keyCode == LEFT){
      spaceship.angle -= 0.1;
    }
  }
  
  void update() {
    world.update();
  }
}