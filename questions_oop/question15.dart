class Device {
  String type;
  String brand;
  int batteryLevel;

  Device(this.type, this.brand, this.batteryLevel);

  void show() {
    print('Device Type: $type');
    print('Brand: $brand');
    print('Battery Level: $batteryLevel'); 
    if (batteryLevel < 20) {
      print('Warning: Battery is low! )'); 
    }
  }
}

void main() {
  
  Device myDevice = Device('phone', 'Samsung', 15);
  myDevice.show();
}
