class Area {
  float _x;
  float _y;
  float _height;
  float _width;
  // A general area will simply be the entire processing screen.
  Area() {
    _x = 0;
    _y = 0;
    _height = height;
    _width = width;
  }
  
  Area(float x, float y, float areaWidth, float areaHeight) {
    _x = x;
    _y = y;
    _width = areaWidth;
    _height = areaHeight;
  }
  
  boolean includes(PhysicsObject object) {
    if (object.getX() < (_x + _width) && object.getX() > _x && object.getY() < (_y + _height) && object.getY() > _y ) {
      return true;
    }
    return false;
  }
}