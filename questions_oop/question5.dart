import 'dart:math';

class Point {
  double x;
  double y;

  Point(this.x, this.y);

 
  double distanceFromOrigin() {
    return sqrt(x * x + y * y);
  }
}

void main () {
 
  
  Point point = Point(3, 4);

 
  double distance = point.distanceFromOrigin();

  print('Point coordinates: (${point.x}, ${point.y})');
  print('Distance from origin: $distance');
}
