class ThreeDBouncingBallsExample extends Example {
  PVector location = new PVector(320, 160, 0);
  PVector velocity = new PVector(1.2, 2.6, 0.8);
  
  void update() {
    background(0);
 
    //Move the ball according to its speed.
    location.add(velocity);
   
    //Check for bouncing.
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
    if ((location.z > 50) || (location.z < -50)) {
      velocity.z = velocity.z * -1;
    }
   
    pushMatrix();
    translate(location.x, location.y, location.z);
    noFill();
    stroke(255);
    sphere(60);
    popMatrix();
  }
}