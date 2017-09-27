class Oscillator {
  PVector angle;
  PVector velocity;
  PVector amplitude;
  PVector location;
  
  Oscillator () {
    angle = new PVector();
    velocity = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    amplitude = new PVector(random(width/2),random(height/2));
  }
  
  Oscillator(PVector _velocity, PVector _amplitude) {
    this();
    velocity = _velocity;
    amplitude = _amplitude;
    
  }
  
  void oscillate () {
    angle.add(velocity);
  }
  
  void display () {
    float x = sin(angle.x) * amplitude.x;
    float y = sin(angle.y) * amplitude.y;
    
    pushMatrix();
    translate(width/2, height/2);
    stroke(0);
    fill(175);
    line(0,0, x, y);
    ellipse(x,y,16,16);
    popMatrix();
  }
}

class Wave {
  float xOffset;
  float waveLength;
  float startingAngle = 0;
  float angleVel = 0.1;
  float amplitude = height/4;
  float radius = 48;
  PVector position;
  
  Wave() {
    xOffset = 12;
    waveLength = width/2;
    position = new PVector(0,0);
  }
  
  Wave (PVector startingPosition) {
    this();
    position = startingPosition;
  }
  
  
  Wave(float offset, float _waveLength, float _startingAngle, float _angleVel, float _amplitude) {
    this();
    xOffset = offset;
    waveLength = _waveLength;
    startingAngle = _startingAngle;
    angleVel = _angleVel;
    amplitude = _amplitude;
  }
  
  void setPosition (PVector position) {
    this.position = position;
  }
  
  void display() {
    startingAngle += 0.02;
    float angle = startingAngle;
    for (int i = 0; i < waveLength; i += xOffset) {
      float y = (amplitude)*sin(angle) + height/2;
      
      fill(200, 125);
      ellipse(position.x + i + radius/2,position.y + y, radius, radius);
      
      angle += angleVel;
    }
  }
}

class WaveExample extends Example {
  Wave waveOne;
  Wave waveTwo;
  
  WaveExample () {
    waveOne = new Wave(12, width/2, 0.5, 0.1, -height/4);
    //waveTwo = new Wave(12, width/2, 0, 0.1, height/2);
    //waveTwo.setPosition(new PVector(width/2, 0));
  }
  
  void update() {
    background(255);
    waveOne.display();
    //waveTwo.display();
  }
}

class OscillatorExample extends Example{
  int osis_num = 10;
  Oscillator [] osis;
  OscillatorExample () {
    osis = new Oscillator[osis_num];
    for (int i = 0 ; i < osis_num; i++)  {
      PVector velocity = new PVector(pow(-1, i)*0.0001*i, pow(-1, i)*.0001);
      PVector amplitude = new PVector(50, 100);
      osis[i] = new Oscillator(velocity, amplitude);
    }
  }
  
  void update() {
    background(255);
    for (int i = 0 ; i < osis_num; i++)  {
      osis[i].oscillate();
      osis[i].display();
    }
  }
}