import java.util.*;

Random generator;
Example example;
 
void setup() {
  size(640, 360);
  
  // choose the example you want to run.
  example = new SpringExample();
  registerMethod("keyPressed", example);
}

void draw () {
  example.update();
  
}

void keyPressed() {
  example.keyPressed();
}