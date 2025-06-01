class Event {
  String name;
  String date;
  String location;
  int attendeeCount;

  Event(this.name, this.date, this.location, this.attendeeCount);

  void show() {
    print(name);
    print(location);
    if (attendeeCount > 100) {
      print('Big Event');
    }
  }
}

void main() {
  Event a = Event('Technical conference ', '2024-07-15', ' conference room', 150);
  a.show();
}
