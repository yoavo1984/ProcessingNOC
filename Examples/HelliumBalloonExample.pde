class HelliumBalloonExample extends Example {
  
  Mover balloon;
  Force wind, hellium, gravity;
  HelliumBalloonExample () {
    balloon = new Mover(width/2, height/2);
    
    // Create forces objects.
    wind = new Wind();
    hellium = new Hellium();
    gravity = new Gravity();
  }
  
  void update(){
    background(255);
    PVector netForce = new PVector(0,0);
    netForce.add(gravity.getForce(balloon));
    netForce.add(wind.getForce(balloon));
    
    balloon.setAcceleration(netForce);
    
    confineToTop();
    balloon.update();
  }
  
  void confineToTop () {
    if (balloon.getY() < 20){
      balloon.setLocation(new PVector(balloon.getX(), 25));
    }
  }
}