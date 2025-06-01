class Plant {
  String name;
  String type;
  bool needsWatering;

  
  Plant(this.name, this.type, this.needsWatering);

  void show() {
    print('Plant Name: $name');
    print('Plant Type: $type');
    if (needsWatering) {
      print('Water the plant');
      needsWatering = false; 
    }
  }
}

void main() {
  Plant myPlant = Plant('Cactus', 'Succulent', true);
  myPlant.show();
}
