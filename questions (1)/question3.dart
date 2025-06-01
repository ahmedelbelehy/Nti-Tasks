class Car {
  String make;
  String model;
  int year;
  double currentSpeed;

  
  Car(this.make, this.model, this.year, this.currentSpeed);
}

void main() {
  
  Car car = Car('Toyota', 'Camry', 2022, 130);

  
  print('Make: ${car.make}');
  print('Model: ${car.model}');

  
  if (car.currentSpeed > 120) {
    print('Over speed limit!');
  }
}
