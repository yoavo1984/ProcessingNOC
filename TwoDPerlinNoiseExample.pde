class TwoDPerlinNoiseExample extends Example {
  float xOff = 0;
  float yOff = 0;
  float increment = 0.01;
  int loops = 0;
  
  void update () {
    loadPixels();
    xOff = loops * increment;
    for (int x = 0; x < width; x++) {
      yOff = loops * increment;
      for (int y = 0; y < height; y++) {
        float bright = map(noise(xOff,yOff), 0 ,1 ,0, 255);
        pixels[x+y*width] = color(bright);
        yOff += 0.01;
      }
      xOff += 0.01;
    }
    updatePixels();
    
    loops++;
  }
}