class Building {
  String address;
  int floors;
  int yearBuilt;

  
  Building(this.address, this.floors, this.yearBuilt);

  void show() {
    print('Address: $address');
    print('Number of Floors: $floors');
    print('Year Built: $yearBuilt'); 
    if (yearBuilt < 1950) {
      print('This is a Historic building.'); 
    }
  }
}

void main() {
  Building myBuilding = Building('10 El Horreya Street', 5, 1930);
  myBuilding.show();
}
