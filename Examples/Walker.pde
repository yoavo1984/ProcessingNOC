class Walker {
  float x,y;
  float tx, ty;
  
  Walker () {
    tx = 0; 
    ty = 10000;
  }
  
  void step () {
    x = map(noise(tx), 0, 1, 50, 100);
    y = map(noise(ty), 0, 1, 50, 100);
    
    tx += 0.01;
    ty += 0.01;
  }
  
  void paint () {
    ellipse(x, y, 16, 16);
  }
  
 }