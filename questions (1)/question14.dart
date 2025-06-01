class Room {
  String name;
  double length;
  double width;

  Room({required this.name, required this.length, required this.width});

  void show() {
    double area = length * width;
    print(name);
    print('Area: $area');
    if (area > 20) {
      print('Spacious room');
    }
  }
}

void main() {
  Room r = Room(name: 'Living Room', length: 5.5, width: 4.0);
  r.show();
}
